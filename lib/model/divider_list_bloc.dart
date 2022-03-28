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
import 'package:eliud_core/tools/query/query_tools.dart';



class DividerListBloc extends Bloc<DividerListEvent, DividerListState> {
  final DividerRepository _dividerRepository;
  StreamSubscription? _dividersListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int dividerLimit;

  DividerListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DividerRepository dividerRepository, this.dividerLimit = 5})
      : assert(dividerRepository != null),
        _dividerRepository = dividerRepository,
        super(DividerListLoading());

  Stream<DividerListState> _mapLoadDividerListToState() async* {
    int amountNow =  (state is DividerListLoaded) ? (state as DividerListLoaded).values!.length : 0;
    _dividersListSubscription?.cancel();
    _dividersListSubscription = _dividerRepository.listen(
          (list) => add(DividerListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * dividerLimit : null
    );
  }

  Stream<DividerListState> _mapLoadDividerListWithDetailsToState() async* {
    int amountNow =  (state is DividerListLoaded) ? (state as DividerListLoaded).values!.length : 0;
    _dividersListSubscription?.cancel();
    _dividersListSubscription = _dividerRepository.listenWithDetails(
            (list) => add(DividerListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * dividerLimit : null
    );
  }

  Stream<DividerListState> _mapAddDividerListToState(AddDividerList event) async* {
    var value = event.value;
    if (value != null) 
      _dividerRepository.add(value);
  }

  Stream<DividerListState> _mapUpdateDividerListToState(UpdateDividerList event) async* {
    var value = event.value;
    if (value != null) 
      _dividerRepository.update(value);
  }

  Stream<DividerListState> _mapDeleteDividerListToState(DeleteDividerList event) async* {
    var value = event.value;
    if (value != null) 
      _dividerRepository.delete(value);
  }

  Stream<DividerListState> _mapDividerListUpdatedToState(
      DividerListUpdated event) async* {
    yield DividerListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<DividerListState> mapEventToState(DividerListEvent event) async* {
    if (event is LoadDividerList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadDividerListToState();
      } else {
        yield* _mapLoadDividerListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadDividerListWithDetailsToState();
    } else if (event is DividerChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadDividerListToState();
      } else {
        yield* _mapLoadDividerListWithDetailsToState();
      }
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


