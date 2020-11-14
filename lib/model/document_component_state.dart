/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';

abstract class DocumentComponentState extends Equatable {
  const DocumentComponentState();

  @override
  List<Object> get props => [];
}

class DocumentComponentUninitialized extends DocumentComponentState {}

class DocumentComponentError extends DocumentComponentState {
  final String message;
  DocumentComponentError({ this.message });
}

class DocumentComponentLoaded extends DocumentComponentState {
  final DocumentModel value;

  const DocumentComponentLoaded({ this.value });

  DocumentComponentLoaded copyWith({ DocumentModel copyThis }) {
    return DocumentComponentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'DocumentComponentLoaded { value: $value }';
}


