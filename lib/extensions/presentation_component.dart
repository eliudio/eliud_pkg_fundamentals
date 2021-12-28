import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_pkg_fundamentals/extensions/presentation/presentation_helper.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresentationComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return PresentationComponent(
      key: key,
      app: app,
      presentationId: id,
      parameters: parameters,
    );
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await presentationRepository(appId: app.documentID!)!.get(id);
}

class PresentationComponent extends AbstractPresentationComponent {
  Map<String, dynamic>? parameters;

  PresentationComponent(
      {Key? key,
      required AppModel app,
      required String presentationId,
      this.parameters})
      : super(key: key, app: app, presentationId: presentationId);

  @override
  Widget yourWidget(BuildContext context, PresentationModel? value) {
    var widgets = value!.bodyComponents!
        .map((model) => Registry.registry()!.component(
            context, app, model.componentName!, model.componentId!,
            parameters: parameters))
        .toList();
    return PresentationHelper.makeContainingTable(context, widgets, value.image,
        value.imagePositionRelative, value.imageAlignment, value.imageWidth);
  }
}
