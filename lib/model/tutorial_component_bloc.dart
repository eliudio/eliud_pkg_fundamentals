/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';
import 'package:flutter/services.dart';

class TutorialComponentBloc extends Bloc<TutorialComponentEvent, TutorialComponentState> {
  final TutorialRepository? tutorialRepository;

  TutorialComponentBloc({ this.tutorialRepository }): super(TutorialComponentUninitialized());
  @override
  Stream<TutorialComponentState> mapEventToState(TutorialComponentEvent event) async* {
    final currentState = state;
    if (event is FetchTutorialComponent) {
      try {
        if (currentState is TutorialComponentUninitialized) {
          bool permissionDenied = false;
          final model = await tutorialRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield TutorialComponentPermissionDenied();
          } else {
            if (model != null) {
              yield TutorialComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield TutorialComponentError(
                  message: "Tutorial with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield TutorialComponentError(message: "Unknown error whilst retrieving Tutorial");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

