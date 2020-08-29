/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';

abstract class PlayStoreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPlayStore extends PlayStoreEvent {
  final String id;

  FetchPlayStore({ this.id });
}

