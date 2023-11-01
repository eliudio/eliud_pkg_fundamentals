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

import 'package:eliud_pkg_fundamentals/model/document_repository.dart';
import 'package:eliud_pkg_fundamentals/model/document_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'document_model.dart';

typedef List<DocumentModel?> FilterDocumentModels(List<DocumentModel?> values);



class DocumentListBloc extends Bloc<DocumentListEvent, DocumentListState> {
  final FilterDocumentModels? filter;
  final DocumentRepository _documentRepository;
  StreamSubscription? _documentsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int documentLimit;

  DocumentListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DocumentRepository documentRepository, this.documentLimit = 5})
      : _documentRepository = documentRepository,
        super(DocumentListLoading()) {
    on <LoadDocumentList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDocumentListToState();
      } else {
        _mapLoadDocumentListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadDocumentListWithDetailsToState();
    });
    
    on <DocumentChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDocumentListToState();
      } else {
        _mapLoadDocumentListWithDetailsToState();
      }
    });
      
    on <AddDocumentList> ((event, emit) async {
      await _mapAddDocumentListToState(event);
    });
    
    on <UpdateDocumentList> ((event, emit) async {
      await _mapUpdateDocumentListToState(event);
    });
    
    on <DeleteDocumentList> ((event, emit) async {
      await _mapDeleteDocumentListToState(event);
    });
    
    on <DocumentListUpdated> ((event, emit) {
      emit(_mapDocumentListUpdatedToState(event));
    });
  }

  List<DocumentModel?> _filter(List<DocumentModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadDocumentListToState() async {
    int amountNow =  (state is DocumentListLoaded) ? (state as DocumentListLoaded).values!.length : 0;
    _documentsListSubscription?.cancel();
    _documentsListSubscription = _documentRepository.listen(
          (list) => add(DocumentListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * documentLimit : null
    );
  }

  Future<void> _mapLoadDocumentListWithDetailsToState() async {
    int amountNow =  (state is DocumentListLoaded) ? (state as DocumentListLoaded).values!.length : 0;
    _documentsListSubscription?.cancel();
    _documentsListSubscription = _documentRepository.listenWithDetails(
            (list) => add(DocumentListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * documentLimit : null
    );
  }

  Future<void> _mapAddDocumentListToState(AddDocumentList event) async {
    var value = event.value;
    if (value != null) {
      await _documentRepository.add(value);
    }
  }

  Future<void> _mapUpdateDocumentListToState(UpdateDocumentList event) async {
    var value = event.value;
    if (value != null) {
      await _documentRepository.update(value);
    }
  }

  Future<void> _mapDeleteDocumentListToState(DeleteDocumentList event) async {
    var value = event.value;
    if (value != null) {
      await _documentRepository.delete(value);
    }
  }

  DocumentListLoaded _mapDocumentListUpdatedToState(
      DocumentListUpdated event) => DocumentListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _documentsListSubscription?.cancel();
    return super.close();
  }
}


