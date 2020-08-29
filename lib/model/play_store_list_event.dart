/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'play_store_model.dart';

abstract class PlayStoreListEvent extends Equatable {
  const PlayStoreListEvent();
  @override
  List<Object> get props => [];
}

class LoadPlayStoreList extends PlayStoreListEvent {}
class LoadPlayStoreListWithDetails extends PlayStoreListEvent {}

class AddPlayStoreList extends PlayStoreListEvent {
  final PlayStoreModel value;

  const AddPlayStoreList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddPlayStoreList{ value: $value }';
}

class UpdatePlayStoreList extends PlayStoreListEvent {
  final PlayStoreModel value;

  const UpdatePlayStoreList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdatePlayStoreList{ value: $value }';
}

class DeletePlayStoreList extends PlayStoreListEvent {
  final PlayStoreModel value;

  const DeletePlayStoreList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeletePlayStoreList{ value: $value }';
}

class PlayStoreListUpdated extends PlayStoreListEvent {
  final List<PlayStoreModel> value;

  const PlayStoreListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'PlayStoreListUpdated{ value: $value }';
}

