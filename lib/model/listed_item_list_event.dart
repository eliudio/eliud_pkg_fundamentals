/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class ListedItemListEvent extends Equatable {
  const ListedItemListEvent();
  @override
  List<Object?> get props => [];
}

class LoadListedItemList extends ListedItemListEvent {}

class NewPage extends ListedItemListEvent {}

class AddListedItemList extends ListedItemListEvent {
  final ListedItemModel? value;

  const AddListedItemList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddListedItemList{ value: $value }';
}

class UpdateListedItemList extends ListedItemListEvent {
  final ListedItemModel? value;

  const UpdateListedItemList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateListedItemList{ value: $value }';
}

class DeleteListedItemList extends ListedItemListEvent {
  final ListedItemModel? value;

  const DeleteListedItemList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteListedItemList{ value: $value }';
}

class ListedItemListUpdated extends ListedItemListEvent {
  final List<ListedItemModel?>? value;
  final bool? mightHaveMore;

  const ListedItemListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'ListedItemListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

