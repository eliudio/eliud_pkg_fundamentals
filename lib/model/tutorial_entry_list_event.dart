/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_model.dart';

abstract class TutorialEntryListEvent extends Equatable {
  const TutorialEntryListEvent();
  @override
  List<Object?> get props => [];
}

class LoadTutorialEntryList extends TutorialEntryListEvent {}

class NewPage extends TutorialEntryListEvent {}

class AddTutorialEntryList extends TutorialEntryListEvent {
  final TutorialEntryModel? value;

  const AddTutorialEntryList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddTutorialEntryList{ value: $value }';
}

class UpdateTutorialEntryList extends TutorialEntryListEvent {
  final TutorialEntryModel? value;

  const UpdateTutorialEntryList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateTutorialEntryList{ value: $value }';
}

class DeleteTutorialEntryList extends TutorialEntryListEvent {
  final TutorialEntryModel? value;

  const DeleteTutorialEntryList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteTutorialEntryList{ value: $value }';
}

class TutorialEntryListUpdated extends TutorialEntryListEvent {
  final List<TutorialEntryModel?>? value;
  final bool? mightHaveMore;

  const TutorialEntryListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'TutorialEntryListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class TutorialEntryChangeQuery extends TutorialEntryListEvent {
  final EliudQuery newQuery;

  const TutorialEntryChangeQuery({ required this.newQuery });

  @override
  List<Object?> get props => [ newQuery ];

  @override
  String toString() => 'TutorialEntryChangeQuery{ value: $newQuery }';
}

