/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';

abstract class DocumentItemListState extends Equatable {
  const DocumentItemListState();

  @override
  List<Object?> get props => [];
}

class DocumentItemListLoading extends DocumentItemListState {}

class DocumentItemListLoaded extends DocumentItemListState {
  final List<DocumentItemModel?>? values;
  final bool? mightHaveMore;

  const DocumentItemListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'DocumentItemListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is DocumentItemListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class DocumentItemNotLoaded extends DocumentItemListState {}
