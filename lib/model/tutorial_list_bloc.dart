/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_list_state.dart';


class TutorialListBloc extends Bloc<TutorialListEvent, TutorialListState> {
  final TutorialRepository _tutorialRepository;
  StreamSubscription _tutorialsListSubscription;

  TutorialListBloc({ @required TutorialRepository tutorialRepository })
      : assert(tutorialRepository != null),
      _tutorialRepository = tutorialRepository,
      super(TutorialListLoading());

  Stream<TutorialListState> _mapLoadTutorialListToState() async* {
    _tutorialsListSubscription?.cancel();
    _tutorialsListSubscription = _tutorialRepository.listen((list) => add(TutorialListUpdated(value: list)));
  }

  Stream<TutorialListState> _mapLoadTutorialListWithDetailsToState() async* {
    _tutorialsListSubscription?.cancel();
    _tutorialsListSubscription = _tutorialRepository.listenWithDetails((list) => add(TutorialListUpdated(value: list)));
  }

  Stream<TutorialListState> _mapAddTutorialListToState(AddTutorialList event) async* {
    _tutorialRepository.add(event.value);
  }

  Stream<TutorialListState> _mapUpdateTutorialListToState(UpdateTutorialList event) async* {
    _tutorialRepository.update(event.value);
  }

  Stream<TutorialListState> _mapDeleteTutorialListToState(DeleteTutorialList event) async* {
    _tutorialRepository.delete(event.value);
  }

  Stream<TutorialListState> _mapTutorialListUpdatedToState(TutorialListUpdated event) async* {
    yield TutorialListLoaded(values: event.value);
  }


  @override
  Stream<TutorialListState> mapEventToState(TutorialListEvent event) async* {
    final currentState = state;
    if (event is LoadTutorialList) {
      yield* _mapLoadTutorialListToState();
    } if (event is LoadTutorialListWithDetails) {
      yield* _mapLoadTutorialListWithDetailsToState();
    } else if (event is AddTutorialList) {
      yield* _mapAddTutorialListToState(event);
    } else if (event is UpdateTutorialList) {
      yield* _mapUpdateTutorialListToState(event);
    } else if (event is DeleteTutorialList) {
      yield* _mapDeleteTutorialListToState(event);
    } else if (event is TutorialListUpdated) {
      yield* _mapTutorialListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _tutorialsListSubscription?.cancel();
    return super.close();
  }

}


