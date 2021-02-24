/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';

abstract class SimpleTextComponentState extends Equatable {
  const SimpleTextComponentState();

  @override
  List<Object> get props => [];
}

class SimpleTextComponentUninitialized extends SimpleTextComponentState {}

class SimpleTextComponentError extends SimpleTextComponentState {
  final String message;
  SimpleTextComponentError({ this.message });
}

class SimpleTextComponentPermissionDenied extends SimpleTextComponentState {
  SimpleTextComponentPermissionDenied();
}

class SimpleTextComponentLoaded extends SimpleTextComponentState {
  final SimpleTextModel value;

  const SimpleTextComponentLoaded({ this.value });

  SimpleTextComponentLoaded copyWith({ SimpleTextModel copyThis }) {
    return SimpleTextComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'SimpleTextComponentLoaded { value: $value }';
}

