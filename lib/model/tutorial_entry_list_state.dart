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

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_model.dart';

abstract class TutorialEntryListState extends Equatable {
  const TutorialEntryListState();

  @override
  List<Object> get props => [];
}

class TutorialEntryListLoading extends TutorialEntryListState {}

class TutorialEntryListLoaded extends TutorialEntryListState {
  final List<TutorialEntryModel> values;

  const TutorialEntryListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'TutorialEntryListLoaded { values: $values }';
}

class TutorialEntryNotLoaded extends TutorialEntryListState {}

