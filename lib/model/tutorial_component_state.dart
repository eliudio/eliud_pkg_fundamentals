/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';

/* 
 * TutorialComponentState is the base class for state for TutorialComponentBloc
 */
abstract class TutorialComponentState extends Equatable {
  const TutorialComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * TutorialComponentUninitialized is the uninitialized state of the TutorialComponentBloc 
 */
class TutorialComponentUninitialized extends TutorialComponentState {}

/* 
 * TutorialComponentError is the error state of the TutorialComponentBloc 
 */
class TutorialComponentError extends TutorialComponentState {
  final String? message;
  TutorialComponentError({this.message});
}

/* 
 * TutorialComponentPermissionDenied is to indicate permission denied state of the TutorialComponentBloc 
 */
class TutorialComponentPermissionDenied extends TutorialComponentState {
  TutorialComponentPermissionDenied();
}

/* 
 * TutorialComponentLoaded is used to set the state of the TutorialComponentBloc to the loaded state
 */
class TutorialComponentLoaded extends TutorialComponentState {
  final TutorialModel value;

  /* 
   * construct TutorialComponentLoaded
   */
  const TutorialComponentLoaded({required this.value});

  /* 
   * copy method
   */
  TutorialComponentLoaded copyWith({TutorialModel? copyThis}) {
    return TutorialComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'TutorialComponentLoaded { value: $value }';
}
