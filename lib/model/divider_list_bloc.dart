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
        super(DividerListLoading()) {
    on <LoadDividerList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDividerListToState();
      } else {
        _mapLoadDividerListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadDividerListWithDetailsToState();
    });
    
    on <DividerChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDividerListToState();
      } else {
        _mapLoadDividerListWithDetailsToState();
      }
    });
      
    on <AddDividerList> ((event, emit) async {
      await _mapAddDividerListToState(event);
    });
    
    on <UpdateDividerList> ((event, emit) async {
      await _mapUpdateDividerListToState(event);
    });
    
    on <DeleteDividerList> ((event, emit) async {
      await _mapDeleteDividerListToState(event);
    });
    
    on <DividerListUpdated> ((event, emit) {
      emit(_mapDividerListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadDividerListToState() async {
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

  Future<void> _mapLoadDividerListWithDetailsToState() async {
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

  Future<void> _mapAddDividerListToState(AddDividerList event) async {
    var value = event.value;
    if (value != null) {
      await _dividerRepository.add(value);
    }
  }

  Future<void> _mapUpdateDividerListToState(UpdateDividerList event) async {
    var value = event.value;
    if (value != null) {
      await _dividerRepository.update(value);
    }
  }

  Future<void> _mapDeleteDividerListToState(DeleteDividerList event) async {
    var value = event.value;
    if (value != null) {
      await _dividerRepository.delete(value);
    }
  }

  DividerListLoaded _mapDividerListUpdatedToState(
      DividerListUpdated event) => DividerListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _dividersListSubscription?.cancel();
    return super.close();
  }
}


