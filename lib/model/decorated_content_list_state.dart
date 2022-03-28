/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_model.dart';

abstract class DecoratedContentListState extends Equatable {
  const DecoratedContentListState();

  @override
  List<Object?> get props => [];
}

class DecoratedContentListLoading extends DecoratedContentListState {}

class DecoratedContentListLoaded extends DecoratedContentListState {
  final List<DecoratedContentModel?>? values;
  final bool? mightHaveMore;

  const DecoratedContentListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'DecoratedContentListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is DecoratedContentListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class DecoratedContentNotLoaded extends DecoratedContentListState {}

