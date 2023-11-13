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

/* 
 * GridComponentState is the base class for state for GridComponentBloc
 */
abstract class GridComponentState extends Equatable {
  const GridComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * GridComponentUninitialized is the uninitialized state of the GridComponentBloc 
 */
class GridComponentUninitialized extends GridComponentState {}

/* 
 * GridComponentError is the error state of the GridComponentBloc 
 */
class GridComponentError extends GridComponentState {
  final String? message;
  GridComponentError({this.message});
}

/* 
 * GridComponentPermissionDenied is to indicate permission denied state of the GridComponentBloc 
 */
class GridComponentPermissionDenied extends GridComponentState {
  GridComponentPermissionDenied();
}

/* 
 * GridComponentLoaded is used to set the state of the GridComponentBloc to the loaded state
 */
class GridComponentLoaded extends GridComponentState {
  final GridModel value;

  /* 
   * construct GridComponentLoaded
   */
  const GridComponentLoaded({required this.value});

  /* 
   * copy method
   */
  GridComponentLoaded copyWith({GridModel? copyThis}) {
    return GridComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'GridComponentLoaded { value: $value }';
}
