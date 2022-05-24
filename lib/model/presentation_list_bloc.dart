/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class PresentationListBloc extends Bloc<PresentationListEvent, PresentationListState> {
  final PresentationRepository _presentationRepository;
  StreamSubscription? _presentationsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int presentationLimit;

  PresentationListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required PresentationRepository presentationRepository, this.presentationLimit = 5})
      : assert(presentationRepository != null),
        _presentationRepository = presentationRepository,
        super(PresentationListLoading()) {
    on <LoadPresentationList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPresentationListToState();
      } else {
        _mapLoadPresentationListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadPresentationListWithDetailsToState();
    });
    
    on <PresentationChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPresentationListToState();
      } else {
        _mapLoadPresentationListWithDetailsToState();
      }
    });
      
    on <AddPresentationList> ((event, emit) async {
      await _mapAddPresentationListToState(event);
    });
    
    on <UpdatePresentationList> ((event, emit) async {
      await _mapUpdatePresentationListToState(event);
    });
    
    on <DeletePresentationList> ((event, emit) async {
      await _mapDeletePresentationListToState(event);
    });
    
    on <PresentationListUpdated> ((event, emit) {
      emit(_mapPresentationListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadPresentationListToState() async {
    int amountNow =  (state is PresentationListLoaded) ? (state as PresentationListLoaded).values!.length : 0;
    _presentationsListSubscription?.cancel();
    _presentationsListSubscription = _presentationRepository.listen(
          (list) => add(PresentationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * presentationLimit : null
    );
  }

  Future<void> _mapLoadPresentationListWithDetailsToState() async {
    int amountNow =  (state is PresentationListLoaded) ? (state as PresentationListLoaded).values!.length : 0;
    _presentationsListSubscription?.cancel();
    _presentationsListSubscription = _presentationRepository.listenWithDetails(
            (list) => add(PresentationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * presentationLimit : null
    );
  }

  Future<void> _mapAddPresentationListToState(AddPresentationList event) async {
    var value = event.value;
    if (value != null) {
      await _presentationRepository.add(value);
    }
  }

  Future<void> _mapUpdatePresentationListToState(UpdatePresentationList event) async {
    var value = event.value;
    if (value != null) {
      await _presentationRepository.update(value);
    }
  }

  Future<void> _mapDeletePresentationListToState(DeletePresentationList event) async {
    var value = event.value;
    if (value != null) {
      await _presentationRepository.delete(value);
    }
  }

  PresentationListLoaded _mapPresentationListUpdatedToState(
      PresentationListUpdated event) => PresentationListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _presentationsListSubscription?.cancel();
    return super.close();
  }
}


