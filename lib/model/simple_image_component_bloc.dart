/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_repository.dart';

class SimpleImageComponentBloc extends Bloc<SimpleImageComponentEvent, SimpleImageComponentState> {
  final SimpleImageRepository simpleImageRepository;

  SimpleImageComponentBloc({ this.simpleImageRepository }): super(SimpleImageComponentUninitialized());
  @override
  Stream<SimpleImageComponentState> mapEventToState(SimpleImageComponentEvent event) async* {
    final currentState = state;
    if (event is FetchSimpleImageComponent) {
      try {
        if (currentState is SimpleImageComponentUninitialized) {
          final SimpleImageModel model = await _fetchSimpleImage(event.id);

          if (model != null) {
            yield SimpleImageComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield SimpleImageComponentError(message: "SimpleImage with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield SimpleImageComponentError(message: "Unknown error whilst retrieving SimpleImage");
      }
    }
  }

  Future<SimpleImageModel> _fetchSimpleImage(String id) async {
    return simpleImageRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


