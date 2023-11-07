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

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';

abstract class BookletListEvent extends Equatable {
  const BookletListEvent();
  @override
  List<Object?> get props => [];
}

class LoadBookletList extends BookletListEvent {}

class NewPage extends BookletListEvent {}

class AddBookletList extends BookletListEvent {
  final BookletModel? value;

  const AddBookletList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddBookletList{ value: $value }';
}

class UpdateBookletList extends BookletListEvent {
  final BookletModel? value;

  const UpdateBookletList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateBookletList{ value: $value }';
}

class DeleteBookletList extends BookletListEvent {
  final BookletModel? value;

  const DeleteBookletList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteBookletList{ value: $value }';
}

class BookletListUpdated extends BookletListEvent {
  final List<BookletModel?>? value;
  final bool? mightHaveMore;

  const BookletListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'BookletListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class BookletChangeQuery extends BookletListEvent {
  final EliudQuery? newQuery;

  const BookletChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'BookletChangeQuery{ value: $newQuery }';
}
