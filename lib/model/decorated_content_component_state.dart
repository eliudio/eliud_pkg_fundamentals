/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_model.dart';

/* 
 * DecoratedContentComponentState is the base class for state for DecoratedContentComponentBloc
 */
abstract class DecoratedContentComponentState extends Equatable {
  const DecoratedContentComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * DecoratedContentComponentUninitialized is the uninitialized state of the DecoratedContentComponentBloc 
 */
class DecoratedContentComponentUninitialized
    extends DecoratedContentComponentState {}

/* 
 * DecoratedContentComponentError is the error state of the DecoratedContentComponentBloc 
 */
class DecoratedContentComponentError extends DecoratedContentComponentState {
  final String? message;
  DecoratedContentComponentError({this.message});
}

/* 
 * DecoratedContentComponentPermissionDenied is to indicate permission denied state of the DecoratedContentComponentBloc 
 */
class DecoratedContentComponentPermissionDenied
    extends DecoratedContentComponentState {
  DecoratedContentComponentPermissionDenied();
}

/* 
 * DecoratedContentComponentLoaded is used to set the state of the DecoratedContentComponentBloc to the loaded state
 */
class DecoratedContentComponentLoaded extends DecoratedContentComponentState {
  final DecoratedContentModel value;

  /* 
   * construct DecoratedContentComponentLoaded
   */
  const DecoratedContentComponentLoaded({required this.value});

  /* 
   * copy method
   */
  DecoratedContentComponentLoaded copyWith({DecoratedContentModel? copyThis}) {
    return DecoratedContentComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DecoratedContentComponentLoaded { value: $value }';
}
