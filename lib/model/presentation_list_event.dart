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

import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:equatable/equatable.dart';

abstract class PresentationListEvent extends Equatable {
  const PresentationListEvent();
  @override
  List<Object?> get props => [];
}

class LoadPresentationList extends PresentationListEvent {}

class NewPage extends PresentationListEvent {}

class AddPresentationList extends PresentationListEvent {
  final PresentationModel? value;

  const AddPresentationList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddPresentationList{ value: $value }';
}

class UpdatePresentationList extends PresentationListEvent {
  final PresentationModel? value;

  const UpdatePresentationList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdatePresentationList{ value: $value }';
}

class DeletePresentationList extends PresentationListEvent {
  final PresentationModel? value;

  const DeletePresentationList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeletePresentationList{ value: $value }';
}

class PresentationListUpdated extends PresentationListEvent {
  final List<PresentationModel?>? value;
  final bool? mightHaveMore;

  const PresentationListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'PresentationListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

