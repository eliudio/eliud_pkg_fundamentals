/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'presentation_model.dart';

abstract class PresentationListEvent extends Equatable {
  const PresentationListEvent();
  @override
  List<Object> get props => [];
}

class LoadPresentationList extends PresentationListEvent {}
class LoadPresentationListWithDetails extends PresentationListEvent {}

class AddPresentationList extends PresentationListEvent {
  final PresentationModel value;

  const AddPresentationList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddPresentationList{ value: $value }';
}

class UpdatePresentationList extends PresentationListEvent {
  final PresentationModel value;

  const UpdatePresentationList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdatePresentationList{ value: $value }';
}

class DeletePresentationList extends PresentationListEvent {
  final PresentationModel value;

  const DeletePresentationList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeletePresentationList{ value: $value }';
}

class PresentationListUpdated extends PresentationListEvent {
  final List<PresentationModel> value;

  const PresentationListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'PresentationListUpdated{ value: $value }';
}

