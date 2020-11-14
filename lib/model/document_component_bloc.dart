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

import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/document_repository.dart';

class DocumentComponentBloc extends Bloc<DocumentComponentEvent, DocumentComponentState> {
  final DocumentRepository documentRepository;

  DocumentComponentBloc({ this.documentRepository }): super(DocumentComponentUninitialized());
  @override
  Stream<DocumentComponentState> mapEventToState(DocumentComponentEvent event) async* {
    final currentState = state;
    if (event is FetchDocumentComponent) {
      try {
        if (currentState is DocumentComponentUninitialized) {
          final DocumentModel model = await _fetchDocument(event.id);

          if (model != null) {
            yield DocumentComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield DocumentComponentError(message: "Document with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield DocumentComponentError(message: "Unknown error whilst retrieving Document");
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


