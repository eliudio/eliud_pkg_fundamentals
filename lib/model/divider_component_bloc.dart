/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:eliud_pkg_fundamentals/model/divider_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/divider_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/divider_repository.dart';
class DividerBloc extends Bloc<DividerEvent, DividerState> {
  final DividerRepository dividerRepository;

  DividerBloc({ this.dividerRepository }): super(DividerUninitialized());
  @override
  Stream<DividerState> mapEventToState(DividerEvent event) async* {
    final currentState = state;
    if (event is FetchDivider) {
      try {
        if (currentState is DividerUninitialized) {
          final DividerModel model = await _fetchDivider(event.id);

          if (model != null) {
            yield DividerLoaded(value: model);
          } else {
            String id = event.id;
            yield DividerError(message: "Divider with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield DividerError(message: "Unknown error whilst retrieving Divider");
      }
    }
  }

  Future<DividerModel> _fetchDivider(String id) async {
    return dividerRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


