/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';

/* 
 * BookletComponentState is the base class for state for BookletComponentBloc
 */
abstract class BookletComponentState extends Equatable {
  const BookletComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * BookletComponentUninitialized is the uninitialized state of the BookletComponentBloc 
 */
class BookletComponentUninitialized extends BookletComponentState {}

/* 
 * BookletComponentError is the error state of the BookletComponentBloc 
 */
class BookletComponentError extends BookletComponentState {
  final String? message;
  BookletComponentError({this.message});
}

/* 
 * BookletComponentPermissionDenied is to indicate permission denied state of the BookletComponentBloc 
 */
class BookletComponentPermissionDenied extends BookletComponentState {
  BookletComponentPermissionDenied();
}

/* 
 * BookletComponentLoaded is used to set the state of the BookletComponentBloc to the loaded state
 */
class BookletComponentLoaded extends BookletComponentState {
  final BookletModel value;

  /* 
   * construct BookletComponentLoaded
   */
  const BookletComponentLoaded({required this.value});

  /* 
   * copy method
   */
  BookletComponentLoaded copyWith({BookletModel? copyThis}) {
    return BookletComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'BookletComponentLoaded { value: $value }';
}
