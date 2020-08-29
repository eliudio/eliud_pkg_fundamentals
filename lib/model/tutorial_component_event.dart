/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';

abstract class TutorialEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchTutorial extends TutorialEvent {
  final String id;

  FetchTutorial({ this.id });
}

