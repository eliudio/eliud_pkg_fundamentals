/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:equatable/equatable.dart';

abstract class DividerListState extends Equatable {
  const DividerListState();

  @override
  List<Object?> get props => [];
}

class DividerListLoading extends DividerListState {}

class DividerListLoaded extends DividerListState {
  final List<DividerModel?>? values;
  final bool? mightHaveMore;

  const DividerListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'DividerListLoaded { values: $values }';
}

class DividerNotLoaded extends DividerListState {}

