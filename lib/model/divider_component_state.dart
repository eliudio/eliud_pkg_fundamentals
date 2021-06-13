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

import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:equatable/equatable.dart';

abstract class DividerComponentState extends Equatable {
  const DividerComponentState();

  @override
  List<Object?> get props => [];
}

class DividerComponentUninitialized extends DividerComponentState {}

class DividerComponentError extends DividerComponentState {
  final String? message;
  DividerComponentError({ this.message });
}

class DividerComponentPermissionDenied extends DividerComponentState {
  DividerComponentPermissionDenied();
}

class DividerComponentLoaded extends DividerComponentState {
  final DividerModel? value;

  const DividerComponentLoaded({ this.value });

  DividerComponentLoaded copyWith({ DividerModel? copyThis }) {
    return DividerComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DividerComponentLoaded { value: $value }';
}

