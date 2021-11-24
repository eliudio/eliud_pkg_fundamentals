/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_fundamentals/model/presentation_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractPresentationComponent extends StatelessWidget {
  static String componentName = "presentations";
  final String theAppId;
  final String presentationId;

  AbstractPresentationComponent({Key? key, required this.theAppId, required this.presentationId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PresentationComponentBloc> (
          create: (context) => PresentationComponentBloc(
            presentationRepository: presentationRepository(appId: theAppId)!)
        ..add(FetchPresentationComponent(id: presentationId)),
      child: _presentationBlockBuilder(context),
    );
  }

  Widget _presentationBlockBuilder(BuildContext context) {
    return BlocBuilder<PresentationComponentBloc, PresentationComponentState>(builder: (context, state) {
      if (state is PresentationComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Presentation defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PresentationComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PresentationComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PresentationModel value);
}

