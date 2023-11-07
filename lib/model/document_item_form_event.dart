/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

@immutable
abstract class DocumentItemFormEvent extends Equatable {
  const DocumentItemFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewDocumentItemFormEvent extends DocumentItemFormEvent {}

class InitialiseDocumentItemFormEvent extends DocumentItemFormEvent {
  final DocumentItemModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseDocumentItemFormEvent({this.value});
}

class InitialiseDocumentItemFormNoLoadEvent extends DocumentItemFormEvent {
  final DocumentItemModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseDocumentItemFormNoLoadEvent({this.value});
}

class ChangedDocumentItemDocumentID extends DocumentItemFormEvent {
  final String? value;

  ChangedDocumentItemDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDocumentItemDocumentID{ value: $value }';
}

class ChangedDocumentItemReference extends DocumentItemFormEvent {
  final String? value;

  ChangedDocumentItemReference({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDocumentItemReference{ value: $value }';
}

class ChangedDocumentItemImage extends DocumentItemFormEvent {
  final String? value;

  ChangedDocumentItemImage({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedDocumentItemImage{ value: $value }';
}
