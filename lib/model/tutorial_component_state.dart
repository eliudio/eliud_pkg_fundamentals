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
import 'tutorial_model.dart';

abstract class TutorialState extends Equatable {
  const TutorialState();

  @override
  List<Object> get props => [];
}

class TutorialUninitialized extends TutorialState {}

class TutorialError extends TutorialState {
  final String message;
  TutorialError({ this.message });
}

class TutorialLoaded extends TutorialState {
  final TutorialModel value;

  const TutorialLoaded({ this.value });

  TutorialLoaded copyWith({ TutorialModel copyThis }) {
    return TutorialLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'TutorialModelLoaded { value: $value }';
}


