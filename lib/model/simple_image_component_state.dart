/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';

/* 
 * SimpleImageComponentState is the base class for state for SimpleImageComponentBloc
 */
abstract class SimpleImageComponentState extends Equatable {
  const SimpleImageComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * SimpleImageComponentUninitialized is the uninitialized state of the SimpleImageComponentBloc 
 */
class SimpleImageComponentUninitialized extends SimpleImageComponentState {}

/* 
 * SimpleImageComponentError is the error state of the SimpleImageComponentBloc 
 */
class SimpleImageComponentError extends SimpleImageComponentState {
  final String? message;
  SimpleImageComponentError({this.message});
}

/* 
 * SimpleImageComponentPermissionDenied is to indicate permission denied state of the SimpleImageComponentBloc 
 */
class SimpleImageComponentPermissionDenied extends SimpleImageComponentState {
  SimpleImageComponentPermissionDenied();
}

/* 
 * SimpleImageComponentLoaded is used to set the state of the SimpleImageComponentBloc to the loaded state
 */
class SimpleImageComponentLoaded extends SimpleImageComponentState {
  final SimpleImageModel value;

  /* 
   * construct SimpleImageComponentLoaded
   */
  const SimpleImageComponentLoaded({required this.value});

  /* 
   * copy method
   */
  SimpleImageComponentLoaded copyWith({SimpleImageModel? copyThis}) {
    return SimpleImageComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'SimpleImageComponentLoaded { value: $value }';
}
