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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';

import '../model/document_item_list_bloc.dart';
import '../model/document_item_list.dart';
import '../model/document_item_list_event.dart';
import '../model/document_item_model.dart';
import '../model/document_item_repository.dart';

import '../model/link_list_bloc.dart';
import '../model/link_list.dart';
import '../model/link_list_event.dart';
import '../model/link_model.dart';
import '../model/link_repository.dart';

import '../model/listed_item_list_bloc.dart';
import '../model/listed_item_list.dart';
import '../model/listed_item_list_event.dart';
import '../model/listed_item_model.dart';
import '../model/listed_item_repository.dart';

import '../model/section_list_bloc.dart';
import '../model/section_list.dart';
import '../model/section_list_event.dart';
import '../model/section_model.dart';
import '../model/section_repository.dart';

import '../model/tutorial_entry_list_bloc.dart';
import '../model/tutorial_entry_list.dart';
import '../model/tutorial_entry_list_event.dart';
import '../model/tutorial_entry_model.dart';
import '../model/tutorial_entry_repository.dart';

typedef DocumentItemListChanged(List<DocumentItemModel> values);
typedef LinkListChanged(List<LinkModel> values);
typedef ListedItemListChanged(List<ListedItemModel> values);
typedef SectionListChanged(List<SectionModel> values);
typedef TutorialEntryListChanged(List<TutorialEntryModel> values);

documentItemsList(context, value, trigger) => EmbeddedComponentFactory.documentItemsList(context, value, trigger);
linksList(context, value, trigger) => EmbeddedComponentFactory.linksList(context, value, trigger);
listedItemsList(context, value, trigger) => EmbeddedComponentFactory.listedItemsList(context, value, trigger);
sectionsList(context, value, trigger) => EmbeddedComponentFactory.sectionsList(context, value, trigger);
tutorialEntrysList(context, value, trigger) => EmbeddedComponentFactory.tutorialEntrysList(context, value, trigger);

class EmbeddedComponentFactory {

static Widget documentItemsList(BuildContext context, List<DocumentItemModel> values, DocumentItemListChanged trigger) {
  DocumentItemInMemoryRepository inMemoryRepository = DocumentItemInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<DocumentItemListBloc>(
        create: (context) => DocumentItemListBloc(
          AccessBloc.getBloc(context), 
          documentItemRepository: inMemoryRepository,
          )..add(LoadDocumentItemList()),
        )
        ],
    child: DocumentItemListWidget(isEmbedded: true),
  );
}

static Widget linksList(BuildContext context, List<LinkModel> values, LinkListChanged trigger) {
  LinkInMemoryRepository inMemoryRepository = LinkInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<LinkListBloc>(
        create: (context) => LinkListBloc(
          AccessBloc.getBloc(context), 
          linkRepository: inMemoryRepository,
          )..add(LoadLinkList()),
        )
        ],
    child: LinkListWidget(isEmbedded: true),
  );
}

static Widget listedItemsList(BuildContext context, List<ListedItemModel> values, ListedItemListChanged trigger) {
  ListedItemInMemoryRepository inMemoryRepository = ListedItemInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<ListedItemListBloc>(
        create: (context) => ListedItemListBloc(
          AccessBloc.getBloc(context), 
          listedItemRepository: inMemoryRepository,
          )..add(LoadListedItemList()),
        )
        ],
    child: ListedItemListWidget(isEmbedded: true),
  );
}

static Widget sectionsList(BuildContext context, List<SectionModel> values, SectionListChanged trigger) {
  SectionInMemoryRepository inMemoryRepository = SectionInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<SectionListBloc>(
        create: (context) => SectionListBloc(
          AccessBloc.getBloc(context), 
          sectionRepository: inMemoryRepository,
          )..add(LoadSectionList()),
        )
        ],
    child: SectionListWidget(isEmbedded: true),
  );
}

static Widget tutorialEntrysList(BuildContext context, List<TutorialEntryModel> values, TutorialEntryListChanged trigger) {
  TutorialEntryInMemoryRepository inMemoryRepository = TutorialEntryInMemoryRepository(
    trigger: trigger,
    items: values,
  );
  return MultiBlocProvider(
    providers: [
      BlocProvider<TutorialEntryListBloc>(
        create: (context) => TutorialEntryListBloc(
          AccessBloc.getBloc(context), 
          tutorialEntryRepository: inMemoryRepository,
          )..add(LoadTutorialEntryList()),
        )
        ],
    child: TutorialEntryListWidget(isEmbedded: true),
  );
}


}

class DocumentItemInMemoryRepository implements DocumentItemRepository {
    final List<DocumentItemModel> items;
    final DocumentItemListChanged trigger;
    Stream<List<DocumentItemModel>> theValues;

    DocumentItemInMemoryRepository({this.trigger, this.items}) {
        List<List<DocumentItemModel>> myList = new List<List<DocumentItemModel>>();
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

    Future<DocumentItemModel> add(DocumentItemModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(DocumentItemModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<DocumentItemModel> update(DocumentItemModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<DocumentItemModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<DocumentItemModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<DocumentItemModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return theValues;
    }
    
    Stream<List<DocumentItemModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<DocumentItemModel>> listen(trigger, { String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<DocumentItemModel>> listenWithDetails(trigger, { String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<DocumentItemModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return Future.value(items);
    }
    
    Future<List<DocumentItemModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return Future.value(items);
    }

    Future<void> deleteAll() {}
}

class LinkInMemoryRepository implements LinkRepository {
    final List<LinkModel> items;
    final LinkListChanged trigger;
    Stream<List<LinkModel>> theValues;

    LinkInMemoryRepository({this.trigger, this.items}) {
        List<List<LinkModel>> myList = new List<List<LinkModel>>();
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

    Future<LinkModel> add(LinkModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(LinkModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<LinkModel> update(LinkModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<LinkModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<LinkModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<LinkModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return theValues;
    }
    
    Stream<List<LinkModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<LinkModel>> listen(trigger, { String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<LinkModel>> listenWithDetails(trigger, { String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<LinkModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return Future.value(items);
    }
    
    Future<List<LinkModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return Future.value(items);
    }

    Future<void> deleteAll() {}
}

class ListedItemInMemoryRepository implements ListedItemRepository {
    final List<ListedItemModel> items;
    final ListedItemListChanged trigger;
    Stream<List<ListedItemModel>> theValues;

    ListedItemInMemoryRepository({this.trigger, this.items}) {
        List<List<ListedItemModel>> myList = new List<List<ListedItemModel>>();
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

    Future<ListedItemModel> add(ListedItemModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(ListedItemModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<ListedItemModel> update(ListedItemModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<ListedItemModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<ListedItemModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<ListedItemModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return theValues;
    }
    
    Stream<List<ListedItemModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<ListedItemModel>> listen(trigger, { String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<ListedItemModel>> listenWithDetails(trigger, { String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<ListedItemModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return Future.value(items);
    }
    
    Future<List<ListedItemModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return Future.value(items);
    }

    Future<void> deleteAll() {}
}

class SectionInMemoryRepository implements SectionRepository {
    final List<SectionModel> items;
    final SectionListChanged trigger;
    Stream<List<SectionModel>> theValues;

    SectionInMemoryRepository({this.trigger, this.items}) {
        List<List<SectionModel>> myList = new List<List<SectionModel>>();
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

    Future<SectionModel> add(SectionModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(SectionModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<SectionModel> update(SectionModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<SectionModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<SectionModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<SectionModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return theValues;
    }
    
    Stream<List<SectionModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<SectionModel>> listen(trigger, { String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<SectionModel>> listenWithDetails(trigger, { String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<SectionModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return Future.value(items);
    }
    
    Future<List<SectionModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return Future.value(items);
    }

    Future<void> deleteAll() {}
}

class TutorialEntryInMemoryRepository implements TutorialEntryRepository {
    final List<TutorialEntryModel> items;
    final TutorialEntryListChanged trigger;
    Stream<List<TutorialEntryModel>> theValues;

    TutorialEntryInMemoryRepository({this.trigger, this.items}) {
        List<List<TutorialEntryModel>> myList = new List<List<TutorialEntryModel>>();
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

    Future<TutorialEntryModel> add(TutorialEntryModel value) {
        items.add(value.copyWith(documentID: newRandomKey()));
        trigger(items);
    }

    Future<void> delete(TutorialEntryModel value) {
      int index = _index(value.documentID);
      if (index >= 0) items.removeAt(index);
      trigger(items);
    }

    Future<TutorialEntryModel> update(TutorialEntryModel value) {
      int index = _index(value.documentID);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
    }

    Future<TutorialEntryModel> get(String id) {
      int index = _index(id);
      var completer = new Completer<TutorialEntryModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<TutorialEntryModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return theValues;
    }
    
    Stream<List<TutorialEntryModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return theValues;
    }
    
    @override
    StreamSubscription<List<TutorialEntryModel>> listen(trigger, { String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<TutorialEntryModel>> listenWithDetails(trigger, { String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel }) {
      return theValues.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<TutorialEntryModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return Future.value(items);
    }
    
    Future<List<TutorialEntryModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
      return Future.value(items);
    }

    Future<void> deleteAll() {}
}

