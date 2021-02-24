/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_form_event.dart
                       
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
abstract class SimpleTextFormEvent extends Equatable {
  const SimpleTextFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewSimpleTextFormEvent extends SimpleTextFormEvent {
}


class InitialiseSimpleTextFormEvent extends SimpleTextFormEvent {
  final SimpleTextModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseSimpleTextFormEvent({this.value});
}

class InitialiseSimpleTextFormNoLoadEvent extends SimpleTextFormEvent {
  final SimpleTextModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseSimpleTextFormNoLoadEvent({this.value});
}

class ChangedSimpleTextDocumentID extends SimpleTextFormEvent {
  final String value;

  ChangedSimpleTextDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleTextDocumentID{ value: $value }';
}

class ChangedSimpleTextAppId extends SimpleTextFormEvent {
  final String value;

  ChangedSimpleTextAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleTextAppId{ value: $value }';
}

class ChangedSimpleTextTitle extends SimpleTextFormEvent {
  final String value;

  ChangedSimpleTextTitle({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleTextTitle{ value: $value }';
}

class ChangedSimpleTextText extends SimpleTextFormEvent {
  final String value;

  ChangedSimpleTextText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleTextText{ value: $value }';
}

class ChangedSimpleTextConditions extends SimpleTextFormEvent {
  final ConditionsSimpleModel value;

  ChangedSimpleTextConditions({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleTextConditions{ value: $value }';
}

class ChangedSimpleTextTextAlign extends SimpleTextFormEvent {
  final SimpleTextAlign value;

  ChangedSimpleTextTextAlign({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleTextTextAlign{ value: $value }';
}

