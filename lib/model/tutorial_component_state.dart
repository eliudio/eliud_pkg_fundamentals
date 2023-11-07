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
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';

abstract class TutorialComponentState extends Equatable {
  const TutorialComponentState();

  @override
  List<Object?> get props => [];
}

class TutorialComponentUninitialized extends TutorialComponentState {}

class TutorialComponentError extends TutorialComponentState {
  final String? message;
  TutorialComponentError({this.message});
}

class TutorialComponentPermissionDenied extends TutorialComponentState {
  TutorialComponentPermissionDenied();
}

class TutorialComponentLoaded extends TutorialComponentState {
  final TutorialModel value;

  const TutorialComponentLoaded({required this.value});

  TutorialComponentLoaded copyWith({TutorialModel? copyThis}) {
    return TutorialComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'TutorialComponentLoaded { value: $value }';
}
