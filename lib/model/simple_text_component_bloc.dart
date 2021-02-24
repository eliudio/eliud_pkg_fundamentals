/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_repository.dart';
import 'package:flutter/services.dart';

class SimpleTextComponentBloc extends Bloc<SimpleTextComponentEvent, SimpleTextComponentState> {
  final SimpleTextRepository simpleTextRepository;

  SimpleTextComponentBloc({ this.simpleTextRepository }): super(SimpleTextComponentUninitialized());
  @override
  Stream<SimpleTextComponentState> mapEventToState(SimpleTextComponentEvent event) async* {
    final currentState = state;
    if (event is FetchSimpleTextComponent) {
      try {
        if (currentState is SimpleTextComponentUninitialized) {
          bool permissionDenied = false;
          final model = await simpleTextRepository.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield SimpleTextComponentPermissionDenied();
          } else {
            if (model != null) {
              yield SimpleTextComponentLoaded(value: model);
            } else {
              String id = event.id;
              yield SimpleTextComponentError(
                  message: "SimpleText with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield SimpleTextComponentError(message: "Unknown error whilst retrieving SimpleText");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

