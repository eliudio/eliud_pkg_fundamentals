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
class BookletComponentBloc extends Bloc<BookletComponentEvent, BookletComponentState> {
  final BookletRepository bookletRepository;

  BookletComponentBloc({ this.bookletRepository }): super(BookletComponentUninitialized());
  @override
  Stream<BookletComponentState> mapEventToState(BookletComponentEvent event) async* {
    final currentState = state;
    if (event is FetchBookletComponent) {
      try {
        if (currentState is BookletComponentUninitialized) {
          final BookletModel model = await _fetchBooklet(event.id);

          if (model != null) {
            yield BookletComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield BookletComponentError(message: "Booklet with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield BookletComponentError(message: "Unknown error whilst retrieving Booklet");
      }
    }
  }

  Future<BookletModel> _fetchBooklet(String id) async {
    return bookletRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


