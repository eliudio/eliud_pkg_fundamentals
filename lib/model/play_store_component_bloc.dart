/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/play_store_model.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_repository.dart';
import 'package:flutter/services.dart';


class PlayStoreComponentBloc extends Bloc<PlayStoreComponentEvent, PlayStoreComponentState> {
  final PlayStoreRepository? playStoreRepository;

  PlayStoreComponentBloc({ this.playStoreRepository }): super(PlayStoreComponentUninitialized());
  @override
  Stream<PlayStoreComponentState> mapEventToState(PlayStoreComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPlayStoreComponent) {
      try {
        if (currentState is PlayStoreComponentUninitialized) {
          bool permissionDenied = false;
          final model = await playStoreRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield PlayStoreComponentPermissionDenied();
          } else {
            if (model != null) {
              yield PlayStoreComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield PlayStoreComponentError(
                  message: "PlayStore with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield PlayStoreComponentError(message: "Unknown error whilst retrieving PlayStore");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

