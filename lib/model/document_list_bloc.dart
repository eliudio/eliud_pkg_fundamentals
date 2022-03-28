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
import 'package:eliud_core/tools/query/query_tools.dart';



class DocumentListBloc extends Bloc<DocumentListEvent, DocumentListState> {
  final DocumentRepository _documentRepository;
  StreamSubscription? _documentsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int documentLimit;

  DocumentListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DocumentRepository documentRepository, this.documentLimit = 5})
      : assert(documentRepository != null),
        _documentRepository = documentRepository,
        super(DocumentListLoading());

  Stream<DocumentListState> _mapLoadDocumentListToState() async* {
    int amountNow =  (state is DocumentListLoaded) ? (state as DocumentListLoaded).values!.length : 0;
    _documentsListSubscription?.cancel();
    _documentsListSubscription = _documentRepository.listen(
          (list) => add(DocumentListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * documentLimit : null
    );
  }

  Stream<DocumentListState> _mapLoadDocumentListWithDetailsToState() async* {
    int amountNow =  (state is DocumentListLoaded) ? (state as DocumentListLoaded).values!.length : 0;
    _documentsListSubscription?.cancel();
    _documentsListSubscription = _documentRepository.listenWithDetails(
            (list) => add(DocumentListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * documentLimit : null
    );
  }

  Stream<DocumentListState> _mapAddDocumentListToState(AddDocumentList event) async* {
    var value = event.value;
    if (value != null) 
      _documentRepository.add(value);
  }

  Stream<DocumentListState> _mapUpdateDocumentListToState(UpdateDocumentList event) async* {
    var value = event.value;
    if (value != null) 
      _documentRepository.update(value);
  }

  Stream<DocumentListState> _mapDeleteDocumentListToState(DeleteDocumentList event) async* {
    var value = event.value;
    if (value != null) 
      _documentRepository.delete(value);
  }

  Stream<DocumentListState> _mapDocumentListUpdatedToState(
      DocumentListUpdated event) async* {
    yield DocumentListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<DocumentListState> mapEventToState(DocumentListEvent event) async* {
    if (event is LoadDocumentList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadDocumentListToState();
      } else {
        yield* _mapLoadDocumentListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadDocumentListWithDetailsToState();
    } else if (event is DocumentChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadDocumentListToState();
      } else {
        yield* _mapLoadDocumentListWithDetailsToState();
      }
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


