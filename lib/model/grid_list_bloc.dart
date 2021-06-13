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
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_fundamentals/model/grid_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/grid_list_state.dart';
import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';


const _gridLimit = 5;

class GridListBloc extends Bloc<GridListEvent, GridListState> {
  final GridRepository _gridRepository;
  StreamSubscription? _gridsListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  GridListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required GridRepository gridRepository})
      : assert(gridRepository != null),
        _gridRepository = gridRepository,
        super(GridListLoading());

  Stream<GridListState> _mapLoadGridListToState() async* {
    int amountNow =  (state is GridListLoaded) ? (state as GridListLoaded).values!.length : 0;
    _gridsListSubscription?.cancel();
    _gridsListSubscription = _gridRepository.listen(
          (list) => add(GridListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _gridLimit : null
    );
  }

  Stream<GridListState> _mapLoadGridListWithDetailsToState() async* {
    int amountNow =  (state is GridListLoaded) ? (state as GridListLoaded).values!.length : 0;
    _gridsListSubscription?.cancel();
    _gridsListSubscription = _gridRepository.listenWithDetails(
            (list) => add(GridListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _gridLimit : null
    );
  }

  Stream<GridListState> _mapAddGridListToState(AddGridList event) async* {
    var value = event.value;
    if (value != null) 
      _gridRepository.add(value);
  }

  Stream<GridListState> _mapUpdateGridListToState(UpdateGridList event) async* {
    var value = event.value;
    if (value != null) 
      _gridRepository.update(value);
  }

  Stream<GridListState> _mapDeleteGridListToState(DeleteGridList event) async* {
    var value = event.value;
    if (value != null) 
      _gridRepository.delete(value);
  }

  Stream<GridListState> _mapGridListUpdatedToState(
      GridListUpdated event) async* {
    yield GridListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<GridListState> mapEventToState(GridListEvent event) async* {
    if (event is LoadGridList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadGridListToState();
      } else {
        yield* _mapLoadGridListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadGridListWithDetailsToState();
    } else if (event is AddGridList) {
      yield* _mapAddGridListToState(event);
    } else if (event is UpdateGridList) {
      yield* _mapUpdateGridListToState(event);
    } else if (event is DeleteGridList) {
      yield* _mapDeleteGridListToState(event);
    } else if (event is GridListUpdated) {
      yield* _mapGridListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _gridsListSubscription?.cancel();
    return super.close();
  }
}


