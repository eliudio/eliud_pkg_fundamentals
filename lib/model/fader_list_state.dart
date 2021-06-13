/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:equatable/equatable.dart';

abstract class FaderListState extends Equatable {
  const FaderListState();

  @override
  List<Object?> get props => [];
}

class FaderListLoading extends FaderListState {}

class FaderListLoaded extends FaderListState {
  final List<FaderModel?>? values;
  final bool? mightHaveMore;

  const FaderListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'FaderListLoaded { values: $values }';
}

class FaderNotLoaded extends FaderListState {}

