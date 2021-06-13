/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';
import 'package:equatable/equatable.dart';

abstract class SimpleImageListEvent extends Equatable {
  const SimpleImageListEvent();
  @override
  List<Object?> get props => [];
}

class LoadSimpleImageList extends SimpleImageListEvent {}

class NewPage extends SimpleImageListEvent {}

class AddSimpleImageList extends SimpleImageListEvent {
  final SimpleImageModel? value;

  const AddSimpleImageList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddSimpleImageList{ value: $value }';
}

class UpdateSimpleImageList extends SimpleImageListEvent {
  final SimpleImageModel? value;

  const UpdateSimpleImageList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateSimpleImageList{ value: $value }';
}

class DeleteSimpleImageList extends SimpleImageListEvent {
  final SimpleImageModel? value;

  const DeleteSimpleImageList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteSimpleImageList{ value: $value }';
}

class SimpleImageListUpdated extends SimpleImageListEvent {
  final List<SimpleImageModel?>? value;
  final bool? mightHaveMore;

  const SimpleImageListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'SimpleImageListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

