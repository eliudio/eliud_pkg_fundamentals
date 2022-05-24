/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/document_item_repository.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class DocumentItemListBloc extends Bloc<DocumentItemListEvent, DocumentItemListState> {
  final DocumentItemRepository _documentItemRepository;
  StreamSubscription? _documentItemsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int documentItemLimit;

  DocumentItemListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DocumentItemRepository documentItemRepository, this.documentItemLimit = 5})
      : assert(documentItemRepository != null),
        _documentItemRepository = documentItemRepository,
        super(DocumentItemListLoading()) {
    on <LoadDocumentItemList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDocumentItemListToState();
      } else {
        _mapLoadDocumentItemListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadDocumentItemListWithDetailsToState();
    });
    
    on <DocumentItemChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDocumentItemListToState();
      } else {
        _mapLoadDocumentItemListWithDetailsToState();
      }
    });
      
    on <AddDocumentItemList> ((event, emit) async {
      await _mapAddDocumentItemListToState(event);
    });
    
    on <UpdateDocumentItemList> ((event, emit) async {
      await _mapUpdateDocumentItemListToState(event);
    });
    
    on <DeleteDocumentItemList> ((event, emit) async {
      await _mapDeleteDocumentItemListToState(event);
    });
    
    on <DocumentItemListUpdated> ((event, emit) {
      emit(_mapDocumentItemListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadDocumentItemListToState() async {
    int amountNow =  (state is DocumentItemListLoaded) ? (state as DocumentItemListLoaded).values!.length : 0;
    _documentItemsListSubscription?.cancel();
    _documentItemsListSubscription = _documentItemRepository.listen(
          (list) => add(DocumentItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * documentItemLimit : null
    );
  }

  Future<void> _mapLoadDocumentItemListWithDetailsToState() async {
    int amountNow =  (state is DocumentItemListLoaded) ? (state as DocumentItemListLoaded).values!.length : 0;
    _documentItemsListSubscription?.cancel();
    _documentItemsListSubscription = _documentItemRepository.listenWithDetails(
            (list) => add(DocumentItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * documentItemLimit : null
    );
  }

  Future<void> _mapAddDocumentItemListToState(AddDocumentItemList event) async {
    var value = event.value;
    if (value != null) {
      await _documentItemRepository.add(value);
    }
  }

  Future<void> _mapUpdateDocumentItemListToState(UpdateDocumentItemList event) async {
    var value = event.value;
    if (value != null) {
      await _documentItemRepository.update(value);
    }
  }

  Future<void> _mapDeleteDocumentItemListToState(DeleteDocumentItemList event) async {
    var value = event.value;
    if (value != null) {
      await _documentItemRepository.delete(value);
    }
  }

  DocumentItemListLoaded _mapDocumentItemListUpdatedToState(
      DocumentItemListUpdated event) => DocumentItemListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _documentItemsListSubscription?.cancel();
    return super.close();
  }
}


