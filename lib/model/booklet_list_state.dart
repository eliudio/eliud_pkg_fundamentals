/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'booklet_model.dart';

abstract class BookletListState extends Equatable {
  const BookletListState();

  @override
  List<Object> get props => [];
}

class BookletListLoading extends BookletListState {}

class BookletListLoaded extends BookletListState {
  final List<BookletModel> values;

  const BookletListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'BookletListLoaded { values: $values }';
}

class BookletNotLoaded extends BookletListState {}

