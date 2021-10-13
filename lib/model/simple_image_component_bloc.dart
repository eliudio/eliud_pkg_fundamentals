/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_repository.dart';
import 'package:flutter/services.dart';


class SimpleImageComponentBloc extends Bloc<SimpleImageComponentEvent, SimpleImageComponentState> {
  final SimpleImageRepository? simpleImageRepository;
  StreamSubscription? _simpleImageSubscription;

  Stream<SimpleImageComponentState> _mapLoadSimpleImageComponentUpdateToState(String documentId) async* {
    _simpleImageSubscription?.cancel();
    _simpleImageSubscription = simpleImageRepository!.listenTo(documentId, (value) {
      if (value != null) add(SimpleImageComponentUpdated(value: value));
    });
  }

  SimpleImageComponentBloc({ this.simpleImageRepository }): super(SimpleImageComponentUninitialized());

  @override
  Stream<SimpleImageComponentState> mapEventToState(SimpleImageComponentEvent event) async* {
    final currentState = state;
    if (event is FetchSimpleImageComponent) {
      yield* _mapLoadSimpleImageComponentUpdateToState(event.id!);
    } else if (event is SimpleImageComponentUpdated) {
      yield SimpleImageComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _simpleImageSubscription?.cancel();
    return super.close();
  }

}

