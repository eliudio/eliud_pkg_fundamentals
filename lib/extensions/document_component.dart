import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
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
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return DocumentComponent(key: key, app: app, documentId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await documentRepository(appId: app.documentID)!.get(id);
}

class DocumentComponent extends AbstractDocumentComponent {
  DocumentComponent(
      {Key? key, required AppModel app, required String documentId})
      : super(key: key, app: app, documentId: documentId);

  @override
  Widget yourWidget(BuildContext context, DocumentModel? value) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        return DocumentRendererTool().render(app,
            context,
            accessState.getMember(),
            value!.content!,
            value.images,
            value.background);
      } else {
        return progressIndicator(app, context);
      }
    });
  }
}
