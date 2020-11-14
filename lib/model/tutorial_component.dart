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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/app/app_bloc.dart';

import 'package:eliud_pkg_fundamentals/model/tutorial_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component_state.dart';

abstract class AbstractTutorialComponent extends StatelessWidget {
  static String componentName = "tutorials";
  final String tutorialID;

  AbstractTutorialComponent({this.tutorialID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TutorialComponentBloc> (
          create: (context) => TutorialComponentBloc(
            tutorialRepository: getTutorialRepository(context))
        ..add(FetchTutorialComponent(id: tutorialID)),
      child: _tutorialBlockBuilder(context),
    );
  }

  Widget _tutorialBlockBuilder(BuildContext context) {
    return BlocBuilder<TutorialComponentBloc, TutorialComponentState>(builder: (context, state) {
      if (state is TutorialComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No tutorial defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is TutorialComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, TutorialModel value);
  Widget alertWidget({ title: String, content: String});
  TutorialRepository getTutorialRepository(BuildContext context);
}


