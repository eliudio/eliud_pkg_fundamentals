/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'listed_item_model.dart';

abstract class ListedItemListState extends Equatable {
  const ListedItemListState();

  @override
  List<Object> get props => [];
}

class ListedItemListLoading extends ListedItemListState {}

class ListedItemListLoaded extends ListedItemListState {
  final List<ListedItemModel> values;

  const ListedItemListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'ListedItemListLoaded { values: $values }';
}

class ListedItemNotLoaded extends ListedItemListState {}

