/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'divider_model.dart';

abstract class DividerState extends Equatable {
  const DividerState();

  @override
  List<Object> get props => [];
}

class DividerUninitialized extends DividerState {}

class DividerError extends DividerState {
  final String message;
  DividerError({ this.message });
}

class DividerLoaded extends DividerState {
  final DividerModel value;

  const DividerLoaded({ this.value });

  DividerLoaded copyWith({ DividerModel copyThis }) {
    return DividerLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'DividerModelLoaded { value: $value }';
}


