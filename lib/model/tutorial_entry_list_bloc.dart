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
import 'package:eliud_core/tools/query/query_tools.dart';



class TutorialEntryListBloc extends Bloc<TutorialEntryListEvent, TutorialEntryListState> {
  final TutorialEntryRepository _tutorialEntryRepository;
  StreamSubscription? _tutorialEntrysListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int tutorialEntryLimit;

  TutorialEntryListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required TutorialEntryRepository tutorialEntryRepository, this.tutorialEntryLimit = 5})
      : assert(tutorialEntryRepository != null),
        _tutorialEntryRepository = tutorialEntryRepository,
        super(TutorialEntryListLoading()) {
    on <LoadTutorialEntryList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadTutorialEntryListToState();
      } else {
        _mapLoadTutorialEntryListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadTutorialEntryListWithDetailsToState();
    });
    
    on <TutorialEntryChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadTutorialEntryListToState();
      } else {
        _mapLoadTutorialEntryListWithDetailsToState();
      }
    });
      
    on <AddTutorialEntryList> ((event, emit) async {
      await _mapAddTutorialEntryListToState(event);
    });
    
    on <UpdateTutorialEntryList> ((event, emit) async {
      await _mapUpdateTutorialEntryListToState(event);
    });
    
    on <DeleteTutorialEntryList> ((event, emit) async {
      await _mapDeleteTutorialEntryListToState(event);
    });
    
    on <TutorialEntryListUpdated> ((event, emit) {
      emit(_mapTutorialEntryListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadTutorialEntryListToState() async {
    int amountNow =  (state is TutorialEntryListLoaded) ? (state as TutorialEntryListLoaded).values!.length : 0;
    _tutorialEntrysListSubscription?.cancel();
    _tutorialEntrysListSubscription = _tutorialEntryRepository.listen(
          (list) => add(TutorialEntryListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * tutorialEntryLimit : null
    );
  }

  Future<void> _mapLoadTutorialEntryListWithDetailsToState() async {
    int amountNow =  (state is TutorialEntryListLoaded) ? (state as TutorialEntryListLoaded).values!.length : 0;
    _tutorialEntrysListSubscription?.cancel();
    _tutorialEntrysListSubscription = _tutorialEntryRepository.listenWithDetails(
            (list) => add(TutorialEntryListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * tutorialEntryLimit : null
    );
  }

  Future<void> _mapAddTutorialEntryListToState(AddTutorialEntryList event) async {
    var value = event.value;
    if (value != null) {
      await _tutorialEntryRepository.add(value);
    }
  }

  Future<void> _mapUpdateTutorialEntryListToState(UpdateTutorialEntryList event) async {
    var value = event.value;
    if (value != null) {
      await _tutorialEntryRepository.update(value);
    }
  }

  Future<void> _mapDeleteTutorialEntryListToState(DeleteTutorialEntryList event) async {
    var value = event.value;
    if (value != null) {
      await _tutorialEntryRepository.delete(value);
    }
  }

  TutorialEntryListLoaded _mapTutorialEntryListUpdatedToState(
      TutorialEntryListUpdated event) => TutorialEntryListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _tutorialEntrysListSubscription?.cancel();
    return super.close();
  }
}


