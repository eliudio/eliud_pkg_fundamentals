/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_form_event.dart
                       
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
abstract class PlayStoreFormEvent extends Equatable {
  const PlayStoreFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewPlayStoreFormEvent extends PlayStoreFormEvent {
}


class InitialisePlayStoreFormEvent extends PlayStoreFormEvent {
  final PlayStoreModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePlayStoreFormEvent({this.value});
}

class InitialisePlayStoreFormNoLoadEvent extends PlayStoreFormEvent {
  final PlayStoreModel value;

  @override
  List<Object> get props => [ value ];

  InitialisePlayStoreFormNoLoadEvent({this.value});
}

class ChangedPlayStoreDocumentID extends PlayStoreFormEvent {
  final String value;

  ChangedPlayStoreDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPlayStoreDocumentID{ value: $value }';
}

class ChangedPlayStoreAppId extends PlayStoreFormEvent {
  final String value;

  ChangedPlayStoreAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPlayStoreAppId{ value: $value }';
}

class ChangedPlayStoreDescription extends PlayStoreFormEvent {
  final String value;

  ChangedPlayStoreDescription({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPlayStoreDescription{ value: $value }';
}

class ChangedPlayStoreItemBackground extends PlayStoreFormEvent {
  final String value;

  ChangedPlayStoreItemBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedPlayStoreItemBackground{ value: $value }';
}

