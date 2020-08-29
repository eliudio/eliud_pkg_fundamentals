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

import 'tutorial_component_bloc.dart';
import 'tutorial_component_event.dart';
import 'tutorial_model.dart';
import 'tutorial_repository.dart';
import 'tutorial_component_state.dart';

abstract class AbstractTutorialComponent extends StatelessWidget {
  static String componentName = "tutorials";
  final String tutorialID;

  AbstractTutorialComponent({this.tutorialID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TutorialBloc> (
          create: (context) => TutorialBloc(
            tutorialRepository: getTutorialRepository())
        ..add(FetchTutorial(id: tutorialID)),
      child: _tutorialBlockBuilder(context),
    );
  }

  Widget _tutorialBlockBuilder(BuildContext context) {
    return BlocBuilder<TutorialBloc, TutorialState>(builder: (context, state) {
      if (state is TutorialLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No tutorial defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is TutorialError) {
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
  TutorialRepository getTutorialRepository();
}


