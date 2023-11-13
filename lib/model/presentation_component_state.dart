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

/* 
 * PresentationComponentState is the base class for state for PresentationComponentBloc
 */
abstract class PresentationComponentState extends Equatable {
  const PresentationComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * PresentationComponentUninitialized is the uninitialized state of the PresentationComponentBloc 
 */
class PresentationComponentUninitialized extends PresentationComponentState {}

/* 
 * PresentationComponentError is the error state of the PresentationComponentBloc 
 */
class PresentationComponentError extends PresentationComponentState {
  final String? message;
  PresentationComponentError({this.message});
}

/* 
 * PresentationComponentPermissionDenied is to indicate permission denied state of the PresentationComponentBloc 
 */
class PresentationComponentPermissionDenied extends PresentationComponentState {
  PresentationComponentPermissionDenied();
}

/* 
 * PresentationComponentLoaded is used to set the state of the PresentationComponentBloc to the loaded state
 */
class PresentationComponentLoaded extends PresentationComponentState {
  final PresentationModel value;

  /* 
   * construct PresentationComponentLoaded
   */
  const PresentationComponentLoaded({required this.value});

  /* 
   * copy method
   */
  PresentationComponentLoaded copyWith({PresentationModel? copyThis}) {
    return PresentationComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PresentationComponentLoaded { value: $value }';
}
