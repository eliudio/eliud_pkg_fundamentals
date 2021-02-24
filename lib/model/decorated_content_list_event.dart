/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_model.dart';

abstract class DecoratedContentListEvent extends Equatable {
  const DecoratedContentListEvent();
  @override
  List<Object> get props => [];
}

class LoadDecoratedContentList extends DecoratedContentListEvent {}

class NewPage extends DecoratedContentListEvent {}

class AddDecoratedContentList extends DecoratedContentListEvent {
  final DecoratedContentModel value;

  const AddDecoratedContentList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddDecoratedContentList{ value: $value }';
}

class UpdateDecoratedContentList extends DecoratedContentListEvent {
  final DecoratedContentModel value;

  const UpdateDecoratedContentList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateDecoratedContentList{ value: $value }';
}

class DeleteDecoratedContentList extends DecoratedContentListEvent {
  final DecoratedContentModel value;

  const DeleteDecoratedContentList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteDecoratedContentList{ value: $value }';
}

class DecoratedContentListUpdated extends DecoratedContentListEvent {
  final List<DecoratedContentModel> value;
  final bool mightHaveMore;

  const DecoratedContentListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'DecoratedContentListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

