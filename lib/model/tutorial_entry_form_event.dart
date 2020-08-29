/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


@immutable
abstract class TutorialEntryFormEvent extends Equatable {
  const TutorialEntryFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewTutorialEntryFormEvent extends TutorialEntryFormEvent {
}


class InitialiseTutorialEntryFormEvent extends TutorialEntryFormEvent {
  final TutorialEntryModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseTutorialEntryFormEvent({this.value});
}

class InitialiseTutorialEntryFormNoLoadEvent extends TutorialEntryFormEvent {
  final TutorialEntryModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseTutorialEntryFormNoLoadEvent({this.value});
}

class ChangedTutorialEntryDocumentID extends TutorialEntryFormEvent {
  final String value;

  ChangedTutorialEntryDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialEntryDocumentID{ value: $value }';
}

class ChangedTutorialEntryDescription extends TutorialEntryFormEvent {
  final String value;

  ChangedTutorialEntryDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialEntryDescription{ value: $value }';
}

class ChangedTutorialEntryImage extends TutorialEntryFormEvent {
  final String value;

  ChangedTutorialEntryImage({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialEntryImage{ value: $value }';
}

class ChangedTutorialEntryCode extends TutorialEntryFormEvent {
  final String value;

  ChangedTutorialEntryCode({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedTutorialEntryCode{ value: $value }';
}

