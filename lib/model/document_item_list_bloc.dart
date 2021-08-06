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
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int documentItemLimit;

  DocumentItemListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required DocumentItemRepository documentItemRepository, this.documentItemLimit = 5})
      : assert(documentItemRepository != null),
        _documentItemRepository = documentItemRepository,
        super(DocumentItemListLoading());

  Stream<DocumentItemListState> _mapLoadDocumentItemListToState() async* {
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

  Stream<DocumentItemListState> _mapLoadDocumentItemListWithDetailsToState() async* {
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

  Stream<DocumentItemListState> _mapAddDocumentItemListToState(AddDocumentItemList event) async* {
    var value = event.value;
    if (value != null) 
      _documentItemRepository.add(value);
  }

  Stream<DocumentItemListState> _mapUpdateDocumentItemListToState(UpdateDocumentItemList event) async* {
    var value = event.value;
    if (value != null) 
      _documentItemRepository.update(value);
  }

  Stream<DocumentItemListState> _mapDeleteDocumentItemListToState(DeleteDocumentItemList event) async* {
    var value = event.value;
    if (value != null) 
      _documentItemRepository.delete(value);
  }

  Stream<DocumentItemListState> _mapDocumentItemListUpdatedToState(
      DocumentItemListUpdated event) async* {
    yield DocumentItemListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<DocumentItemListState> mapEventToState(DocumentItemListEvent event) async* {
    if (event is LoadDocumentItemList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadDocumentItemListToState();
      } else {
        yield* _mapLoadDocumentItemListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadDocumentItemListWithDetailsToState();
    } else if (event is AddDocumentItemList) {
      yield* _mapAddDocumentItemListToState(event);
    } else if (event is UpdateDocumentItemList) {
      yield* _mapUpdateDocumentItemListToState(event);
    } else if (event is DeleteDocumentItemList) {
      yield* _mapDeleteDocumentItemListToState(event);
    } else if (event is DocumentItemListUpdated) {
      yield* _mapDocumentItemListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _documentItemsListSubscription?.cancel();
    return super.close();
  }
}


