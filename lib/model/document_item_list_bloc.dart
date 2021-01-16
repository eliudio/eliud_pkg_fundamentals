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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class DocumentItemListBloc extends Bloc<DocumentItemListEvent, DocumentItemListState> {
  final DocumentItemRepository _documentItemRepository;
  StreamSubscription _documentItemsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  DocumentItemListBloc(this.accessBloc,{ this.eliudQuery, @required DocumentItemRepository documentItemRepository })
      : assert(documentItemRepository != null),
      _documentItemRepository = documentItemRepository,
      super(DocumentItemListLoading());

  Stream<DocumentItemListState> _mapLoadDocumentItemListToState({ String orderBy, bool descending }) async* {
    _documentItemsListSubscription?.cancel();
    _documentItemsListSubscription = _documentItemRepository.listen((list) => add(DocumentItemListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<DocumentItemListState> _mapLoadDocumentItemListWithDetailsToState({ String orderBy, bool descending }) async* {
    _documentItemsListSubscription?.cancel();
    _documentItemsListSubscription = _documentItemRepository.listenWithDetails((list) => add(DocumentItemListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<DocumentItemListState> _mapAddDocumentItemListToState(AddDocumentItemList event) async* {
    _documentItemRepository.add(event.value);
  }

  Stream<DocumentItemListState> _mapUpdateDocumentItemListToState(UpdateDocumentItemList event) async* {
    _documentItemRepository.update(event.value);
  }

  Stream<DocumentItemListState> _mapDeleteDocumentItemListToState(DeleteDocumentItemList event) async* {
    _documentItemRepository.delete(event.value);
  }

  Stream<DocumentItemListState> _mapDocumentItemListUpdatedToState(DocumentItemListUpdated event) async* {
    yield DocumentItemListLoaded(values: event.value);
  }


  @override
  Stream<DocumentItemListState> mapEventToState(DocumentItemListEvent event) async* {
    final currentState = state;
    if (event is LoadDocumentItemList) {
      yield* _mapLoadDocumentItemListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadDocumentItemListWithDetails) {
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


