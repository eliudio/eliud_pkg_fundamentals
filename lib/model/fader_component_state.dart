/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';

/* 
 * FaderComponentState is the base class for state for FaderComponentBloc
 */
abstract class FaderComponentState extends Equatable {
  const FaderComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * FaderComponentUninitialized is the uninitialized state of the FaderComponentBloc 
 */
class FaderComponentUninitialized extends FaderComponentState {}

/* 
 * FaderComponentError is the error state of the FaderComponentBloc 
 */
class FaderComponentError extends FaderComponentState {
  final String? message;
  FaderComponentError({this.message});
}

/* 
 * FaderComponentPermissionDenied is to indicate permission denied state of the FaderComponentBloc 
 */
class FaderComponentPermissionDenied extends FaderComponentState {
  FaderComponentPermissionDenied();
}

/* 
 * FaderComponentLoaded is used to set the state of the FaderComponentBloc to the loaded state
 */
class FaderComponentLoaded extends FaderComponentState {
  final FaderModel value;

  /* 
   * construct FaderComponentLoaded
   */
  const FaderComponentLoaded({required this.value});

  /* 
   * copy method
   */
  FaderComponentLoaded copyWith({FaderModel? copyThis}) {
    return FaderComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'FaderComponentLoaded { value: $value }';
}
