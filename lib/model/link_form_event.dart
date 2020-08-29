/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_form_event.dart
                       
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
abstract class LinkFormEvent extends Equatable {
  const LinkFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewLinkFormEvent extends LinkFormEvent {
}


class InitialiseLinkFormEvent extends LinkFormEvent {
  final LinkModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseLinkFormEvent({this.value});
}

class InitialiseLinkFormNoLoadEvent extends LinkFormEvent {
  final LinkModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseLinkFormNoLoadEvent({this.value});
}

class ChangedLinkDocumentID extends LinkFormEvent {
  final String value;

  ChangedLinkDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedLinkDocumentID{ value: $value }';
}

class ChangedLinkLinkText extends LinkFormEvent {
  final String value;

  ChangedLinkLinkText({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedLinkLinkText{ value: $value }';
}

class ChangedLinkAction extends LinkFormEvent {
  final ActionModel value;

  ChangedLinkAction({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedLinkAction{ value: $value }';
}

