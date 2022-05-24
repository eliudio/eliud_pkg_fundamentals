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
import 'package:flutter/services.dart';

class DividerComponentBloc extends Bloc<DividerComponentEvent, DividerComponentState> {
  final DividerRepository? dividerRepository;
  StreamSubscription? _dividerSubscription;

  void _mapLoadDividerComponentUpdateToState(String documentId) {
    _dividerSubscription?.cancel();
    _dividerSubscription = dividerRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(DividerComponentUpdated(value: value));
      }
    });
  }

  DividerComponentBloc({ this.dividerRepository }): super(DividerComponentUninitialized()) {
    on <FetchDividerComponent> ((event, emit) {
      _mapLoadDividerComponentUpdateToState(event.id!);
    });
    on <DividerComponentUpdated> ((event, emit) {
      emit(DividerComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _dividerSubscription?.cancel();
    return super.close();
  }

}

