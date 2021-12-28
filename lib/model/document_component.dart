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


import 'package:eliud_pkg_fundamentals/model/document_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/document_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_repository.dart';
import 'package:eliud_pkg_fundamentals/model/document_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractDocumentComponent extends StatelessWidget {
  static String componentName = "documents";
  final AppModel app;
  final String documentId;

  AbstractDocumentComponent({Key? key, required this.app, required this.documentId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DocumentComponentBloc> (
          create: (context) => DocumentComponentBloc(
            documentRepository: documentRepository(appId: app.documentID!)!)
        ..add(FetchDocumentComponent(id: documentId)),
      child: _documentBlockBuilder(context),
    );
  }

  Widget _documentBlockBuilder(BuildContext context) {
    return BlocBuilder<DocumentComponentBloc, DocumentComponentState>(builder: (context, state) {
      if (state is DocumentComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(app: app, title: "Error", content: 'No Document defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is DocumentComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is DocumentComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, DocumentModel value);
}

