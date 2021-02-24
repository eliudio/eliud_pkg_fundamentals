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

abstract class DecoratedContentComponentState extends Equatable {
  const DecoratedContentComponentState();

  @override
  List<Object> get props => [];
}

class DecoratedContentComponentUninitialized extends DecoratedContentComponentState {}

class DecoratedContentComponentError extends DecoratedContentComponentState {
  final String message;
  DecoratedContentComponentError({ this.message });
}

class DecoratedContentComponentPermissionDenied extends DecoratedContentComponentState {
  DecoratedContentComponentPermissionDenied();
}

class DecoratedContentComponentLoaded extends DecoratedContentComponentState {
  final DecoratedContentModel value;

  const DecoratedContentComponentLoaded({ this.value });

  DecoratedContentComponentLoaded copyWith({ DecoratedContentModel copyThis }) {
    return DecoratedContentComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'DecoratedContentComponentLoaded { value: $value }';
}

