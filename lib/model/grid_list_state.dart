/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'grid_model.dart';

abstract class GridListState extends Equatable {
  const GridListState();

  @override
  List<Object> get props => [];
}

class GridListLoading extends GridListState {}

class GridListLoaded extends GridListState {
  final List<GridModel> values;

  const GridListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'GridListLoaded { values: $values }';
}

class GridNotLoaded extends GridListState {}

