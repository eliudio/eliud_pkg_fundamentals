/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


@immutable
abstract class DocumentFormEvent extends Equatable {
  const DocumentFormEvent();

  @override
  List<Object> get props => [];
}

class InitialiseNewDocumentFormEvent extends DocumentFormEvent {
}


class InitialiseDocumentFormEvent extends DocumentFormEvent {
  final DocumentModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseDocumentFormEvent({this.value});
}

class InitialiseDocumentFormNoLoadEvent extends DocumentFormEvent {
  final DocumentModel value;

  @override
  List<Object> get props => [ value ];

  InitialiseDocumentFormNoLoadEvent({this.value});
}

class ChangedDocumentDocumentID extends DocumentFormEvent {
  final String value;

  ChangedDocumentDocumentID({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDocumentDocumentID{ value: $value }';
}

class ChangedDocumentAppId extends DocumentFormEvent {
  final String value;

  ChangedDocumentAppId({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDocumentAppId{ value: $value }';
}

class ChangedDocumentName extends DocumentFormEvent {
  final String value;

  ChangedDocumentName({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDocumentName{ value: $value }';
}

class ChangedDocumentDocumentRenderer extends DocumentFormEvent {
  final DocumentRenderer value;

  ChangedDocumentDocumentRenderer({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDocumentDocumentRenderer{ value: $value }';
}

class ChangedDocumentContent extends DocumentFormEvent {
  final String value;

  ChangedDocumentContent({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDocumentContent{ value: $value }';
}

class ChangedDocumentPadding extends DocumentFormEvent {
  final String value;

  ChangedDocumentPadding({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDocumentPadding{ value: $value }';
}

class ChangedDocumentImages extends DocumentFormEvent {
  final List<DocumentItemModel> value;

  ChangedDocumentImages({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDocumentImages{ value: $value }';
}

class ChangedDocumentBackground extends DocumentFormEvent {
  final String value;

  ChangedDocumentBackground({this.value});

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'ChangedDocumentBackground{ value: $value }';
}

