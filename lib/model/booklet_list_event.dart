/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'booklet_model.dart';

abstract class BookletListEvent extends Equatable {
  const BookletListEvent();
  @override
  List<Object> get props => [];
}

class LoadBookletList extends BookletListEvent {}
class LoadBookletListWithDetails extends BookletListEvent {}

class AddBookletList extends BookletListEvent {
  final BookletModel value;

  const AddBookletList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddBookletList{ value: $value }';
}

class UpdateBookletList extends BookletListEvent {
  final BookletModel value;

  const UpdateBookletList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateBookletList{ value: $value }';
}

class DeleteBookletList extends BookletListEvent {
  final BookletModel value;

  const DeleteBookletList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteBookletList{ value: $value }';
}

class BookletListUpdated extends BookletListEvent {
  final List<BookletModel> value;

  const BookletListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'BookletListUpdated{ value: $value }';
}

