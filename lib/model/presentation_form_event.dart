/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_form_event.dart
                       
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
abstract class PresentationFormEvent extends Equatable {
  const PresentationFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewPresentationFormEvent extends PresentationFormEvent {
}


class InitialisePresentationFormEvent extends PresentationFormEvent {
  final PresentationModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialisePresentationFormEvent({this.value});
}

class InitialisePresentationFormNoLoadEvent extends PresentationFormEvent {
  final PresentationModel? value;

  @override
  List<Object?> get props => [ value ];

  InitialisePresentationFormNoLoadEvent({this.value});
}

class ChangedPresentationDocumentID extends PresentationFormEvent {
  final String? value;

  ChangedPresentationDocumentID({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPresentationDocumentID{ value: $value }';
}

class ChangedPresentationAppId extends PresentationFormEvent {
  final String? value;

  ChangedPresentationAppId({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPresentationAppId{ value: $value }';
}

class ChangedPresentationDescription extends PresentationFormEvent {
  final String? value;

  ChangedPresentationDescription({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPresentationDescription{ value: $value }';
}

class ChangedPresentationBodyComponents extends PresentationFormEvent {
  final List<BodyComponentModel>? value;

  ChangedPresentationBodyComponents({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPresentationBodyComponents{ value: $value }';
}

class ChangedPresentationImage extends PresentationFormEvent {
  final String? value;

  ChangedPresentationImage({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPresentationImage{ value: $value }';
}

class ChangedPresentationImagePositionRelative extends PresentationFormEvent {
  final PresentationRelativeImagePosition? value;

  ChangedPresentationImagePositionRelative({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPresentationImagePositionRelative{ value: $value }';
}

class ChangedPresentationImageAlignment extends PresentationFormEvent {
  final PresentationImageAlignment? value;

  ChangedPresentationImageAlignment({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPresentationImageAlignment{ value: $value }';
}

class ChangedPresentationImageWidth extends PresentationFormEvent {
  final String? value;

  ChangedPresentationImageWidth({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPresentationImageWidth{ value: $value }';
}

class ChangedPresentationConditions extends PresentationFormEvent {
  final StorageConditionsModel? value;

  ChangedPresentationConditions({this.value});

  @override
  List<Object?> get props => [ value ];

  @override
  String toString() => 'ChangedPresentationConditions{ value: $value }';
}

