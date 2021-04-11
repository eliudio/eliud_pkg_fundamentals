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

  PresentationComponentBloc({ this.presentationRepository }): super(PresentationComponentUninitialized());
  @override
  Stream<PresentationComponentState> mapEventToState(PresentationComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPresentationComponent) {
      try {
        if (currentState is PresentationComponentUninitialized) {
          bool permissionDenied = false;
          final model = await presentationRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield PresentationComponentPermissionDenied();
          } else {
            if (model != null) {
              yield PresentationComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield PresentationComponentError(
                  message: "Presentation with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield PresentationComponentError(message: "Unknown error whilst retrieving Presentation");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

