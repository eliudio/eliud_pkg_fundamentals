/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/grid_model.dart';

abstract class GridComponentState extends Equatable {
  const GridComponentState();

  @override
  List<Object> get props => [];
}

class GridComponentUninitialized extends GridComponentState {}

class GridComponentError extends GridComponentState {
  final String message;
  GridComponentError({ this.message });
}

class GridComponentPermissionDenied extends GridComponentState {
  GridComponentPermissionDenied();
}

class GridComponentLoaded extends GridComponentState {
  final GridModel value;

  const GridComponentLoaded({ this.value });

  GridComponentLoaded copyWith({ GridModel copyThis }) {
    return GridComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'GridComponentLoaded { value: $value }';
}

