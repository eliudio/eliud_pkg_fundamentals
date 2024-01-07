import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_pkg_fundamentals/extensions/presentation/platform_presentation_helper.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_component.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_model.dart';
import 'package:flutter/material.dart';

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
      await presentationRepository(appId: app.documentID)!.get(id);
}

class PresentationComponent extends AbstractPresentationComponent {
  final Map<String, dynamic>? parameters;

  PresentationComponent(
      {super.key,
      required super.app,
      required super.presentationId,
      this.parameters});

  @override
  Widget yourWidget(BuildContext context, PresentationModel? value) {
    var widgets = value!.bodyComponents!
        .map((model) => Apis.apis().getRegistryApi().component(
            context, app, model.componentName!, model.componentId!,
            parameters: parameters))
        .toList();
    return PlatformPresentationHelper.makeContainingTable(
        context,
        widgets,
        value.image,
        value.imagePositionRelative,
        value.imageAlignment,
        value.imageWidth);
  }
}
