/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_model.dart';

abstract class TutorialEntryListState extends Equatable {
  const TutorialEntryListState();

  @override
  List<Object?> get props => [];
}

class TutorialEntryListLoading extends TutorialEntryListState {}

class TutorialEntryListLoaded extends TutorialEntryListState {
  final List<TutorialEntryModel?>? values;
  final bool? mightHaveMore;

  const TutorialEntryListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'TutorialEntryListLoaded { values: $values }';

  @override
  bool operator ==(Object other) => 
          other is TutorialEntryListLoaded &&
              runtimeType == other.runtimeType &&
              ListEquality().equals(values, other.values) &&
              mightHaveMore == other.mightHaveMore;
}

class TutorialEntryNotLoaded extends TutorialEntryListState {}

