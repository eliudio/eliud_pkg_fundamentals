/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_pkg_fundamentals/model/divider_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/divider_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/divider_repository.dart';
import 'package:flutter/services.dart';

class DividerComponentBloc extends Bloc<DividerComponentEvent, DividerComponentState> {
  final DividerRepository? dividerRepository;

  DividerComponentBloc({ this.dividerRepository }): super(DividerComponentUninitialized());
  @override
  Stream<DividerComponentState> mapEventToState(DividerComponentEvent event) async* {
    final currentState = state;
    if (event is FetchDividerComponent) {
      try {
        if (currentState is DividerComponentUninitialized) {
          bool permissionDenied = false;
          final model = await dividerRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield DividerComponentPermissionDenied();
          } else {
            if (model != null) {
              yield DividerComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield DividerComponentError(
                  message: "Divider with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield DividerComponentError(message: "Unknown error whilst retrieving Divider");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

