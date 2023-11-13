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

import 'package:eliud_pkg_fundamentals/model/document_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/document_repository.dart';

class DocumentComponentBloc
    extends Bloc<DocumentComponentEvent, DocumentComponentState> {
  final DocumentRepository? documentRepository;
  StreamSubscription? _documentSubscription;

  void _mapLoadDocumentComponentUpdateToState(String documentId) {
    _documentSubscription?.cancel();
    _documentSubscription = documentRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(DocumentComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct DocumentComponentBloc
   */
  DocumentComponentBloc({this.documentRepository})
      : super(DocumentComponentUninitialized()) {
    on<FetchDocumentComponent>((event, emit) {
      _mapLoadDocumentComponentUpdateToState(event.id!);
    });
    on<DocumentComponentUpdated>((event, emit) {
      emit(DocumentComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the DocumentComponentBloc
   */
  @override
  Future<void> close() {
    _documentSubscription?.cancel();
    return super.close();
  }
}
