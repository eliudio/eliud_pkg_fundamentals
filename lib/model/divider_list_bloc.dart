/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/divider_repository.dart';
import 'package:eliud_pkg_fundamentals/model/divider_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/divider_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class DividerListBloc extends Bloc<DividerListEvent, DividerListState> {
  final DividerRepository _dividerRepository;
  StreamSubscription _dividersListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  DividerListBloc(this.accessBloc,{ this.eliudQuery, @required DividerRepository dividerRepository })
      : assert(dividerRepository != null),
      _dividerRepository = dividerRepository,
      super(DividerListLoading());

  Stream<DividerListState> _mapLoadDividerListToState({ String orderBy, bool descending }) async* {
    _dividersListSubscription?.cancel();
    _dividersListSubscription = _dividerRepository.listen((list) => add(DividerListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<DividerListState> _mapLoadDividerListWithDetailsToState() async* {
    _dividersListSubscription?.cancel();
    _dividersListSubscription = _dividerRepository.listenWithDetails((list) => add(DividerListUpdated(value: list)), );
  }

  Stream<DividerListState> _mapAddDividerListToState(AddDividerList event) async* {
    _dividerRepository.add(event.value);
  }

  Stream<DividerListState> _mapUpdateDividerListToState(UpdateDividerList event) async* {
    _dividerRepository.update(event.value);
  }

  Stream<DividerListState> _mapDeleteDividerListToState(DeleteDividerList event) async* {
    _dividerRepository.delete(event.value);
  }

  Stream<DividerListState> _mapDividerListUpdatedToState(DividerListUpdated event) async* {
    yield DividerListLoaded(values: event.value);
  }


  @override
  Stream<DividerListState> mapEventToState(DividerListEvent event) async* {
    final currentState = state;
    if (event is LoadDividerList) {
      yield* _mapLoadDividerListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadDividerListWithDetails) {
      yield* _mapLoadDividerListWithDetailsToState();
    } else if (event is AddDividerList) {
      yield* _mapAddDividerListToState(event);
    } else if (event is UpdateDividerList) {
      yield* _mapUpdateDividerListToState(event);
    } else if (event is DeleteDividerList) {
      yield* _mapDeleteDividerListToState(event);
    } else if (event is DividerListUpdated) {
      yield* _mapDividerListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _dividersListSubscription?.cancel();
    return super.close();
  }

}


