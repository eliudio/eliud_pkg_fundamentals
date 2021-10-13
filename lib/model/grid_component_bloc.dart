/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/grid_model.dart';
import 'package:eliud_pkg_fundamentals/model/grid_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/grid_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';
import 'package:flutter/services.dart';


class GridComponentBloc extends Bloc<GridComponentEvent, GridComponentState> {
  final GridRepository? gridRepository;
  StreamSubscription? _gridSubscription;

  Stream<GridComponentState> _mapLoadGridComponentUpdateToState(String documentId) async* {
    _gridSubscription?.cancel();
    _gridSubscription = gridRepository!.listenTo(documentId, (value) {
      if (value != null) add(GridComponentUpdated(value: value));
    });
  }

  GridComponentBloc({ this.gridRepository }): super(GridComponentUninitialized());

  @override
  Stream<GridComponentState> mapEventToState(GridComponentEvent event) async* {
    final currentState = state;
    if (event is FetchGridComponent) {
      yield* _mapLoadGridComponentUpdateToState(event.id!);
    } else if (event is GridComponentUpdated) {
      yield GridComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _gridSubscription?.cancel();
    return super.close();
  }

}

