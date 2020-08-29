/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'tutorial_model.dart';

abstract class TutorialListEvent extends Equatable {
  const TutorialListEvent();
  @override
  List<Object> get props => [];
}

class LoadTutorialList extends TutorialListEvent {}
class LoadTutorialListWithDetails extends TutorialListEvent {}

class AddTutorialList extends TutorialListEvent {
  final TutorialModel value;

  const AddTutorialList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddTutorialList{ value: $value }';
}

class UpdateTutorialList extends TutorialListEvent {
  final TutorialModel value;

  const UpdateTutorialList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateTutorialList{ value: $value }';
}

class DeleteTutorialList extends TutorialListEvent {
  final TutorialModel value;

  const DeleteTutorialList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteTutorialList{ value: $value }';
}

class TutorialListUpdated extends TutorialListEvent {
  final List<TutorialModel> value;

  const TutorialListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'TutorialListUpdated{ value: $value }';
}

