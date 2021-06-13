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
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_list_state.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';


const _tutorialLimit = 5;

class TutorialListBloc extends Bloc<TutorialListEvent, TutorialListState> {
  final TutorialRepository _tutorialRepository;
  StreamSubscription? _tutorialsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  TutorialListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required TutorialRepository tutorialRepository})
      : assert(tutorialRepository != null),
        _tutorialRepository = tutorialRepository,
        super(TutorialListLoading());

  Stream<TutorialListState> _mapLoadTutorialListToState() async* {
    int amountNow =  (state is TutorialListLoaded) ? (state as TutorialListLoaded).values!.length : 0;
    _tutorialsListSubscription?.cancel();
    _tutorialsListSubscription = _tutorialRepository.listen(
          (list) => add(TutorialListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _tutorialLimit : null
    );
  }

  Stream<TutorialListState> _mapLoadTutorialListWithDetailsToState() async* {
    int amountNow =  (state is TutorialListLoaded) ? (state as TutorialListLoaded).values!.length : 0;
    _tutorialsListSubscription?.cancel();
    _tutorialsListSubscription = _tutorialRepository.listenWithDetails(
            (list) => add(TutorialListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _tutorialLimit : null
    );
  }

  Stream<TutorialListState> _mapAddTutorialListToState(AddTutorialList event) async* {
    var value = event.value;
    if (value != null) 
      _tutorialRepository.add(value);
  }

  Stream<TutorialListState> _mapUpdateTutorialListToState(UpdateTutorialList event) async* {
    var value = event.value;
    if (value != null) 
      _tutorialRepository.update(value);
  }

  Stream<TutorialListState> _mapDeleteTutorialListToState(DeleteTutorialList event) async* {
    var value = event.value;
    if (value != null) 
      _tutorialRepository.delete(value);
  }

  Stream<TutorialListState> _mapTutorialListUpdatedToState(
      TutorialListUpdated event) async* {
    yield TutorialListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<TutorialListState> mapEventToState(TutorialListEvent event) async* {
    if (event is LoadTutorialList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadTutorialListToState();
      } else {
        yield* _mapLoadTutorialListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


