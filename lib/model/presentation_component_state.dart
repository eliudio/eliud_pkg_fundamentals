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

abstract class PresentationComponentState extends Equatable {
  const PresentationComponentState();

  @override
  List<Object> get props => [];
}

class PresentationComponentUninitialized extends PresentationComponentState {}

class PresentationComponentError extends PresentationComponentState {
  final String message;
  PresentationComponentError({ this.message });
}

class PresentationComponentPermissionDenied extends PresentationComponentState {
  PresentationComponentPermissionDenied();
}

class PresentationComponentLoaded extends PresentationComponentState {
  final PresentationModel value;

  const PresentationComponentLoaded({ this.value });

  PresentationComponentLoaded copyWith({ PresentationModel copyThis }) {
    return PresentationComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'PresentationComponentLoaded { value: $value }';
}

