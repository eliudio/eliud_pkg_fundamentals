/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_model.dart';

abstract class PhotoAndTextListState extends Equatable {
  const PhotoAndTextListState();

  @override
  List<Object> get props => [];
}

class PhotoAndTextListLoading extends PhotoAndTextListState {}

class PhotoAndTextListLoaded extends PhotoAndTextListState {
  final List<PhotoAndTextModel> values;
  final bool mightHaveMore;

  const PhotoAndTextListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object> get props => [ values, mightHaveMore ];

  @override
  String toString() => 'PhotoAndTextListLoaded { values: $values }';
}

class PhotoAndTextNotLoaded extends PhotoAndTextListState {}

