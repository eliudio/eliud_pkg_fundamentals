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
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_list_state.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';


const _presentationLimit = 5;

class PresentationListBloc extends Bloc<PresentationListEvent, PresentationListState> {
  final PresentationRepository _presentationRepository;
  StreamSubscription? _presentationsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  PresentationListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required PresentationRepository presentationRepository})
      : assert(presentationRepository != null),
        _presentationRepository = presentationRepository,
        super(PresentationListLoading());

  Stream<PresentationListState> _mapLoadPresentationListToState() async* {
    int amountNow =  (state is PresentationListLoaded) ? (state as PresentationListLoaded).values!.length : 0;
    _presentationsListSubscription?.cancel();
    _presentationsListSubscription = _presentationRepository.listen(
          (list) => add(PresentationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _presentationLimit : null
    );
  }

  Stream<PresentationListState> _mapLoadPresentationListWithDetailsToState() async* {
    int amountNow =  (state is PresentationListLoaded) ? (state as PresentationListLoaded).values!.length : 0;
    _presentationsListSubscription?.cancel();
    _presentationsListSubscription = _presentationRepository.listenWithDetails(
            (list) => add(PresentationListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _presentationLimit : null
    );
  }

  Stream<PresentationListState> _mapAddPresentationListToState(AddPresentationList event) async* {
    var value = event.value;
    if (value != null) 
      _presentationRepository.add(value);
  }

  Stream<PresentationListState> _mapUpdatePresentationListToState(UpdatePresentationList event) async* {
    var value = event.value;
    if (value != null) 
      _presentationRepository.update(value);
  }

  Stream<PresentationListState> _mapDeletePresentationListToState(DeletePresentationList event) async* {
    var value = event.value;
    if (value != null) 
      _presentationRepository.delete(value);
  }

  Stream<PresentationListState> _mapPresentationListUpdatedToState(
      PresentationListUpdated event) async* {
    yield PresentationListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<PresentationListState> mapEventToState(PresentationListEvent event) async* {
    if (event is LoadPresentationList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadPresentationListToState();
      } else {
        yield* _mapLoadPresentationListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadPresentationListWithDetailsToState();
    } else if (event is AddPresentationList) {
      yield* _mapAddPresentationListToState(event);
    } else if (event is UpdatePresentationList) {
      yield* _mapUpdatePresentationListToState(event);
    } else if (event is DeletePresentationList) {
      yield* _mapDeletePresentationListToState(event);
    } else if (event is PresentationListUpdated) {
      yield* _mapPresentationListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _presentationsListSubscription?.cancel();
    return super.close();
  }
}


