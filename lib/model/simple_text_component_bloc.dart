/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_repository.dart';
import 'package:flutter/services.dart';

class SimpleTextComponentBloc extends Bloc<SimpleTextComponentEvent, SimpleTextComponentState> {
  final SimpleTextRepository? simpleTextRepository;
  StreamSubscription? _simpleTextSubscription;

  Stream<SimpleTextComponentState> _mapLoadSimpleTextComponentUpdateToState(String documentId) async* {
    _simpleTextSubscription?.cancel();
    _simpleTextSubscription = simpleTextRepository!.listenTo(documentId, (value) {
      if (value != null) add(SimpleTextComponentUpdated(value: value));
    });
  }

  SimpleTextComponentBloc({ this.simpleTextRepository }): super(SimpleTextComponentUninitialized());

  @override
  Stream<SimpleTextComponentState> mapEventToState(SimpleTextComponentEvent event) async* {
    final currentState = state;
    if (event is FetchSimpleTextComponent) {
      yield* _mapLoadSimpleTextComponentUpdateToState(event.id!);
    } else if (event is SimpleTextComponentUpdated) {
      yield SimpleTextComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _simpleTextSubscription?.cancel();
    return super.close();
  }

}

