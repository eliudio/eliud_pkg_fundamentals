/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_form_event.dart
                       
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
abstract class SimpleImageFormEvent extends Equatable {
  const SimpleImageFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewSimpleImageFormEvent extends SimpleImageFormEvent {
}


class InitialiseSimpleImageFormEvent extends SimpleImageFormEvent {
  final SimpleImageModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseSimpleImageFormEvent({this.value});
}

class InitialiseSimpleImageFormNoLoadEvent extends SimpleImageFormEvent {
  final SimpleImageModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialiseSimpleImageFormNoLoadEvent({this.value});
}

class ChangedSimpleImageDocumentID extends SimpleImageFormEvent {
  final String? value;

  ChangedSimpleImageDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleImageDocumentID{ value: $value }';
}

class ChangedSimpleImageAppId extends SimpleImageFormEvent {
  final String? value;

  ChangedSimpleImageAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleImageAppId{ value: $value }';
}

class ChangedSimpleImageDescription extends SimpleImageFormEvent {
  final String? value;

  ChangedSimpleImageDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleImageDescription{ value: $value }';
}

class ChangedSimpleImageImage extends SimpleImageFormEvent {
  final String? value;

  ChangedSimpleImageImage({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleImageImage{ value: $value }';
}

class ChangedSimpleImageConditions extends SimpleImageFormEvent {
  final StorageConditionsModel? value;

  ChangedSimpleImageConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedSimpleImageConditions{ value: $value }';
}

