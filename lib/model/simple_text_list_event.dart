/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';

abstract class SimpleTextListEvent extends Equatable {
  const SimpleTextListEvent();
  @override
  List<Object?> get props => [];
}

class LoadSimpleTextList extends SimpleTextListEvent {}

class NewPage extends SimpleTextListEvent {}

class AddSimpleTextList extends SimpleTextListEvent {
  final SimpleTextModel? value;

  const AddSimpleTextList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddSimpleTextList{ value: $value }';
}

class UpdateSimpleTextList extends SimpleTextListEvent {
  final SimpleTextModel? value;

  const UpdateSimpleTextList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateSimpleTextList{ value: $value }';
}

class DeleteSimpleTextList extends SimpleTextListEvent {
  final SimpleTextModel? value;

  const DeleteSimpleTextList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteSimpleTextList{ value: $value }';
}

class SimpleTextListUpdated extends SimpleTextListEvent {
  final List<SimpleTextModel?>? value;
  final bool? mightHaveMore;

  const SimpleTextListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'SimpleTextListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

