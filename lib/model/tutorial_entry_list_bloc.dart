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
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_list_state.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_repository.dart';


const _tutorialEntryLimit = 5;

class TutorialEntryListBloc extends Bloc<TutorialEntryListEvent, TutorialEntryListState> {
  final TutorialEntryRepository _tutorialEntryRepository;
  StreamSubscription? _tutorialEntrysListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  TutorialEntryListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required TutorialEntryRepository tutorialEntryRepository})
      : assert(tutorialEntryRepository != null),
        _tutorialEntryRepository = tutorialEntryRepository,
        super(TutorialEntryListLoading());

  Stream<TutorialEntryListState> _mapLoadTutorialEntryListToState() async* {
    int amountNow =  (state is TutorialEntryListLoaded) ? (state as TutorialEntryListLoaded).values!.length : 0;
    _tutorialEntrysListSubscription?.cancel();
    _tutorialEntrysListSubscription = _tutorialEntryRepository.listen(
          (list) => add(TutorialEntryListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _tutorialEntryLimit : null
    );
  }

  Stream<TutorialEntryListState> _mapLoadTutorialEntryListWithDetailsToState() async* {
    int amountNow =  (state is TutorialEntryListLoaded) ? (state as TutorialEntryListLoaded).values!.length : 0;
    _tutorialEntrysListSubscription?.cancel();
    _tutorialEntrysListSubscription = _tutorialEntryRepository.listenWithDetails(
            (list) => add(TutorialEntryListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _tutorialEntryLimit : null
    );
  }

  Stream<TutorialEntryListState> _mapAddTutorialEntryListToState(AddTutorialEntryList event) async* {
    var value = event.value;
    if (value != null) 
      _tutorialEntryRepository.add(value);
  }

  Stream<TutorialEntryListState> _mapUpdateTutorialEntryListToState(UpdateTutorialEntryList event) async* {
    var value = event.value;
    if (value != null) 
      _tutorialEntryRepository.update(value);
  }

  Stream<TutorialEntryListState> _mapDeleteTutorialEntryListToState(DeleteTutorialEntryList event) async* {
    var value = event.value;
    if (value != null) 
      _tutorialEntryRepository.delete(value);
  }

  Stream<TutorialEntryListState> _mapTutorialEntryListUpdatedToState(
      TutorialEntryListUpdated event) async* {
    yield TutorialEntryListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<TutorialEntryListState> mapEventToState(TutorialEntryListEvent event) async* {
    if (event is LoadTutorialEntryList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadTutorialEntryListToState();
      } else {
        yield* _mapLoadTutorialEntryListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


