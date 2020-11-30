import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_pkg_fundamentals/extensions/presentation/presentation_helper.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/registry.dart';
import 'package:flutter/material.dart';

class PresentationComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, String> parameters}) {
    return PresentationComponent(presentationID: id, parameters: parameters,);
  }
}

class PresentationComponent extends AbstractPresentationComponent {
  Map<String, String> parameters;

  PresentationComponent({String presentationID, this.parameters}) : super(presentationID: presentationID);

  @override
  Widget yourWidget(BuildContext context, PresentationModel value) {
    var widgets = value.bodyComponents
        .map((model) => Registry.registry().component(
        componentName: model.componentName, id: model.componentId, parameters: parameters))
        .toList();
    return PresentationHelper.makeContainingTable(context, widgets, value.image, value.imagePositionRelative, value.imageAlignment, value.imageWidth);
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  PresentationRepository getPresentationRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.presentationRepository(AccessBloc.appId(context));
  }
}