/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/dynamic_widget_repository.dart';


import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class DynamicWidgetFirestore implements DynamicWidgetRepository {
  @override
  DynamicWidgetEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return DynamicWidgetEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  Future<DynamicWidgetEntity> addEntity(String documentID, DynamicWidgetEntity value) {
    return DynamicWidgetCollection.doc(documentID).set(value.toDocument()).then((_) => value);
  }

  Future<DynamicWidgetEntity> updateEntity(String documentID, DynamicWidgetEntity value) {
    return DynamicWidgetCollection.doc(documentID).update(value.toDocument()).then((_) => value);
  }

  Future<DynamicWidgetModel> add(DynamicWidgetModel value) {
    return DynamicWidgetCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(DynamicWidgetModel value) {
    return DynamicWidgetCollection.doc(value.documentID).delete();
  }

  Future<DynamicWidgetModel> update(DynamicWidgetModel value) {
    return DynamicWidgetCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<DynamicWidgetModel?> _populateDoc(DocumentSnapshot value) async {
    return DynamicWidgetModel.fromEntity(value.id, DynamicWidgetEntity.fromMap(value.data()));
  }

  Future<DynamicWidgetModel?> _populateDocPlus(DocumentSnapshot value) async {
    return DynamicWidgetModel.fromEntityPlus(value.id, DynamicWidgetEntity.fromMap(value.data()), appId: appId);  }

  Future<DynamicWidgetEntity?> getEntity(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = DynamicWidgetCollection.doc(id);
      var doc = await collection.get();
      return DynamicWidgetEntity.fromMap(doc.data());
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving DynamicWidget with id $id");
        print("Exceptoin: $e");
      }
    };
  }

  Future<DynamicWidgetModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = DynamicWidgetCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving DynamicWidget with id $id");
        print("Exceptoin: $e");
      }
    };
  }

  StreamSubscription<List<DynamicWidgetModel?>> listen(DynamicWidgetModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<DynamicWidgetModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(DynamicWidgetCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDoc(doc)).toList());
    });

    return stream.listen((listOfDynamicWidgetModels) {
      trigger(listOfDynamicWidgetModels);
    });
  }

  StreamSubscription<List<DynamicWidgetModel?>> listenWithDetails(DynamicWidgetModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<DynamicWidgetModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(DynamicWidgetCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfDynamicWidgetModels) {
      trigger(listOfDynamicWidgetModels);
    });
  }

  @override
  StreamSubscription<DynamicWidgetModel?> listenTo(String documentId, DynamicWidgetChanged changed) {
    var stream = DynamicWidgetCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<DynamicWidgetModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<DynamicWidgetModel?>> _values = getQuery(DynamicWidgetCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<DynamicWidgetModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<DynamicWidgetModel?>> _values = getQuery(DynamicWidgetCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<DynamicWidgetModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<DynamicWidgetModel?> _values = await getQuery(DynamicWidgetCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<DynamicWidgetModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<DynamicWidgetModel?> _values = await getQuery(DynamicWidgetCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {}

  Future<void> deleteAll() {
    return DynamicWidgetCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return DynamicWidgetCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<DynamicWidgetModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return DynamicWidgetCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  final String appId;
  DynamicWidgetFirestore(this.getCollection, this.appId): DynamicWidgetCollection = getCollection();

  final CollectionReference DynamicWidgetCollection;
  final GetCollection getCollection;
}

