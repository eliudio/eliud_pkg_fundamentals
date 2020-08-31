/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


@immutable
abstract class SectionFormEvent extends Equatable {
  const SectionFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewSectionFormEvent extends SectionFormEvent {
}


class InitialiseSectionFormEvent extends SectionFormEvent {
  final SectionModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseSectionFormEvent({this.value});
}

class InitialiseSectionFormNoLoadEvent extends SectionFormEvent {
  final SectionModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseSectionFormNoLoadEvent({this.value});
}

class ChangedSectionDocumentID extends SectionFormEvent {
  final String value;

  ChangedSectionDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSectionDocumentID{ value: $value }';
}

class ChangedSectionTitle extends SectionFormEvent {
  final String value;

  ChangedSectionTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSectionTitle{ value: $value }';
}

class ChangedSectionDescription extends SectionFormEvent {
  final String value;

  ChangedSectionDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSectionDescription{ value: $value }';
}

class ChangedSectionImage extends SectionFormEvent {
  final String value;

  ChangedSectionImage({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSectionImage{ value: $value }';
}

class ChangedSectionImagePositionRelative extends SectionFormEvent {
  final RelativeImagePosition value;

  ChangedSectionImagePositionRelative({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSectionImagePositionRelative{ value: $value }';
}

class ChangedSectionImageAlignment extends SectionFormEvent {
  final SectionImageAlignment value;

  ChangedSectionImageAlignment({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSectionImageAlignment{ value: $value }';
}

class ChangedSectionImageWidth extends SectionFormEvent {
  final String value;

  ChangedSectionImageWidth({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSectionImageWidth{ value: $value }';
}

class ChangedSectionLinks extends SectionFormEvent {
  final List<LinkModel> value;

  ChangedSectionLinks({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSectionLinks{ value: $value }';
}

