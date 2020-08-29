/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'document_model.dart';
import 'document_component_event.dart';
import 'document_component_state.dart';
import 'document_repository.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final DocumentRepository documentRepository;

  DocumentBloc({ this.documentRepository }): super(DocumentUninitialized());
  @override
  Stream<DocumentState> mapEventToState(DocumentEvent event) async* {
    final currentState = state;
    if (event is FetchDocument) {
      try {
        if (currentState is DocumentUninitialized) {
          final DocumentModel model = await _fetchDocument(event.id);

          if (model != null) {
            yield DocumentLoaded(value: model);
          } else {
            String id = event.id;
            yield DocumentError(message: "Document with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield DocumentError(message: "Unknown error whilst retrieving Document");
      }
    }
  }

  Future<DocumentModel> _fetchDocument(String id) async {
    return documentRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


