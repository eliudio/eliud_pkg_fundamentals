import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/document_component.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_repository.dart';
import 'package:eliud_pkg_fundamentals/tools/document_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String id, Map<String, dynamic>? parameters}) {
    return DocumentComponent(key: key, documentID: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async => await documentRepository(appId: appId)!.get(id);
}

class DocumentComponent extends AbstractDocumentComponent {
  DocumentComponent({Key? key, required String documentID}) : super(key: key, documentID: documentID);

  @override
  Widget yourWidget(BuildContext context, DocumentModel? value) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
          if (accessState is AccessDetermined) {
            return DocumentRendererTool().render(context, accessState, value!.documentRenderer, value.content!, value.images, value.background);
          } else {
            return progressIndicator(context);
          }
        });
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  DocumentRepository getDocumentRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.documentRepository(AccessBloc.currentAppId(context))!;
  }
}
