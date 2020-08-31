/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';

abstract class SectionListState extends Equatable {
  const SectionListState();

  @override
  List<Object> get props => [];
}

class SectionListLoading extends SectionListState {}

class SectionListLoaded extends SectionListState {
  final List<SectionModel> values;

  const SectionListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'SectionListLoaded { values: $values }';
}

class SectionNotLoaded extends SectionListState {}

