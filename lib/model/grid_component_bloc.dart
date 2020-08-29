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

import 'grid_model.dart';
import 'grid_component_event.dart';
import 'grid_component_state.dart';
import 'grid_repository.dart';

class GridBloc extends Bloc<GridEvent, GridState> {
  final GridRepository gridRepository;

  GridBloc({ this.gridRepository }): super(GridUninitialized());
  @override
  Stream<GridState> mapEventToState(GridEvent event) async* {
    final currentState = state;
    if (event is FetchGrid) {
      try {
        if (currentState is GridUninitialized) {
          final GridModel model = await _fetchGrid(event.id);

          if (model != null) {
            yield GridLoaded(value: model);
          } else {
            String id = event.id;
            yield GridError(message: "Grid with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield GridError(message: "Unknown error whilst retrieving Grid");
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


