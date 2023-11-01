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

import 'package:eliud_pkg_fundamentals/model/tutorial_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';

class TutorialComponentBloc extends Bloc<TutorialComponentEvent, TutorialComponentState> {
  final TutorialRepository? tutorialRepository;
  StreamSubscription? _tutorialSubscription;

  void _mapLoadTutorialComponentUpdateToState(String documentId) {
    _tutorialSubscription?.cancel();
    _tutorialSubscription = tutorialRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(TutorialComponentUpdated(value: value));
      }
    });
  }

  TutorialComponentBloc({ this.tutorialRepository }): super(TutorialComponentUninitialized()) {
    on <FetchTutorialComponent> ((event, emit) {
      _mapLoadTutorialComponentUpdateToState(event.id!);
    });
    on <TutorialComponentUpdated> ((event, emit) {
      emit(TutorialComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _tutorialSubscription?.cancel();
    return super.close();
  }

}

