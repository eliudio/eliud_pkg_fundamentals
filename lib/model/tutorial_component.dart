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
import 'package:eliud_pkg_fundamentals/model/tutorial_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractTutorialComponent extends StatelessWidget {
  static String componentName = "tutorials";
  final AppModel app;
  final String tutorialId;

  AbstractTutorialComponent({Key? key, required this.app, required this.tutorialId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TutorialComponentBloc> (
          create: (context) => TutorialComponentBloc(
            tutorialRepository: tutorialRepository(appId: app.documentID)!)
        ..add(FetchTutorialComponent(id: tutorialId)),
      child: _tutorialBlockBuilder(context),
    );
  }

  Widget _tutorialBlockBuilder(BuildContext context) {
    return BlocBuilder<TutorialComponentBloc, TutorialComponentState>(builder: (context, state) {
      if (state is TutorialComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is TutorialComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is TutorialComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, TutorialModel value);
}

