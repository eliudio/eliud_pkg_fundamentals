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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class PresentationListBloc extends Bloc<PresentationListEvent, PresentationListState> {
  final PresentationRepository _presentationRepository;
  StreamSubscription _presentationsListSubscription;
  final AccessBloc accessBloc;

  PresentationListBloc(this.accessBloc,{ @required PresentationRepository presentationRepository })
      : assert(presentationRepository != null),
      _presentationRepository = presentationRepository,
      super(PresentationListLoading());

  Stream<PresentationListState> _mapLoadPresentationListToState({ String orderBy, bool descending }) async* {
    _presentationsListSubscription?.cancel();
    _presentationsListSubscription = _presentationRepository.listen((list) => add(PresentationListUpdated(value: list)), orderBy: orderBy, descending: descending, );
  }

  Stream<PresentationListState> _mapLoadPresentationListWithDetailsToState() async* {
    _presentationsListSubscription?.cancel();
    _presentationsListSubscription = _presentationRepository.listenWithDetails((list) => add(PresentationListUpdated(value: list)), );
  }

  Stream<PresentationListState> _mapAddPresentationListToState(AddPresentationList event) async* {
    _presentationRepository.add(event.value);
  }

  Stream<PresentationListState> _mapUpdatePresentationListToState(UpdatePresentationList event) async* {
    _presentationRepository.update(event.value);
  }

  Stream<PresentationListState> _mapDeletePresentationListToState(DeletePresentationList event) async* {
    _presentationRepository.delete(event.value);
  }

  Stream<PresentationListState> _mapPresentationListUpdatedToState(PresentationListUpdated event) async* {
    yield PresentationListLoaded(values: event.value);
  }


  @override
  Stream<PresentationListState> mapEventToState(PresentationListEvent event) async* {
    final currentState = state;
    if (event is LoadPresentationList) {
      yield* _mapLoadPresentationListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadPresentationListWithDetails) {
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


