/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'document_model.dart';

abstract class DocumentListEvent extends Equatable {
  const DocumentListEvent();
  @override
  List<Object> get props => [];
}

class LoadDocumentList extends DocumentListEvent {}
class LoadDocumentListWithDetails extends DocumentListEvent {}

class AddDocumentList extends DocumentListEvent {
  final DocumentModel value;

  const AddDocumentList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddDocumentList{ value: $value }';
}

class UpdateDocumentList extends DocumentListEvent {
  final DocumentModel value;

  const UpdateDocumentList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateDocumentList{ value: $value }';
}

class DeleteDocumentList extends DocumentListEvent {
  final DocumentModel value;

  const DeleteDocumentList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteDocumentList{ value: $value }';
}

class DocumentListUpdated extends DocumentListEvent {
  final List<DocumentModel> value;

  const DocumentListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DocumentListUpdated{ value: $value }';
}

