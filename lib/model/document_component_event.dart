/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';

abstract class DocumentComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDocumentComponent extends DocumentComponentEvent {
  final String? id;

  FetchDocumentComponent({this.id});
}

class DocumentComponentUpdated extends DocumentComponentEvent {
  final DocumentModel value;

  DocumentComponentUpdated({required this.value});
}
