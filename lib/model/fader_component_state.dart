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

abstract class FaderState extends Equatable {
  const FaderState();

  @override
  List<Object> get props => [];
}

class FaderUninitialized extends FaderState {}

class FaderError extends FaderState {
  final String message;
  FaderError({ this.message });
}

class FaderLoaded extends FaderState {
  final FaderModel value;

  const FaderLoaded({ this.value });

  FaderLoaded copyWith({ FaderModel copyThis }) {
    return FaderLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'FaderModelLoaded { value: $value }';
}


