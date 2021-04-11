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

abstract class FaderComponentState extends Equatable {
  const FaderComponentState();

  @override
  List<Object?> get props => [];
}

class FaderComponentUninitialized extends FaderComponentState {}

class FaderComponentError extends FaderComponentState {
  final String? message;
  FaderComponentError({ this.message });
}

class FaderComponentPermissionDenied extends FaderComponentState {
  FaderComponentPermissionDenied();
}

class FaderComponentLoaded extends FaderComponentState {
  final FaderModel? value;

  const FaderComponentLoaded({ this.value });

  FaderComponentLoaded copyWith({ FaderModel? copyThis }) {
    return FaderComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'FaderComponentLoaded { value: $value }';
}

