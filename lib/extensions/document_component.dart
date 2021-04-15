import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/document_component.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_repository.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_pkg_fundamentals/tools/document_renderer.dart';
import 'package:flutter/material.dart';

class DocumentComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({String? id, Map<String, dynamic>? parameters}) {
    return DocumentComponent(documentID: id);
  }
}

class DocumentComponent extends AbstractDocumentComponent {
  DocumentComponent({String? documentID}) : super(documentID: documentID);

  @override
  Widget yourWidget(BuildContext context, DocumentModel? value) {
    return DocumentRendererTool().render(context, value!.documentRenderer, value.content!, value.images, value.background);
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  DocumentRepository getDocumentRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.documentRepository(AccessBloc.appId(context))!;
  }
}
