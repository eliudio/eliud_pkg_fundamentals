/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/link_model.dart';

abstract class LinkListState extends Equatable {
  const LinkListState();

  @override
  List<Object> get props => [];
}

class LinkListLoading extends LinkListState {}

class LinkListLoaded extends LinkListState {
  final List<LinkModel> values;

  const LinkListLoaded({this.values = const []});

  @override
  List<Object> get props => [ values ];

  @override
  String toString() => 'LinkListLoaded { values: $values }';
}

class LinkNotLoaded extends LinkListState {}

