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

abstract class DynamicWidgetComponentState extends Equatable {
  const DynamicWidgetComponentState();

  @override
  List<Object?> get props => [];
}

class DynamicWidgetComponentUninitialized extends DynamicWidgetComponentState {}

class DynamicWidgetComponentError extends DynamicWidgetComponentState {
  final String? message;
  DynamicWidgetComponentError({this.message});
}

class DynamicWidgetComponentPermissionDenied
    extends DynamicWidgetComponentState {
  DynamicWidgetComponentPermissionDenied();
}

class DynamicWidgetComponentLoaded extends DynamicWidgetComponentState {
  final DynamicWidgetModel value;

  const DynamicWidgetComponentLoaded({required this.value});

  DynamicWidgetComponentLoaded copyWith({DynamicWidgetModel? copyThis}) {
    return DynamicWidgetComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DynamicWidgetComponentLoaded { value: $value }';
}
