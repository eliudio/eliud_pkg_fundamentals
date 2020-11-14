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
import 'package:eliud_core/core/app/app_bloc.dart';

import 'package:eliud_pkg_fundamentals/model/document_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/document_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_repository.dart';
import 'package:eliud_pkg_fundamentals/model/document_component_state.dart';

abstract class AbstractDocumentComponent extends StatelessWidget {
  static String componentName = "documents";
  final String documentID;

  AbstractDocumentComponent({this.documentID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DocumentComponentBloc> (
          create: (context) => DocumentComponentBloc(
            documentRepository: getDocumentRepository(context))
        ..add(FetchDocumentComponent(id: documentID)),
      child: _documentBlockBuilder(context),
    );
  }

  Widget _documentBlockBuilder(BuildContext context) {
    return BlocBuilder<DocumentComponentBloc, DocumentComponentState>(builder: (context, state) {
      if (state is DocumentComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No document defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is DocumentComponentError) {
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
  DocumentRepository getDocumentRepository(BuildContext context);
}


