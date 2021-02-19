/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_model.dart';

abstract class PhotoAndTextListEvent extends Equatable {
  const PhotoAndTextListEvent();
  @override
  List<Object> get props => [];
}

class LoadPhotoAndTextList extends PhotoAndTextListEvent {}

class NewPage extends PhotoAndTextListEvent {}

class AddPhotoAndTextList extends PhotoAndTextListEvent {
  final PhotoAndTextModel value;

  const AddPhotoAndTextList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddPhotoAndTextList{ value: $value }';
}

class UpdatePhotoAndTextList extends PhotoAndTextListEvent {
  final PhotoAndTextModel value;

  const UpdatePhotoAndTextList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdatePhotoAndTextList{ value: $value }';
}

class DeletePhotoAndTextList extends PhotoAndTextListEvent {
  final PhotoAndTextModel value;

  const DeletePhotoAndTextList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeletePhotoAndTextList{ value: $value }';
}

class PhotoAndTextListUpdated extends PhotoAndTextListEvent {
  final List<PhotoAndTextModel> value;
  final bool mightHaveMore;

  const PhotoAndTextListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'PhotoAndTextListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

