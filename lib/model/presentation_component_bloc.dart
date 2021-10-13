/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';
import 'package:flutter/services.dart';


class PresentationComponentBloc extends Bloc<PresentationComponentEvent, PresentationComponentState> {
  final PresentationRepository? presentationRepository;
  StreamSubscription? _presentationSubscription;

  Stream<PresentationComponentState> _mapLoadPresentationComponentUpdateToState(String documentId) async* {
    _presentationSubscription?.cancel();
    _presentationSubscription = presentationRepository!.listenTo(documentId, (value) {
      if (value != null) add(PresentationComponentUpdated(value: value));
    });
  }

  PresentationComponentBloc({ this.presentationRepository }): super(PresentationComponentUninitialized());

  @override
  Stream<PresentationComponentState> mapEventToState(PresentationComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPresentationComponent) {
      yield* _mapLoadPresentationComponentUpdateToState(event.id!);
    } else if (event is PresentationComponentUpdated) {
      yield PresentationComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _presentationSubscription?.cancel();
    return super.close();
  }

}

