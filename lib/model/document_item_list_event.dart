/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';

abstract class DocumentItemListEvent extends Equatable {
  const DocumentItemListEvent();
  @override
  List<Object> get props => [];
}

class LoadDocumentItemList extends DocumentItemListEvent {
  final String orderBy;
  final bool descending;

  LoadDocumentItemList({this.orderBy, this.descending});

  @override
  List<Object> get props => [orderBy, descending];

}

class LoadDocumentItemListWithDetails extends DocumentItemListEvent {}

class AddDocumentItemList extends DocumentItemListEvent {
  final DocumentItemModel value;

  const AddDocumentItemList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'AddDocumentItemList{ value: $value }';
}

class UpdateDocumentItemList extends DocumentItemListEvent {
  final DocumentItemModel value;

  const UpdateDocumentItemList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'UpdateDocumentItemList{ value: $value }';
}

class DeleteDocumentItemList extends DocumentItemListEvent {
  final DocumentItemModel value;

  const DeleteDocumentItemList({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DeleteDocumentItemList{ value: $value }';
}

class DocumentItemListUpdated extends DocumentItemListEvent {
  final List<DocumentItemModel> value;

  const DocumentItemListUpdated({ this.value });

  @override
  List<Object> get props => [ value ];

  @override
  String toString() => 'DocumentItemListUpdated{ value: $value }';
}

