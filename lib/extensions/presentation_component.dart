import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_pkg_fundamentals/extensions/presentation/presentation_helper.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';
import 'package:flutter/material.dart';

class PresentationComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String id, Map<String, dynamic>? parameters}) {
    return PresentationComponent(key: key, presentationID: id, parameters: parameters,);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async => await presentationRepository(appId: appId)!.get(id);
}

class PresentationComponent extends AbstractPresentationComponent {
  Map<String, dynamic>? parameters;

  PresentationComponent({Key? key, required String presentationID, this.parameters}) : super(key: key, presentationID: presentationID);

  @override
  Widget yourWidget(BuildContext context, PresentationModel? value) {
    var appLoaded = AccessBloc.getState(context);
    if (appLoaded is AppLoaded) {
      var widgets = value!.bodyComponents!
          .map((model) =>
          Registry.registry()!.component(appLoaded,
              model.componentName!, model.componentId!, parameters: parameters))
          .toList();
      return PresentationHelper.makeContainingTable(
          context, widgets, value.image, value.imagePositionRelative,
          value.imageAlignment, value.imageWidth);
    } else {
      return text(context, 'App not loaded');
    }
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  PresentationRepository getPresentationRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.presentationRepository(AccessBloc.appId(context))!;
  }
}