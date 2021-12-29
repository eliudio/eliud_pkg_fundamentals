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
import 'package:eliud_core/core/blocs/access/access_bloc.dart';

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

documentItemsList(app, context, value, trigger) => EmbeddedComponentFactory.documentItemsList(app, context, value, trigger);
linksList(app, context, value, trigger) => EmbeddedComponentFactory.linksList(app, context, value, trigger);
listedItemsList(app, context, value, trigger) => EmbeddedComponentFactory.listedItemsList(app, context, value, trigger);
sectionsList(app, context, value, trigger) => EmbeddedComponentFactory.sectionsList(app, context, value, trigger);
tutorialEntrysList(app, context, value, trigger) => EmbeddedComponentFactory.tutorialEntrysList(app, context, value, trigger);

class EmbeddedComponentFactory {

static Widget documentItemsList(AppModel app, BuildContext context, List<DocumentItemModel> values, DocumentItemListChanged trigger) {
  DocumentItemInMemoryRepository inMemoryRepository = DocumentItemInMemoryRepository(trigger, values,);
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

static Widget linksList(AppModel app, BuildContext context, List<LinkModel> values, LinkListChanged trigger) {
  LinkInMemoryRepository inMemoryRepository = LinkInMemoryRepository(trigger, values,);
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

static Widget listedItemsList(AppModel app, BuildContext context, List<ListedItemModel> values, ListedItemListChanged trigger) {
  ListedItemInMemoryRepository inMemoryRepository = ListedItemInMemoryRepository(trigger, values,);
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

static Widget sectionsList(AppModel app, BuildContext context, List<SectionModel> values, SectionListChanged trigger) {
  SectionInMemoryRepository inMemoryRepository = SectionInMemoryRepository(trigger, values,);
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

static Widget tutorialEntrysList(AppModel app, BuildContext context, List<TutorialEntryModel> values, TutorialEntryListChanged trigger) {
  TutorialEntryInMemoryRepository inMemoryRepository = TutorialEntryInMemoryRepository(trigger, values,);
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

class DocumentItemInMemoryRepository implements DocumentItemRepository {
    final List<DocumentItemModel> items;
    final DocumentItemListChanged trigger;
    Stream<List<DocumentItemModel>>? theValues;

    DocumentItemInMemoryRepository(this.trigger, this.items) {
        List<List<DocumentItemModel>> myList = <List<DocumentItemModel>>[];
        if (items != null) myList.add(items);
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
        return Future.value(value);
    }

    Future<void> delete(DocumentItemModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) items.removeAt(index);
      trigger(items);
      return Future.value(value);
    }

    Future<DocumentItemModel> update(DocumentItemModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
      return Future.value(value);
    }

    Future<DocumentItemModel> get(String? id, { Function(Exception)? onError }) {
      int index = _index(id!);
      var completer = new Completer<DocumentItemModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<DocumentItemModel>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    Stream<List<DocumentItemModel>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    @override
    StreamSubscription<List<DocumentItemModel>> listen(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<DocumentItemModel>> listenWithDetails(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<DocumentItemModel>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<DocumentItemModel>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<DocumentItemModel> listenTo(String documentId, DocumentItemChanged changed) {
    throw UnimplementedError();
  }

  @override
  Future<DocumentItemModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() async {}
}

class LinkInMemoryRepository implements LinkRepository {
    final List<LinkModel> items;
    final LinkListChanged trigger;
    Stream<List<LinkModel>>? theValues;

    LinkInMemoryRepository(this.trigger, this.items) {
        List<List<LinkModel>> myList = <List<LinkModel>>[];
        if (items != null) myList.add(items);
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
        return Future.value(value);
    }

    Future<void> delete(LinkModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) items.removeAt(index);
      trigger(items);
      return Future.value(value);
    }

    Future<LinkModel> update(LinkModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
      return Future.value(value);
    }

    Future<LinkModel> get(String? id, { Function(Exception)? onError }) {
      int index = _index(id!);
      var completer = new Completer<LinkModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<LinkModel>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    Stream<List<LinkModel>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    @override
    StreamSubscription<List<LinkModel>> listen(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<LinkModel>> listenWithDetails(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<LinkModel>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<LinkModel>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<LinkModel> listenTo(String documentId, LinkChanged changed) {
    throw UnimplementedError();
  }

  @override
  Future<LinkModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() async {}
}

class ListedItemInMemoryRepository implements ListedItemRepository {
    final List<ListedItemModel> items;
    final ListedItemListChanged trigger;
    Stream<List<ListedItemModel>>? theValues;

    ListedItemInMemoryRepository(this.trigger, this.items) {
        List<List<ListedItemModel>> myList = <List<ListedItemModel>>[];
        if (items != null) myList.add(items);
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
        return Future.value(value);
    }

    Future<void> delete(ListedItemModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) items.removeAt(index);
      trigger(items);
      return Future.value(value);
    }

    Future<ListedItemModel> update(ListedItemModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
      return Future.value(value);
    }

    Future<ListedItemModel> get(String? id, { Function(Exception)? onError }) {
      int index = _index(id!);
      var completer = new Completer<ListedItemModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<ListedItemModel>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    Stream<List<ListedItemModel>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    @override
    StreamSubscription<List<ListedItemModel>> listen(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<ListedItemModel>> listenWithDetails(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<ListedItemModel>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<ListedItemModel>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<ListedItemModel> listenTo(String documentId, ListedItemChanged changed) {
    throw UnimplementedError();
  }

  @override
  Future<ListedItemModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() async {}
}

class SectionInMemoryRepository implements SectionRepository {
    final List<SectionModel> items;
    final SectionListChanged trigger;
    Stream<List<SectionModel>>? theValues;

    SectionInMemoryRepository(this.trigger, this.items) {
        List<List<SectionModel>> myList = <List<SectionModel>>[];
        if (items != null) myList.add(items);
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
        return Future.value(value);
    }

    Future<void> delete(SectionModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) items.removeAt(index);
      trigger(items);
      return Future.value(value);
    }

    Future<SectionModel> update(SectionModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
      return Future.value(value);
    }

    Future<SectionModel> get(String? id, { Function(Exception)? onError }) {
      int index = _index(id!);
      var completer = new Completer<SectionModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<SectionModel>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    Stream<List<SectionModel>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    @override
    StreamSubscription<List<SectionModel>> listen(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<SectionModel>> listenWithDetails(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<SectionModel>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<SectionModel>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<SectionModel> listenTo(String documentId, SectionChanged changed) {
    throw UnimplementedError();
  }

  @override
  Future<SectionModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() async {}
}

class TutorialEntryInMemoryRepository implements TutorialEntryRepository {
    final List<TutorialEntryModel> items;
    final TutorialEntryListChanged trigger;
    Stream<List<TutorialEntryModel>>? theValues;

    TutorialEntryInMemoryRepository(this.trigger, this.items) {
        List<List<TutorialEntryModel>> myList = <List<TutorialEntryModel>>[];
        if (items != null) myList.add(items);
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
        return Future.value(value);
    }

    Future<void> delete(TutorialEntryModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) items.removeAt(index);
      trigger(items);
      return Future.value(value);
    }

    Future<TutorialEntryModel> update(TutorialEntryModel value) {
      int index = _index(value.documentID!);
      if (index >= 0) {
        items.replaceRange(index, index+1, [value]);
        trigger(items);
      }
      return Future.value(value);
    }

    Future<TutorialEntryModel> get(String? id, { Function(Exception)? onError }) {
      int index = _index(id!);
      var completer = new Completer<TutorialEntryModel>();
      completer.complete(items[index]);
      return completer.future;
    }

    Stream<List<TutorialEntryModel>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    Stream<List<TutorialEntryModel>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!;
    }
    
    @override
    StreamSubscription<List<TutorialEntryModel>> listen(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
  
    @override
    StreamSubscription<List<TutorialEntryModel>> listenWithDetails(trigger, { String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return theValues!.listen((theList) => trigger(theList));
    }
    
    void flush() {}

    Future<List<TutorialEntryModel>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }
    
    Future<List<TutorialEntryModel>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
      return Future.value(items);
    }

    @override
    getSubCollection(String documentId, String name) {
      throw UnimplementedError();
    }

  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }
  
  @override
  StreamSubscription<TutorialEntryModel> listenTo(String documentId, TutorialEntryChanged changed) {
    throw UnimplementedError();
  }

  @override
  Future<TutorialEntryModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }
  

    Future<void> deleteAll() async {}
}

