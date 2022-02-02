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
import 'package:flutter/services.dart';

class DocumentComponentBloc extends Bloc<DocumentComponentEvent, DocumentComponentState> {
  final DocumentRepository? documentRepository;
  StreamSubscription? _documentSubscription;

  Stream<DocumentComponentState> _mapLoadDocumentComponentUpdateToState(String documentId) async* {
    _documentSubscription?.cancel();
    _documentSubscription = documentRepository!.listenTo(documentId, (value) {
      if (value != null) add(DocumentComponentUpdated(value: value));
    });
  }

  DocumentComponentBloc({ this.documentRepository }): super(DocumentComponentUninitialized());

  @override
  Stream<DocumentComponentState> mapEventToState(DocumentComponentEvent event) async* {
    final currentState = state;
    if (event is FetchDocumentComponent) {
      yield* _mapLoadDocumentComponentUpdateToState(event.id!);
    } else if (event is DocumentComponentUpdated) {
      yield DocumentComponentLoaded(value: event.value);
    }
  }

  @override
  Future<void> close() {
    _documentSubscription?.cancel();
    return super.close();
  }

}

