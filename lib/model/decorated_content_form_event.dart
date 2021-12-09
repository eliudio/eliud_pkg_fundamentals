/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_form_event.dart
                       
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
abstract class DecoratedContentFormEvent extends Equatable {
  const DecoratedContentFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewDecoratedContentFormEvent extends DecoratedContentFormEvent {
}


class InitialiseDecoratedContentFormEvent extends DecoratedContentFormEvent {
  final DecoratedContentModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseDecoratedContentFormEvent({this.value});
}

class InitialiseDecoratedContentFormNoLoadEvent extends DecoratedContentFormEvent {
  final DecoratedContentModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseDecoratedContentFormNoLoadEvent({this.value});
}

class ChangedDecoratedContentDocumentID extends DecoratedContentFormEvent {
  final String? value;

  ChangedDecoratedContentDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecoratedContentDocumentID{ value: $value }';
}

class ChangedDecoratedContentAppId extends DecoratedContentFormEvent {
  final String? value;

  ChangedDecoratedContentAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecoratedContentAppId{ value: $value }';
}

class ChangedDecoratedContentName extends DecoratedContentFormEvent {
  final String? value;

  ChangedDecoratedContentName({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecoratedContentName{ value: $value }';
}

class ChangedDecoratedContentDecoratingComponentName extends DecoratedContentFormEvent {
  final String? value;

  ChangedDecoratedContentDecoratingComponentName({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecoratedContentDecoratingComponentName{ value: $value }';
}

class ChangedDecoratedContentDecoratingComponentId extends DecoratedContentFormEvent {
  final String? value;

  ChangedDecoratedContentDecoratingComponentId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecoratedContentDecoratingComponentId{ value: $value }';
}

class ChangedDecoratedContentContentComponentName extends DecoratedContentFormEvent {
  final String? value;

  ChangedDecoratedContentContentComponentName({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecoratedContentContentComponentName{ value: $value }';
}

class ChangedDecoratedContentContentComponentId extends DecoratedContentFormEvent {
  final String? value;

  ChangedDecoratedContentContentComponentId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecoratedContentContentComponentId{ value: $value }';
}

class ChangedDecoratedContentDecorationComponentPosition extends DecoratedContentFormEvent {
  final DecorationComponentPosition? value;

  ChangedDecoratedContentDecorationComponentPosition({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecoratedContentDecorationComponentPosition{ value: $value }';
}

class ChangedDecoratedContentPercentageDecorationVisible extends DecoratedContentFormEvent {
  final String? value;

  ChangedDecoratedContentPercentageDecorationVisible({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecoratedContentPercentageDecorationVisible{ value: $value }';
}

class ChangedDecoratedContentConditions extends DecoratedContentFormEvent {
  final StorageConditionsModel? value;

  ChangedDecoratedContentConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedDecoratedContentConditions{ value: $value }';
}

