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

import 'document_item_repository.dart';
import 'document_item_list_event.dart';
import 'document_item_list_state.dart';


class DocumentItemListBloc extends Bloc<DocumentItemListEvent, DocumentItemListState> {
  final DocumentItemRepository _documentItemRepository;
  StreamSubscription _documentItemsListSubscription;

  DocumentItemListBloc({ @required DocumentItemRepository documentItemRepository })
      : assert(documentItemRepository != null),
      _documentItemRepository = documentItemRepository,
      super(DocumentItemListLoading());

  Stream<DocumentItemListState> _mapLoadDocumentItemListToState() async* {
    _documentItemsListSubscription?.cancel();
    _documentItemsListSubscription = _documentItemRepository.listen((list) => add(DocumentItemListUpdated(value: list)));
  }

  Stream<DocumentItemListState> _mapLoadDocumentItemListWithDetailsToState() async* {
    _documentItemsListSubscription?.cancel();
    _documentItemsListSubscription = _documentItemRepository.listenWithDetails((list) => add(DocumentItemListUpdated(value: list)));
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
      yield* _mapLoadDocumentItemListToState();
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


