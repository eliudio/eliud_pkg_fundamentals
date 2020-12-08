/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';

abstract class DividerListEvent extends Equatable {
  const DividerListEvent();
  @override
  List<Object> get props => [];
}

class LoadDividerList extends DividerListEvent {
  final String orderBy;
  final bool descending;

  LoadDividerList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadDividerListWithDetails extends DividerListEvent {}

class AddDividerList extends DividerListEvent {
  final DividerModel value;

  const AddDividerList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddDividerList{ value: $value }';
}

class UpdateDividerList extends DividerListEvent {
  final DividerModel value;

  const UpdateDividerList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateDividerList{ value: $value }';
}

class DeleteDividerList extends DividerListEvent {
  final DividerModel value;

  const DeleteDividerList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteDividerList{ value: $value }';
}

class DividerListUpdated extends DividerListEvent {
  final List<DividerModel> value;

  const DividerListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DividerListUpdated{ value: $value }';
}

