/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


@immutable
abstract class PhotoAndTextFormEvent extends Equatable {
  const PhotoAndTextFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewPhotoAndTextFormEvent extends PhotoAndTextFormEvent {
}


class InitialisePhotoAndTextFormEvent extends PhotoAndTextFormEvent {
  final PhotoAndTextModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePhotoAndTextFormEvent({this.value});
}

class InitialisePhotoAndTextFormNoLoadEvent extends PhotoAndTextFormEvent {
  final PhotoAndTextModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePhotoAndTextFormNoLoadEvent({this.value});
}

class ChangedPhotoAndTextDocumentID extends PhotoAndTextFormEvent {
  final String value;

  ChangedPhotoAndTextDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPhotoAndTextDocumentID{ value: $value }';
}

class ChangedPhotoAndTextAppId extends PhotoAndTextFormEvent {
  final String value;

  ChangedPhotoAndTextAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPhotoAndTextAppId{ value: $value }';
}

class ChangedPhotoAndTextName extends PhotoAndTextFormEvent {
  final String value;

  ChangedPhotoAndTextName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPhotoAndTextName{ value: $value }';
}

class ChangedPhotoAndTextTitle extends PhotoAndTextFormEvent {
  final String value;

  ChangedPhotoAndTextTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPhotoAndTextTitle{ value: $value }';
}

class ChangedPhotoAndTextContents extends PhotoAndTextFormEvent {
  final String value;

  ChangedPhotoAndTextContents({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPhotoAndTextContents{ value: $value }';
}

class ChangedPhotoAndTextImage extends PhotoAndTextFormEvent {
  final String value;

  ChangedPhotoAndTextImage({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPhotoAndTextImage{ value: $value }';
}

class ChangedPhotoAndTextImagePosition extends PhotoAndTextFormEvent {
  final PhotoAndTextImagePosition value;

  ChangedPhotoAndTextImagePosition({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPhotoAndTextImagePosition{ value: $value }';
}

class ChangedPhotoAndTextConditions extends PhotoAndTextFormEvent {
  final ConditionsSimpleModel value;

  ChangedPhotoAndTextConditions({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPhotoAndTextConditions{ value: $value }';
}

