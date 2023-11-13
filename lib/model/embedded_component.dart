/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/embedded_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/model/app_model.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/document_item_list_bloc.dart';
import '../model/document_item_list.dart';
import '../model/document_item_list_event.dart';
import '../model/document_item_model.dart';
import '../model/document_item_entity.dart';
import '../model/document_item_repository.dart';

import '../model/link_list_bloc.dart';
import '../model/link_list.dart';
import '../model/link_list_event.dart';
import '../model/link_model.dart';
import '../model/link_entity.dart';
import '../model/link_repository.dart';

import '../model/listed_item_list_bloc.dart';
import '../model/listed_item_list.dart';
import '../model/listed_item_list_event.dart';
import '../model/listed_item_model.dart';
import '../model/listed_item_entity.dart';
import '../model/listed_item_repository.dart';

import '../model/section_list_bloc.dart';
import '../model/section_list.dart';
import '../model/section_list_event.dart';
import '../model/section_model.dart';
import '../model/section_entity.dart';
import '../model/section_repository.dart';

import '../model/tutorial_entry_list_bloc.dart';
import '../model/tutorial_entry_list.dart';
import '../model/tutorial_entry_list_event.dart';
import '../model/tutorial_entry_model.dart';
import '../model/tutorial_entry_entity.dart';
import '../model/tutorial_entry_repository.dart';

typedef DocumentItemListChanged = Function(List<DocumentItemModel> values);
typedef LinkListChanged = Function(List<LinkModel> values);
typedef ListedItemListChanged = Function(List<ListedItemModel> values);
typedef SectionListChanged = Function(List<SectionModel> values);
typedef TutorialEntryListChanged = Function(List<TutorialEntryModel> values);

documentItemsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.documentItemsList(app, context, value, trigger);
linksList(app, context, value, trigger) =>
    EmbeddedComponentFactory.linksList(app, context, value, trigger);
listedItemsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.listedItemsList(app, context, value, trigger);
sectionsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.sectionsList(app, context, value, trigger);
tutorialEntrysList(app, context, value, trigger) =>
    EmbeddedComponentFactory.tutorialEntrysList(app, context, value, trigger);

class EmbeddedComponentFactory {
/* 
 * documentItemsList function to construct a list of DocumentItemModel
 */
  static Widget documentItemsList(AppModel app, BuildContext context,
      List<DocumentItemModel> values, DocumentItemListChanged trigger) {
    DocumentItemInMemoryRepository inMemoryRepository =
        DocumentItemInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentItemListBloc>(
          create: (context) => DocumentItemListBloc(
            documentItemRepository: inMemoryRepository,
          )..add(LoadDocumentItemList()),
        )
      ],
      child: DocumentItemListWidget(app: app, isEmbedded: true),
    );
  }

/* 
 * linksList function to construct a list of LinkModel
 */
  static Widget linksList(AppModel app, BuildContext context,
      List<LinkModel> values, LinkListChanged trigger) {
    LinkInMemoryRepository inMemoryRepository = LinkInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<LinkListBloc>(
          create: (context) => LinkListBloc(
            linkRepository: inMemoryRepository,
          )..add(LoadLinkList()),
        )
      ],
      child: LinkListWidget(app: app, isEmbedded: true),
    );
  }

/* 
 * listedItemsList function to construct a list of ListedItemModel
 */
  static Widget listedItemsList(AppModel app, BuildContext context,
      List<ListedItemModel> values, ListedItemListChanged trigger) {
    ListedItemInMemoryRepository inMemoryRepository =
        ListedItemInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListedItemListBloc>(
          create: (context) => ListedItemListBloc(
            listedItemRepository: inMemoryRepository,
          )..add(LoadListedItemList()),
        )
      ],
      child: ListedItemListWidget(app: app, isEmbedded: true),
    );
  }

/* 
 * sectionsList function to construct a list of SectionModel
 */
  static Widget sectionsList(AppModel app, BuildContext context,
      List<SectionModel> values, SectionListChanged trigger) {
    SectionInMemoryRepository inMemoryRepository = SectionInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<SectionListBloc>(
          create: (context) => SectionListBloc(
            sectionRepository: inMemoryRepository,
          )..add(LoadSectionList()),
        )
      ],
      child: SectionListWidget(app: app, isEmbedded: true),
    );
  }

/* 
 * tutorialEntrysList function to construct a list of TutorialEntryModel
 */
  static Widget tutorialEntrysList(AppModel app, BuildContext context,
      List<TutorialEntryModel> values, TutorialEntryListChanged trigger) {
    TutorialEntryInMemoryRepository inMemoryRepository =
        TutorialEntryInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<TutorialEntryListBloc>(
          create: (context) => TutorialEntryListBloc(
            tutorialEntryRepository: inMemoryRepository,
          )..add(LoadTutorialEntryList()),
        )
      ],
      child: TutorialEntryListWidget(app: app, isEmbedded: true),
    );
  }
}

/* 
 * DocumentItemInMemoryRepository is an in memory implementation of DocumentItemRepository
 */
class DocumentItemInMemoryRepository implements DocumentItemRepository {
  final List<DocumentItemModel> items;
  final DocumentItemListChanged trigger;
  Stream<List<DocumentItemModel>>? theValues;

  /* 
     * Construct the DocumentItemInMemoryRepository
     */
  DocumentItemInMemoryRepository(this.trigger, this.items) {
    List<List<DocumentItemModel>> myList = <List<DocumentItemModel>>[];
    myList.add(items);
    theValues = Stream<List<DocumentItemModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<DocumentItemEntity> addEntity(
      String documentID, DocumentItemEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<DocumentItemEntity> updateEntity(
      String documentID, DocumentItemEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<DocumentItemModel> add(DocumentItemModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(DocumentItemModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<DocumentItemModel> update(DocumentItemModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<DocumentItemModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<DocumentItemModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of DocumentItemModel base on a query
     */
  @override
  Stream<List<DocumentItemModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of DocumentItemModel, including linked models base on a query
     */
  @override
  Stream<List<DocumentItemModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of DocumentItemModel base on a query
     */
  @override
  StreamSubscription<List<DocumentItemModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of DocumentItemModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<DocumentItemModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<DocumentItemModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<DocumentItemModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<DocumentItemModel> listenTo(
      String documentId, DocumentItemChanged changed,
      {DocumentItemErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<DocumentItemModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<DocumentItemEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  DocumentItemEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

/* 
 * LinkInMemoryRepository is an in memory implementation of LinkRepository
 */
class LinkInMemoryRepository implements LinkRepository {
  final List<LinkModel> items;
  final LinkListChanged trigger;
  Stream<List<LinkModel>>? theValues;

  /* 
     * Construct the LinkInMemoryRepository
     */
  LinkInMemoryRepository(this.trigger, this.items) {
    List<List<LinkModel>> myList = <List<LinkModel>>[];
    myList.add(items);
    theValues = Stream<List<LinkModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<LinkEntity> addEntity(String documentID, LinkEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<LinkEntity> updateEntity(String documentID, LinkEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<LinkModel> add(LinkModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(LinkModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<LinkModel> update(LinkModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<LinkModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<LinkModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of LinkModel base on a query
     */
  @override
  Stream<List<LinkModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of LinkModel, including linked models base on a query
     */
  @override
  Stream<List<LinkModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of LinkModel base on a query
     */
  @override
  StreamSubscription<List<LinkModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of LinkModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<LinkModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<LinkModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<LinkModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<LinkModel> listenTo(String documentId, LinkChanged changed,
      {LinkErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<LinkModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<LinkEntity?> getEntity(String? id, {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  LinkEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

/* 
 * ListedItemInMemoryRepository is an in memory implementation of ListedItemRepository
 */
class ListedItemInMemoryRepository implements ListedItemRepository {
  final List<ListedItemModel> items;
  final ListedItemListChanged trigger;
  Stream<List<ListedItemModel>>? theValues;

  /* 
     * Construct the ListedItemInMemoryRepository
     */
  ListedItemInMemoryRepository(this.trigger, this.items) {
    List<List<ListedItemModel>> myList = <List<ListedItemModel>>[];
    myList.add(items);
    theValues = Stream<List<ListedItemModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<ListedItemEntity> addEntity(
      String documentID, ListedItemEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<ListedItemEntity> updateEntity(
      String documentID, ListedItemEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<ListedItemModel> add(ListedItemModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(ListedItemModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<ListedItemModel> update(ListedItemModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<ListedItemModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<ListedItemModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of ListedItemModel base on a query
     */
  @override
  Stream<List<ListedItemModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of ListedItemModel, including linked models base on a query
     */
  @override
  Stream<List<ListedItemModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of ListedItemModel base on a query
     */
  @override
  StreamSubscription<List<ListedItemModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of ListedItemModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<ListedItemModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<ListedItemModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<ListedItemModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<ListedItemModel> listenTo(
      String documentId, ListedItemChanged changed,
      {ListedItemErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<ListedItemModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<ListedItemEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  ListedItemEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

/* 
 * SectionInMemoryRepository is an in memory implementation of SectionRepository
 */
class SectionInMemoryRepository implements SectionRepository {
  final List<SectionModel> items;
  final SectionListChanged trigger;
  Stream<List<SectionModel>>? theValues;

  /* 
     * Construct the SectionInMemoryRepository
     */
  SectionInMemoryRepository(this.trigger, this.items) {
    List<List<SectionModel>> myList = <List<SectionModel>>[];
    myList.add(items);
    theValues = Stream<List<SectionModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<SectionEntity> addEntity(String documentID, SectionEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<SectionEntity> updateEntity(String documentID, SectionEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<SectionModel> add(SectionModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(SectionModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<SectionModel> update(SectionModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<SectionModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<SectionModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of SectionModel base on a query
     */
  @override
  Stream<List<SectionModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of SectionModel, including linked models base on a query
     */
  @override
  Stream<List<SectionModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of SectionModel base on a query
     */
  @override
  StreamSubscription<List<SectionModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of SectionModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<SectionModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<SectionModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<SectionModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<SectionModel> listenTo(
      String documentId, SectionChanged changed,
      {SectionErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<SectionModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<SectionEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  SectionEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

/* 
 * TutorialEntryInMemoryRepository is an in memory implementation of TutorialEntryRepository
 */
class TutorialEntryInMemoryRepository implements TutorialEntryRepository {
  final List<TutorialEntryModel> items;
  final TutorialEntryListChanged trigger;
  Stream<List<TutorialEntryModel>>? theValues;

  /* 
     * Construct the TutorialEntryInMemoryRepository
     */
  TutorialEntryInMemoryRepository(this.trigger, this.items) {
    List<List<TutorialEntryModel>> myList = <List<TutorialEntryModel>>[];
    myList.add(items);
    theValues = Stream<List<TutorialEntryModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<TutorialEntryEntity> addEntity(
      String documentID, TutorialEntryEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<TutorialEntryEntity> updateEntity(
      String documentID, TutorialEntryEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<TutorialEntryModel> add(TutorialEntryModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(TutorialEntryModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<TutorialEntryModel> update(TutorialEntryModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<TutorialEntryModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<TutorialEntryModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of TutorialEntryModel base on a query
     */
  @override
  Stream<List<TutorialEntryModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of TutorialEntryModel, including linked models base on a query
     */
  @override
  Stream<List<TutorialEntryModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of TutorialEntryModel base on a query
     */
  @override
  StreamSubscription<List<TutorialEntryModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of TutorialEntryModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<TutorialEntryModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<TutorialEntryModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<TutorialEntryModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<TutorialEntryModel> listenTo(
      String documentId, TutorialEntryChanged changed,
      {TutorialEntryErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<TutorialEntryModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<TutorialEntryEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  TutorialEntryEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}
