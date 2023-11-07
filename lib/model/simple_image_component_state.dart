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
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';

abstract class SimpleImageComponentState extends Equatable {
  const SimpleImageComponentState();

  @override
  List<Object?> get props => [];
}

class SimpleImageComponentUninitialized extends SimpleImageComponentState {}

class SimpleImageComponentError extends SimpleImageComponentState {
  final String? message;
  SimpleImageComponentError({this.message});
}

class SimpleImageComponentPermissionDenied extends SimpleImageComponentState {
  SimpleImageComponentPermissionDenied();
}

class SimpleImageComponentLoaded extends SimpleImageComponentState {
  final SimpleImageModel value;

  const SimpleImageComponentLoaded({required this.value});

  SimpleImageComponentLoaded copyWith({SimpleImageModel? copyThis}) {
    return SimpleImageComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'SimpleImageComponentLoaded { value: $value }';
}
