/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';

/* 
 * SimpleTextComponentState is the base class for state for SimpleTextComponentBloc
 */
abstract class SimpleTextComponentState extends Equatable {
  const SimpleTextComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * SimpleTextComponentUninitialized is the uninitialized state of the SimpleTextComponentBloc 
 */
class SimpleTextComponentUninitialized extends SimpleTextComponentState {}

/* 
 * SimpleTextComponentError is the error state of the SimpleTextComponentBloc 
 */
class SimpleTextComponentError extends SimpleTextComponentState {
  final String? message;
  SimpleTextComponentError({this.message});
}

/* 
 * SimpleTextComponentPermissionDenied is to indicate permission denied state of the SimpleTextComponentBloc 
 */
class SimpleTextComponentPermissionDenied extends SimpleTextComponentState {
  SimpleTextComponentPermissionDenied();
}

/* 
 * SimpleTextComponentLoaded is used to set the state of the SimpleTextComponentBloc to the loaded state
 */
class SimpleTextComponentLoaded extends SimpleTextComponentState {
  final SimpleTextModel value;

  /* 
   * construct SimpleTextComponentLoaded
   */
  const SimpleTextComponentLoaded({required this.value});

  /* 
   * copy method
   */
  SimpleTextComponentLoaded copyWith({SimpleTextModel? copyThis}) {
    return SimpleTextComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'SimpleTextComponentLoaded { value: $value }';
}
