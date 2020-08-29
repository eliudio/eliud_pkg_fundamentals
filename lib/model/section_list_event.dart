/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'section_model.dart';

abstract class SectionListEvent extends Equatable {
  const SectionListEvent();
  @override
  List<Object> get props => [];
}

class LoadSectionList extends SectionListEvent {}
class LoadSectionListWithDetails extends SectionListEvent {}

class AddSectionList extends SectionListEvent {
  final SectionModel value;

  const AddSectionList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddSectionList{ value: $value }';
}

class UpdateSectionList extends SectionListEvent {
  final SectionModel value;

  const UpdateSectionList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateSectionList{ value: $value }';
}

class DeleteSectionList extends SectionListEvent {
  final SectionModel value;

  const DeleteSectionList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteSectionList{ value: $value }';
}

class SectionListUpdated extends SectionListEvent {
  final List<SectionModel> value;

  const SectionListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'SectionListUpdated{ value: $value }';
}

