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

import 'package:eliud_pkg_fundamentals/model/booklet_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';

class BookletComponentBloc extends Bloc<BookletComponentEvent, BookletComponentState> {
  final BookletRepository? bookletRepository;
  StreamSubscription? _bookletSubscription;

  void _mapLoadBookletComponentUpdateToState(String documentId) {
    _bookletSubscription?.cancel();
    _bookletSubscription = bookletRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(BookletComponentUpdated(value: value));
      }
    });
  }

  BookletComponentBloc({ this.bookletRepository }): super(BookletComponentUninitialized()) {
    on <FetchBookletComponent> ((event, emit) {
      _mapLoadBookletComponentUpdateToState(event.id!);
    });
    on <BookletComponentUpdated> ((event, emit) {
      emit(BookletComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _bookletSubscription?.cancel();
    return super.close();
  }

}

