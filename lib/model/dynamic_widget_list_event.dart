/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_model.dart';

abstract class DynamicWidgetListEvent extends Equatable {
  const DynamicWidgetListEvent();
  @override
  List<Object?> get props => [];
}

class LoadDynamicWidgetList extends DynamicWidgetListEvent {}

class NewPage extends DynamicWidgetListEvent {}

class AddDynamicWidgetList extends DynamicWidgetListEvent {
  final DynamicWidgetModel? value;

  const AddDynamicWidgetList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddDynamicWidgetList{ value: $value }';
}

class UpdateDynamicWidgetList extends DynamicWidgetListEvent {
  final DynamicWidgetModel? value;

  const UpdateDynamicWidgetList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateDynamicWidgetList{ value: $value }';
}

class DeleteDynamicWidgetList extends DynamicWidgetListEvent {
  final DynamicWidgetModel? value;

  const DeleteDynamicWidgetList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteDynamicWidgetList{ value: $value }';
}

class DynamicWidgetListUpdated extends DynamicWidgetListEvent {
  final List<DynamicWidgetModel?>? value;
  final bool? mightHaveMore;

  const DynamicWidgetListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'DynamicWidgetListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class DynamicWidgetChangeQuery extends DynamicWidgetListEvent {
  final EliudQuery? newQuery;

  const DynamicWidgetChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'DynamicWidgetChangeQuery{ value: $newQuery }';
}
