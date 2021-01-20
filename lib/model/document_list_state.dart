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

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';

abstract class DocumentListState extends Equatable {
  const DocumentListState();

  @override
  List<Object> get props => [];
}

class DocumentListLoading extends DocumentListState {}

class DocumentListLoaded extends DocumentListState {
  final List<DocumentModel> values;
  final bool mightHaveMore;

  const DocumentListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'DocumentListLoaded { values: $values }';
}

class DocumentNotLoaded extends DocumentListState {}

