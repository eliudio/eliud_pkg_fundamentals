/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'document_component_bloc.dart';
import 'document_component_event.dart';
import 'document_model.dart';
import 'document_repository.dart';
import 'document_component_state.dart';

abstract class AbstractDocumentComponent extends StatelessWidget {
  static String componentName = "documents";
  final String documentID;

  AbstractDocumentComponent({this.documentID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DocumentBloc> (
          create: (context) => DocumentBloc(
            documentRepository: getDocumentRepository())
        ..add(FetchDocument(id: documentID)),
      child: _documentBlockBuilder(context),
    );
  }

  Widget _documentBlockBuilder(BuildContext context) {
    return BlocBuilder<DocumentBloc, DocumentState>(builder: (context, state) {
      if (state is DocumentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No document defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is DocumentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, DocumentModel value);
  Widget alertWidget({ title: String, content: String});
  DocumentRepository getDocumentRepository();
}


