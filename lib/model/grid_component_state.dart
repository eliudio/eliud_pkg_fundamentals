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

abstract class GridState extends Equatable {
  const GridState();

  @override
  List<Object> get props => [];
}

class GridUninitialized extends GridState {}

class GridError extends GridState {
  final String message;
  GridError({ this.message });
}

class GridLoaded extends GridState {
  final GridModel value;

  const GridLoaded({ this.value });

  GridLoaded copyWith({ GridModel copyThis }) {
    return GridLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'GridModelLoaded { value: $value }';
}


