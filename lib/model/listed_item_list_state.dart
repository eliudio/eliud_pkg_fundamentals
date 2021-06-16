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
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';

abstract class ListedItemListState extends Equatable {
  const ListedItemListState();

  @override
  List<Object?> get props => [];
}

class ListedItemListLoading extends ListedItemListState {}

class ListedItemListLoaded extends ListedItemListState {
  final List<ListedItemModel?>? values;
  final bool? mightHaveMore;

  const ListedItemListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'ListedItemListLoaded { values: $values }';
}

class ListedItemNotLoaded extends ListedItemListState {}

