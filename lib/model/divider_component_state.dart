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
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';

/* 
 * DividerComponentState is the base class for state for DividerComponentBloc
 */
abstract class DividerComponentState extends Equatable {
  const DividerComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * DividerComponentUninitialized is the uninitialized state of the DividerComponentBloc 
 */
class DividerComponentUninitialized extends DividerComponentState {}

/* 
 * DividerComponentError is the error state of the DividerComponentBloc 
 */
class DividerComponentError extends DividerComponentState {
  final String? message;
  DividerComponentError({this.message});
}

/* 
 * DividerComponentPermissionDenied is to indicate permission denied state of the DividerComponentBloc 
 */
class DividerComponentPermissionDenied extends DividerComponentState {
  DividerComponentPermissionDenied();
}

/* 
 * DividerComponentLoaded is used to set the state of the DividerComponentBloc to the loaded state
 */
class DividerComponentLoaded extends DividerComponentState {
  final DividerModel value;

  /* 
   * construct DividerComponentLoaded
   */
  const DividerComponentLoaded({required this.value});

  /* 
   * copy method
   */
  DividerComponentLoaded copyWith({DividerModel? copyThis}) {
    return DividerComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DividerComponentLoaded { value: $value }';
}
