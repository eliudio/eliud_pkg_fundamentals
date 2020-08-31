/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';

abstract class PresentationState extends Equatable {
  const PresentationState();

  @override
  List<Object> get props => [];
}

class PresentationUninitialized extends PresentationState {}

class PresentationError extends PresentationState {
  final String message;
  PresentationError({ this.message });
}

class PresentationLoaded extends PresentationState {
  final PresentationModel value;

  const PresentationLoaded({ this.value });

  PresentationLoaded copyWith({ PresentationModel copyThis }) {
    return PresentationLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'PresentationModelLoaded { value: $value }';
}


