/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';

abstract class DocumentListState extends Equatable {
  const DocumentListState();

  @override
  List<Object?> get props => [];
}

class DocumentListLoading extends DocumentListState {}

class DocumentListLoaded extends DocumentListState {
  final List<DocumentModel?>? values;
  final bool? mightHaveMore;

  const DocumentListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'DocumentListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is DocumentListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class DocumentNotLoaded extends DocumentListState {}
