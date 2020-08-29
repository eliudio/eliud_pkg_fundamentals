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
import 'document_model.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();

  @override
  List<Object> get props => [];
}

class DocumentUninitialized extends DocumentState {}

class DocumentError extends DocumentState {
  final String message;
  DocumentError({ this.message });
}

class DocumentLoaded extends DocumentState {
  final DocumentModel value;

  const DocumentLoaded({ this.value });

  DocumentLoaded copyWith({ DocumentModel copyThis }) {
    return DocumentLoaded(value: copyThis ?? this.value);
  }

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'DocumentModelLoaded { value: $value }';
}


