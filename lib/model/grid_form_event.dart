/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';


@immutable
abstract class GridFormEvent extends Equatable {
  const GridFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewGridFormEvent extends GridFormEvent {
}


class InitialiseGridFormEvent extends GridFormEvent {
  final GridModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseGridFormEvent({this.value});
}

class InitialiseGridFormNoLoadEvent extends GridFormEvent {
  final GridModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseGridFormNoLoadEvent({this.value});
}

class ChangedGridDocumentID extends GridFormEvent {
  final String? value;

  ChangedGridDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedGridDocumentID{ value: $value }';
}

class ChangedGridAppId extends GridFormEvent {
  final String? value;

  ChangedGridAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedGridAppId{ value: $value }';
}

class ChangedGridDescription extends GridFormEvent {
  final String? value;

  ChangedGridDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedGridDescription{ value: $value }';
}

class ChangedGridBodyComponents extends GridFormEvent {
  final List<BodyComponentModel>? value;

  ChangedGridBodyComponents({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedGridBodyComponents{ value: $value }';
}

class ChangedGridGridView extends GridFormEvent {
  final String? value;

  ChangedGridGridView({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedGridGridView{ value: $value }';
}

class ChangedGridConditions extends GridFormEvent {
  final StorageConditionsModel? value;

  ChangedGridConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedGridConditions{ value: $value }';
}

