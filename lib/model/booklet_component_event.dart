/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';

abstract class BookletEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchBooklet extends BookletEvent {
  final String id;

  FetchBooklet({ this.id });
}

