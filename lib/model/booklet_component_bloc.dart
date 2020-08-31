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
class BookletBloc extends Bloc<BookletEvent, BookletState> {
  final BookletRepository bookletRepository;

  BookletBloc({ this.bookletRepository }): super(BookletUninitialized());
  @override
  Stream<BookletState> mapEventToState(BookletEvent event) async* {
    final currentState = state;
    if (event is FetchBooklet) {
      try {
        if (currentState is BookletUninitialized) {
          final BookletModel model = await _fetchBooklet(event.id);

          if (model != null) {
            yield BookletLoaded(value: model);
          } else {
            String id = event.id;
            yield BookletError(message: "Booklet with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield BookletError(message: "Unknown error whilst retrieving Booklet");
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


