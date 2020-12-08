/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/tutorial_entry_repository.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_list_state.dart';


class TutorialEntryListBloc extends Bloc<TutorialEntryListEvent, TutorialEntryListState> {
  final TutorialEntryRepository _tutorialEntryRepository;
  StreamSubscription _tutorialEntrysListSubscription;

  TutorialEntryListBloc({ @required TutorialEntryRepository tutorialEntryRepository })
      : assert(tutorialEntryRepository != null),
      _tutorialEntryRepository = tutorialEntryRepository,
      super(TutorialEntryListLoading());

  Stream<TutorialEntryListState> _mapLoadTutorialEntryListToState({ String orderBy, bool descending }) async* {
    _tutorialEntrysListSubscription?.cancel();
    _tutorialEntrysListSubscription = _tutorialEntryRepository.listen( (list) => add(TutorialEntryListUpdated(value: list)), orderBy: orderBy, descending: descending);
  }

  Stream<TutorialEntryListState> _mapLoadTutorialEntryListWithDetailsToState() async* {
    _tutorialEntrysListSubscription?.cancel();
    _tutorialEntrysListSubscription = _tutorialEntryRepository.listenWithDetails( (list) => add(TutorialEntryListUpdated(value: list)));
  }

  Stream<TutorialEntryListState> _mapAddTutorialEntryListToState(AddTutorialEntryList event) async* {
    _tutorialEntryRepository.add(event.value);
  }

  Stream<TutorialEntryListState> _mapUpdateTutorialEntryListToState(UpdateTutorialEntryList event) async* {
    _tutorialEntryRepository.update(event.value);
  }

  Stream<TutorialEntryListState> _mapDeleteTutorialEntryListToState(DeleteTutorialEntryList event) async* {
    _tutorialEntryRepository.delete(event.value);
  }

  Stream<TutorialEntryListState> _mapTutorialEntryListUpdatedToState(TutorialEntryListUpdated event) async* {
    yield TutorialEntryListLoaded(values: event.value);
  }


  @override
  Stream<TutorialEntryListState> mapEventToState(TutorialEntryListEvent event) async* {
    final currentState = state;
    if (event is LoadTutorialEntryList) {
      yield* _mapLoadTutorialEntryListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadTutorialEntryListWithDetails) {
      yield* _mapLoadTutorialEntryListWithDetailsToState();
    } else if (event is AddTutorialEntryList) {
      yield* _mapAddTutorialEntryListToState(event);
    } else if (event is UpdateTutorialEntryList) {
      yield* _mapUpdateTutorialEntryListToState(event);
    } else if (event is DeleteTutorialEntryList) {
      yield* _mapDeleteTutorialEntryListToState(event);
    } else if (event is TutorialEntryListUpdated) {
      yield* _mapTutorialEntryListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _tutorialEntrysListSubscription?.cancel();
    return super.close();
  }

}


