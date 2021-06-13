/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/grid_model.dart';
import 'package:equatable/equatable.dart';

abstract class GridListEvent extends Equatable {
  const GridListEvent();
  @override
  List<Object?> get props => [];
}

class LoadGridList extends GridListEvent {}

class NewPage extends GridListEvent {}

class AddGridList extends GridListEvent {
  final GridModel? value;

  const AddGridList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'AddGridList{ value: $value }';
}

class UpdateGridList extends GridListEvent {
  final GridModel? value;

  const UpdateGridList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'UpdateGridList{ value: $value }';
}

class DeleteGridList extends GridListEvent {
  final GridModel? value;

  const DeleteGridList({ this.value });

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'DeleteGridList{ value: $value }';
}

class GridListUpdated extends GridListEvent {
  final List<GridModel?>? value;
  final bool? mightHaveMore;

  const GridListUpdated({ this.value, this.mightHaveMore });

  @override
  List<Object?> get props => [ value, mightHaveMore ];

  @override
  String toString() => 'GridListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

