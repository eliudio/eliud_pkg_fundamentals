/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';
import 'package:eliud_pkg_fundamentals/model/grid_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/grid_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'grid_model.dart';

typedef FilterGridModels = List<GridModel?> Function(List<GridModel?> values);

class GridListBloc extends Bloc<GridListEvent, GridListState> {
  final FilterGridModels? filter;
  final GridRepository _gridRepository;
  StreamSubscription? _gridsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int gridLimit;

  GridListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required GridRepository gridRepository,
      this.gridLimit = 5})
      : _gridRepository = gridRepository,
        super(GridListLoading()) {
    on<LoadGridList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadGridListToState();
      } else {
        _mapLoadGridListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadGridListWithDetailsToState();
    });

    on<GridChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadGridListToState();
      } else {
        _mapLoadGridListWithDetailsToState();
      }
    });

    on<AddGridList>((event, emit) async {
      await _mapAddGridListToState(event);
    });

    on<UpdateGridList>((event, emit) async {
      await _mapUpdateGridListToState(event);
    });

    on<DeleteGridList>((event, emit) async {
      await _mapDeleteGridListToState(event);
    });

    on<GridListUpdated>((event, emit) {
      emit(_mapGridListUpdatedToState(event));
    });
  }

  List<GridModel?> _filter(List<GridModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadGridListToState() async {
    int amountNow = (state is GridListLoaded)
        ? (state as GridListLoaded).values!.length
        : 0;
    _gridsListSubscription?.cancel();
    _gridsListSubscription = _gridRepository.listen(
        (list) => add(GridListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * gridLimit : null);
  }

  Future<void> _mapLoadGridListWithDetailsToState() async {
    int amountNow = (state is GridListLoaded)
        ? (state as GridListLoaded).values!.length
        : 0;
    _gridsListSubscription?.cancel();
    _gridsListSubscription = _gridRepository.listenWithDetails(
        (list) => add(GridListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * gridLimit : null);
  }

  Future<void> _mapAddGridListToState(AddGridList event) async {
    var value = event.value;
    if (value != null) {
      await _gridRepository.add(value);
    }
  }

  Future<void> _mapUpdateGridListToState(UpdateGridList event) async {
    var value = event.value;
    if (value != null) {
      await _gridRepository.update(value);
    }
  }

  Future<void> _mapDeleteGridListToState(DeleteGridList event) async {
    var value = event.value;
    if (value != null) {
      await _gridRepository.delete(value);
    }
  }

  GridListLoaded _mapGridListUpdatedToState(GridListUpdated event) =>
      GridListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _gridsListSubscription?.cancel();
    return super.close();
  }
}
