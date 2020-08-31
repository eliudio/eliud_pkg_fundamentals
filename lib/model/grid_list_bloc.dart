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
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';
import 'package:eliud_pkg_fundamentals/model/grid_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/grid_list_state.dart';


class GridListBloc extends Bloc<GridListEvent, GridListState> {
  final GridRepository _gridRepository;
  StreamSubscription _gridsListSubscription;

  GridListBloc({ @required GridRepository gridRepository })
      : assert(gridRepository != null),
      _gridRepository = gridRepository,
      super(GridListLoading());

  Stream<GridListState> _mapLoadGridListToState() async* {
    _gridsListSubscription?.cancel();
    _gridsListSubscription = _gridRepository.listen((list) => add(GridListUpdated(value: list)));
  }

  Stream<GridListState> _mapLoadGridListWithDetailsToState() async* {
    _gridsListSubscription?.cancel();
    _gridsListSubscription = _gridRepository.listenWithDetails((list) => add(GridListUpdated(value: list)));
  }

  Stream<GridListState> _mapAddGridListToState(AddGridList event) async* {
    _gridRepository.add(event.value);
  }

  Stream<GridListState> _mapUpdateGridListToState(UpdateGridList event) async* {
    _gridRepository.update(event.value);
  }

  Stream<GridListState> _mapDeleteGridListToState(DeleteGridList event) async* {
    _gridRepository.delete(event.value);
  }

  Stream<GridListState> _mapGridListUpdatedToState(GridListUpdated event) async* {
    yield GridListLoaded(values: event.value);
  }


  @override
  Stream<GridListState> mapEventToState(GridListEvent event) async* {
    final currentState = state;
    if (event is LoadGridList) {
      yield* _mapLoadGridListToState();
    } if (event is LoadGridListWithDetails) {
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


