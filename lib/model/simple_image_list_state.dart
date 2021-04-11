/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';

abstract class SimpleImageListState extends Equatable {
  const SimpleImageListState();

  @override
  List<Object?> get props => [];
}

class SimpleImageListLoading extends SimpleImageListState {}

class SimpleImageListLoaded extends SimpleImageListState {
  final List<SimpleImageModel?>? values;
  final bool? mightHaveMore;

  const SimpleImageListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'SimpleImageListLoaded { values: $values }';
}

class SimpleImageNotLoaded extends SimpleImageListState {}

