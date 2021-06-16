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

  DecoratedContentComponentBloc({ this.decoratedContentRepository }): super(DecoratedContentComponentUninitialized());
  @override
  Stream<DecoratedContentComponentState> mapEventToState(DecoratedContentComponentEvent event) async* {
    final currentState = state;
    if (event is FetchDecoratedContentComponent) {
      try {
        if (currentState is DecoratedContentComponentUninitialized) {
          bool permissionDenied = false;
          final model = await decoratedContentRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield DecoratedContentComponentPermissionDenied();
          } else {
            if (model != null) {
              yield DecoratedContentComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield DecoratedContentComponentError(
                  message: "DecoratedContent with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield DecoratedContentComponentError(message: "Unknown error whilst retrieving DecoratedContent");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

