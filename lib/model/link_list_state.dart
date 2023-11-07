/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/link_model.dart';

abstract class LinkListState extends Equatable {
  const LinkListState();

  @override
  List<Object?> get props => [];
}

class LinkListLoading extends LinkListState {}

class LinkListLoaded extends LinkListState {
  final List<LinkModel?>? values;
  final bool? mightHaveMore;

  const LinkListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'LinkListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is LinkListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class LinkNotLoaded extends LinkListState {}
