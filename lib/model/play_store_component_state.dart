/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_model.dart';

abstract class PlayStoreState extends Equatable {
  const PlayStoreState();

  @override
  List<Object> get props => [];
}

class PlayStoreUninitialized extends PlayStoreState {}

class PlayStoreError extends PlayStoreState {
  final String message;
  PlayStoreError({ this.message });
}

class PlayStoreLoaded extends PlayStoreState {
  final PlayStoreModel value;

  const PlayStoreLoaded({ this.value });

  PlayStoreLoaded copyWith({ PlayStoreModel copyThis }) {
    return PlayStoreLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'PlayStoreModelLoaded { value: $value }';
}


