/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_fundamentals/model/tutorial_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractTutorialComponent extends StatelessWidget {
  static String componentName = "tutorials";
  final String theAppId;
  final String tutorialId;

  AbstractTutorialComponent({Key? key, required this.theAppId, required this.tutorialId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TutorialComponentBloc> (
          create: (context) => TutorialComponentBloc(
            tutorialRepository: tutorialRepository(appId: theAppId)!)
        ..add(FetchTutorialComponent(id: tutorialId)),
      child: _tutorialBlockBuilder(context),
    );
  }

  Widget _tutorialBlockBuilder(BuildContext context) {
    return BlocBuilder<TutorialComponentBloc, TutorialComponentState>(builder: (context, state) {
      if (state is TutorialComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Tutorial defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is TutorialComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is TutorialComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, TutorialModel value);
}

