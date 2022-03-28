/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';

abstract class TutorialListState extends Equatable {
  const TutorialListState();

  @override
  List<Object?> get props => [];
}

class TutorialListLoading extends TutorialListState {}

class TutorialListLoaded extends TutorialListState {
  final List<TutorialModel?>? values;
  final bool? mightHaveMore;

  const TutorialListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'TutorialListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is TutorialListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class TutorialNotLoaded extends TutorialListState {}

