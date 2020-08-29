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

import 'simple_image_model.dart';
import 'simple_image_component_event.dart';
import 'simple_image_component_state.dart';
import 'simple_image_repository.dart';

class SimpleImageBloc extends Bloc<SimpleImageEvent, SimpleImageState> {
  final SimpleImageRepository simpleImageRepository;

  SimpleImageBloc({ this.simpleImageRepository }): super(SimpleImageUninitialized());
  @override
  Stream<SimpleImageState> mapEventToState(SimpleImageEvent event) async* {
    final currentState = state;
    if (event is FetchSimpleImage) {
      try {
        if (currentState is SimpleImageUninitialized) {
          final SimpleImageModel model = await _fetchSimpleImage(event.id);

          if (model != null) {
            yield SimpleImageLoaded(value: model);
          } else {
            String id = event.id;
            yield SimpleImageError(message: "SimpleImage with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield SimpleImageError(message: "Unknown error whilst retrieving SimpleImage");
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


