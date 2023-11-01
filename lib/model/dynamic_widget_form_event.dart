/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';


@immutable
abstract class DynamicWidgetFormEvent extends Equatable {
  const DynamicWidgetFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewDynamicWidgetFormEvent extends DynamicWidgetFormEvent {
}


class InitialiseDynamicWidgetFormEvent extends DynamicWidgetFormEvent {
  final DynamicWidgetModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseDynamicWidgetFormEvent({this.value});
}

class InitialiseDynamicWidgetFormNoLoadEvent extends DynamicWidgetFormEvent {
  final DynamicWidgetModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseDynamicWidgetFormNoLoadEvent({this.value});
}

class ChangedDynamicWidgetDocumentID extends DynamicWidgetFormEvent {
  final String? value;

  ChangedDynamicWidgetDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDynamicWidgetDocumentID{ value: $value }';
}

class ChangedDynamicWidgetAppId extends DynamicWidgetFormEvent {
  final String? value;

  ChangedDynamicWidgetAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDynamicWidgetAppId{ value: $value }';
}

class ChangedDynamicWidgetDescription extends DynamicWidgetFormEvent {
  final String? value;

  ChangedDynamicWidgetDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDynamicWidgetDescription{ value: $value }';
}

class ChangedDynamicWidgetContent extends DynamicWidgetFormEvent {
  final String? value;

  ChangedDynamicWidgetContent({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDynamicWidgetContent{ value: $value }';
}

class ChangedDynamicWidgetBackground extends DynamicWidgetFormEvent {
  final BackgroundModel? value;

  ChangedDynamicWidgetBackground({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDynamicWidgetBackground{ value: $value }';
}

class ChangedDynamicWidgetConditions extends DynamicWidgetFormEvent {
  final StorageConditionsModel? value;

  ChangedDynamicWidgetConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDynamicWidgetConditions{ value: $value }';
}

