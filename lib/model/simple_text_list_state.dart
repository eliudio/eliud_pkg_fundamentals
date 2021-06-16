/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';

abstract class SimpleTextListState extends Equatable {
  const SimpleTextListState();

  @override
  List<Object?> get props => [];
}

class SimpleTextListLoading extends SimpleTextListState {}

class SimpleTextListLoaded extends SimpleTextListState {
  final List<SimpleTextModel?>? values;
  final bool? mightHaveMore;

  const SimpleTextListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'SimpleTextListLoaded { values: $values }';
}

class SimpleTextNotLoaded extends SimpleTextListState {}

