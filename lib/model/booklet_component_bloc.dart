/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';
import 'package:flutter/services.dart';

class BookletComponentBloc extends Bloc<BookletComponentEvent, BookletComponentState> {
  final BookletRepository? bookletRepository;
  StreamSubscription? _bookletSubscription;

  Stream<BookletComponentState> _mapLoadBookletComponentUpdateToState(String documentId) async* {
    _bookletSubscription?.cancel();
    _bookletSubscription = bookletRepository!.listenTo(documentId, (value) {
      if (value != null) add(BookletComponentUpdated(value: value));
    });
  }

  BookletComponentBloc({ this.bookletRepository }): super(BookletComponentUninitialized());

  @override
  Stream<BookletComponentState> mapEventToState(BookletComponentEvent event) async* {
    final currentState = state;
    if (event is FetchBookletComponent) {
      yield* _mapLoadBookletComponentUpdateToState(event.id!);
    } else if (event is BookletComponentUpdated) {
      yield BookletComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _bookletSubscription?.cancel();
    return super.close();
  }

}

