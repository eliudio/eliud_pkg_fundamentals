/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_model.dart';

/* 
 * DynamicWidgetComponentState is the base class for state for DynamicWidgetComponentBloc
 */
abstract class DynamicWidgetComponentState extends Equatable {
  const DynamicWidgetComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * DynamicWidgetComponentUninitialized is the uninitialized state of the DynamicWidgetComponentBloc 
 */
class DynamicWidgetComponentUninitialized extends DynamicWidgetComponentState {}

/* 
 * DynamicWidgetComponentError is the error state of the DynamicWidgetComponentBloc 
 */
class DynamicWidgetComponentError extends DynamicWidgetComponentState {
  final String? message;
  DynamicWidgetComponentError({this.message});
}

/* 
 * DynamicWidgetComponentPermissionDenied is to indicate permission denied state of the DynamicWidgetComponentBloc 
 */
class DynamicWidgetComponentPermissionDenied
    extends DynamicWidgetComponentState {
  DynamicWidgetComponentPermissionDenied();
}

/* 
 * DynamicWidgetComponentLoaded is used to set the state of the DynamicWidgetComponentBloc to the loaded state
 */
class DynamicWidgetComponentLoaded extends DynamicWidgetComponentState {
  final DynamicWidgetModel value;

  /* 
   * construct DynamicWidgetComponentLoaded
   */
  const DynamicWidgetComponentLoaded({required this.value});

  /* 
   * copy method
   */
  DynamicWidgetComponentLoaded copyWith({DynamicWidgetModel? copyThis}) {
    return DynamicWidgetComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DynamicWidgetComponentLoaded { value: $value }';
}
