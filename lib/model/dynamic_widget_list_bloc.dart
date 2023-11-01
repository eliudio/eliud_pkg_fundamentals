/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/dynamic_widget_repository.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'dynamic_widget_model.dart';

typedef List<DynamicWidgetModel?> FilterDynamicWidgetModels(List<DynamicWidgetModel?> values);



class DynamicWidgetListBloc extends Bloc<DynamicWidgetListEvent, DynamicWidgetListState> {
  final FilterDynamicWidgetModels? filter;
  final DynamicWidgetRepository _dynamicWidgetRepository;
  StreamSubscription? _dynamicWidgetsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int dynamicWidgetLimit;

  DynamicWidgetListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DynamicWidgetRepository dynamicWidgetRepository, this.dynamicWidgetLimit = 5})
      : _dynamicWidgetRepository = dynamicWidgetRepository,
        super(DynamicWidgetListLoading()) {
    on <LoadDynamicWidgetList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDynamicWidgetListToState();
      } else {
        _mapLoadDynamicWidgetListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadDynamicWidgetListWithDetailsToState();
    });
    
    on <DynamicWidgetChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDynamicWidgetListToState();
      } else {
        _mapLoadDynamicWidgetListWithDetailsToState();
      }
    });
      
    on <AddDynamicWidgetList> ((event, emit) async {
      await _mapAddDynamicWidgetListToState(event);
    });
    
    on <UpdateDynamicWidgetList> ((event, emit) async {
      await _mapUpdateDynamicWidgetListToState(event);
    });
    
    on <DeleteDynamicWidgetList> ((event, emit) async {
      await _mapDeleteDynamicWidgetListToState(event);
    });
    
    on <DynamicWidgetListUpdated> ((event, emit) {
      emit(_mapDynamicWidgetListUpdatedToState(event));
    });
  }

  List<DynamicWidgetModel?> _filter(List<DynamicWidgetModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadDynamicWidgetListToState() async {
    int amountNow =  (state is DynamicWidgetListLoaded) ? (state as DynamicWidgetListLoaded).values!.length : 0;
    _dynamicWidgetsListSubscription?.cancel();
    _dynamicWidgetsListSubscription = _dynamicWidgetRepository.listen(
          (list) => add(DynamicWidgetListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * dynamicWidgetLimit : null
    );
  }

  Future<void> _mapLoadDynamicWidgetListWithDetailsToState() async {
    int amountNow =  (state is DynamicWidgetListLoaded) ? (state as DynamicWidgetListLoaded).values!.length : 0;
    _dynamicWidgetsListSubscription?.cancel();
    _dynamicWidgetsListSubscription = _dynamicWidgetRepository.listenWithDetails(
            (list) => add(DynamicWidgetListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * dynamicWidgetLimit : null
    );
  }

  Future<void> _mapAddDynamicWidgetListToState(AddDynamicWidgetList event) async {
    var value = event.value;
    if (value != null) {
      await _dynamicWidgetRepository.add(value);
    }
  }

  Future<void> _mapUpdateDynamicWidgetListToState(UpdateDynamicWidgetList event) async {
    var value = event.value;
    if (value != null) {
      await _dynamicWidgetRepository.update(value);
    }
  }

  Future<void> _mapDeleteDynamicWidgetListToState(DeleteDynamicWidgetList event) async {
    var value = event.value;
    if (value != null) {
      await _dynamicWidgetRepository.delete(value);
    }
  }

  DynamicWidgetListLoaded _mapDynamicWidgetListUpdatedToState(
      DynamicWidgetListUpdated event) => DynamicWidgetListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _dynamicWidgetsListSubscription?.cancel();
    return super.close();
  }
}


