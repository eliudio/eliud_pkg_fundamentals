/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';

abstract class PresentationListState extends Equatable {
  const PresentationListState();

  @override
  List<Object> get props => [];
}

class PresentationListLoading extends PresentationListState {}

class PresentationListLoaded extends PresentationListState {
  final List<PresentationModel> values;

  const PresentationListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'PresentationListLoaded { values: $values }';
}

class PresentationNotLoaded extends PresentationListState {}

