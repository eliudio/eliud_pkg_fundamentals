/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_model.dart';

abstract class PlayStoreListState extends Equatable {
  const PlayStoreListState();

  @override
  List<Object?> get props => [];
}

class PlayStoreListLoading extends PlayStoreListState {}

class PlayStoreListLoaded extends PlayStoreListState {
  final List<PlayStoreModel?>? values;
  final bool? mightHaveMore;

  const PlayStoreListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'PlayStoreListLoaded { values: $values }';
}

class PlayStoreNotLoaded extends PlayStoreListState {}

