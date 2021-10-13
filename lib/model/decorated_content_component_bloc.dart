/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/decorated_content_model.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_repository.dart';
import 'package:flutter/services.dart';

class DecoratedContentComponentBloc extends Bloc<DecoratedContentComponentEvent, DecoratedContentComponentState> {
  final DecoratedContentRepository? decoratedContentRepository;
  StreamSubscription? _decoratedContentSubscription;

  Stream<DecoratedContentComponentState> _mapLoadDecoratedContentComponentUpdateToState(String documentId) async* {
    _decoratedContentSubscription?.cancel();
    _decoratedContentSubscription = decoratedContentRepository!.listenTo(documentId, (value) {
      if (value != null) add(DecoratedContentComponentUpdated(value: value));
    });
  }

  DecoratedContentComponentBloc({ this.decoratedContentRepository }): super(DecoratedContentComponentUninitialized());

  @override
  Stream<DecoratedContentComponentState> mapEventToState(DecoratedContentComponentEvent event) async* {
    final currentState = state;
    if (event is FetchDecoratedContentComponent) {
      yield* _mapLoadDecoratedContentComponentUpdateToState(event.id!);
    } else if (event is DecoratedContentComponentUpdated) {
      yield DecoratedContentComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _decoratedContentSubscription?.cancel();
    return super.close();
  }

}

