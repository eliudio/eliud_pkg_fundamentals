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
  final BookletRepository bookletRepository;

  BookletComponentBloc({ this.bookletRepository }): super(BookletComponentUninitialized());
  @override
  Stream<BookletComponentState> mapEventToState(BookletComponentEvent event) async* {
    final currentState = state;
    if (event is FetchBookletComponent) {
      try {
        if (currentState is BookletComponentUninitialized) {
          bool permissionDenied = false;
          final model = await bookletRepository.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield BookletComponentPermissionDenied();
          } else {
            if (model != null) {
              yield BookletComponentLoaded(value: model);
            } else {
              String id = event.id;
              yield BookletComponentError(
                  message: "Booklet with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield BookletComponentError(message: "Unknown error whilst retrieving Booklet");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

