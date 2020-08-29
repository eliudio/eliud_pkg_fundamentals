/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'simple_image_model.dart';

abstract class SimpleImageState extends Equatable {
  const SimpleImageState();

  @override
  List<Object> get props => [];
}

class SimpleImageUninitialized extends SimpleImageState {}

class SimpleImageError extends SimpleImageState {
  final String message;
  SimpleImageError({ this.message });
}

class SimpleImageLoaded extends SimpleImageState {
  final SimpleImageModel value;

  const SimpleImageLoaded({ this.value });

  SimpleImageLoaded copyWith({ SimpleImageModel copyThis }) {
    return SimpleImageLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'SimpleImageModelLoaded { value: $value }';
}


