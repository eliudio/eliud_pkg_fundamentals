/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';
import 'package:flutter/services.dart';

class FaderComponentBloc extends Bloc<FaderComponentEvent, FaderComponentState> {
  final FaderRepository? faderRepository;
  StreamSubscription? _faderSubscription;

  Stream<FaderComponentState> _mapLoadFaderComponentUpdateToState(String documentId) async* {
    _faderSubscription?.cancel();
    _faderSubscription = faderRepository!.listenTo(documentId, (value) {
      if (value != null) add(FaderComponentUpdated(value: value));
    });
  }

  FaderComponentBloc({ this.faderRepository }): super(FaderComponentUninitialized());

  @override
  Stream<FaderComponentState> mapEventToState(FaderComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFaderComponent) {
      yield* _mapLoadFaderComponentUpdateToState(event.id!);
    } else if (event is FaderComponentUpdated) {
      yield FaderComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _faderSubscription?.cancel();
    return super.close();
  }

}

