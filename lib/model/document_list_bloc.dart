/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/document_repository.dart';
import 'package:eliud_pkg_fundamentals/model/document_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class DocumentListBloc extends Bloc<DocumentListEvent, DocumentListState> {
  final DocumentRepository _documentRepository;
  StreamSubscription _documentsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  DocumentListBloc(this.accessBloc,{ this.eliudQuery, @required DocumentRepository documentRepository })
      : assert(documentRepository != null),
      _documentRepository = documentRepository,
      super(DocumentListLoading());

  Stream<DocumentListState> _mapLoadDocumentListToState({ String orderBy, bool descending }) async* {
    _documentsListSubscription?.cancel();
    _documentsListSubscription = _documentRepository.listen((list) => add(DocumentListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<DocumentListState> _mapLoadDocumentListWithDetailsToState({ String orderBy, bool descending }) async* {
    _documentsListSubscription?.cancel();
    _documentsListSubscription = _documentRepository.listenWithDetails((list) => add(DocumentListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<DocumentListState> _mapAddDocumentListToState(AddDocumentList event) async* {
    _documentRepository.add(event.value);
  }

  Stream<DocumentListState> _mapUpdateDocumentListToState(UpdateDocumentList event) async* {
    _documentRepository.update(event.value);
  }

  Stream<DocumentListState> _mapDeleteDocumentListToState(DeleteDocumentList event) async* {
    _documentRepository.delete(event.value);
  }

  Stream<DocumentListState> _mapDocumentListUpdatedToState(DocumentListUpdated event) async* {
    yield DocumentListLoaded(values: event.value);
  }


  @override
  Stream<DocumentListState> mapEventToState(DocumentListEvent event) async* {
    final currentState = state;
    if (event is LoadDocumentList) {
      yield* _mapLoadDocumentListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadDocumentListWithDetails) {
      yield* _mapLoadDocumentListWithDetailsToState();
    } else if (event is AddDocumentList) {
      yield* _mapAddDocumentListToState(event);
    } else if (event is UpdateDocumentList) {
      yield* _mapUpdateDocumentListToState(event);
    } else if (event is DeleteDocumentList) {
      yield* _mapDeleteDocumentListToState(event);
    } else if (event is DocumentListUpdated) {
      yield* _mapDocumentListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _documentsListSubscription?.cancel();
    return super.close();
  }

}


