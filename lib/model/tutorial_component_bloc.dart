/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';
class TutorialComponentBloc extends Bloc<TutorialComponentEvent, TutorialComponentState> {
  final TutorialRepository tutorialRepository;

  TutorialComponentBloc({ this.tutorialRepository }): super(TutorialComponentUninitialized());
  @override
  Stream<TutorialComponentState> mapEventToState(TutorialComponentEvent event) async* {
    final currentState = state;
    if (event is FetchTutorialComponent) {
      try {
        if (currentState is TutorialComponentUninitialized) {
          final TutorialModel model = await _fetchTutorial(event.id);

          if (model != null) {
            yield TutorialComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield TutorialComponentError(message: "Tutorial with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield TutorialComponentError(message: "Unknown error whilst retrieving Tutorial");
      }
    }
  }

  Future<TutorialModel> _fetchTutorial(String id) async {
    return tutorialRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


