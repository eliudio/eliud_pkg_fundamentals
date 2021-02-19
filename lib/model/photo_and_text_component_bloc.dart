/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/photo_and_text_model.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_repository.dart';
import 'package:flutter/services.dart';


class PhotoAndTextComponentBloc extends Bloc<PhotoAndTextComponentEvent, PhotoAndTextComponentState> {
  final PhotoAndTextRepository photoAndTextRepository;

  PhotoAndTextComponentBloc({ this.photoAndTextRepository }): super(PhotoAndTextComponentUninitialized());
  @override
  Stream<PhotoAndTextComponentState> mapEventToState(PhotoAndTextComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPhotoAndTextComponent) {
      try {
        if (currentState is PhotoAndTextComponentUninitialized) {
          bool permissionDenied = false;
          final model = await photoAndTextRepository.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield PhotoAndTextComponentPermissionDenied();
          } else {
            if (model != null) {
              yield PhotoAndTextComponentLoaded(value: model);
            } else {
              String id = event.id;
              yield PhotoAndTextComponentError(
                  message: "PhotoAndText with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield PhotoAndTextComponentError(message: "Unknown error whilst retrieving PhotoAndText");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

