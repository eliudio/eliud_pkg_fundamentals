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

class GridComponentBloc extends Bloc<GridComponentEvent, GridComponentState> {
  final GridRepository gridRepository;

  GridComponentBloc({ this.gridRepository }): super(GridComponentUninitialized());
  @override
  Stream<GridComponentState> mapEventToState(GridComponentEvent event) async* {
    final currentState = state;
    if (event is FetchGridComponent) {
      try {
        if (currentState is GridComponentUninitialized) {
          final GridModel model = await _fetchGrid(event.id);

          if (model != null) {
            yield GridComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield GridComponentError(message: "Grid with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield GridComponentError(message: "Unknown error whilst retrieving Grid");
      }
    }
  }

  Future<GridModel> _fetchGrid(String id) async {
    return gridRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


