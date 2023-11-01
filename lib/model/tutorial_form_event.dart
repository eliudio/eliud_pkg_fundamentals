/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';


@immutable
abstract class TutorialFormEvent extends Equatable {
  const TutorialFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewTutorialFormEvent extends TutorialFormEvent {
}


class InitialiseTutorialFormEvent extends TutorialFormEvent {
  final TutorialModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseTutorialFormEvent({this.value});
}

class InitialiseTutorialFormNoLoadEvent extends TutorialFormEvent {
  final TutorialModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseTutorialFormNoLoadEvent({this.value});
}

class ChangedTutorialDocumentID extends TutorialFormEvent {
  final String? value;

  ChangedTutorialDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialDocumentID{ value: $value }';
}

class ChangedTutorialAppId extends TutorialFormEvent {
  final String? value;

  ChangedTutorialAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialAppId{ value: $value }';
}

class ChangedTutorialName extends TutorialFormEvent {
  final String? value;

  ChangedTutorialName({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialName{ value: $value }';
}

class ChangedTutorialTitle extends TutorialFormEvent {
  final String? value;

  ChangedTutorialTitle({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialTitle{ value: $value }';
}

class ChangedTutorialDescription extends TutorialFormEvent {
  final String? value;

  ChangedTutorialDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialDescription{ value: $value }';
}

class ChangedTutorialTutorialEntries extends TutorialFormEvent {
  final List<TutorialEntryModel>? value;

  ChangedTutorialTutorialEntries({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialTutorialEntries{ value: $value }';
}

class ChangedTutorialConditions extends TutorialFormEvent {
  final StorageConditionsModel? value;

  ChangedTutorialConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialConditions{ value: $value }';
}

