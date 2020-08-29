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

import 'tutorial_model.dart';
import 'tutorial_component_event.dart';
import 'tutorial_component_state.dart';
import 'tutorial_repository.dart';
class TutorialBloc extends Bloc<TutorialEvent, TutorialState> {
  final TutorialRepository tutorialRepository;

  TutorialBloc({ this.tutorialRepository }): super(TutorialUninitialized());
  @override
  Stream<TutorialState> mapEventToState(TutorialEvent event) async* {
    final currentState = state;
    if (event is FetchTutorial) {
      try {
        if (currentState is TutorialUninitialized) {
          final TutorialModel model = await _fetchTutorial(event.id);

          if (model != null) {
            yield TutorialLoaded(value: model);
          } else {
            String id = event.id;
            yield TutorialError(message: "Tutorial with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield TutorialError(message: "Unknown error whilst retrieving Tutorial");
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


