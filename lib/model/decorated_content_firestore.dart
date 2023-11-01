/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/decorated_content_repository.dart';


import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class DecoratedContentFirestore implements DecoratedContentRepository {
  @override
  DecoratedContentEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return DecoratedContentEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  Future<DecoratedContentEntity> addEntity(String documentID, DecoratedContentEntity value) {
    return DecoratedContentCollection.doc(documentID).set(value.toDocument()).then((_) => value);
  }

  Future<DecoratedContentEntity> updateEntity(String documentID, DecoratedContentEntity value) {
    return DecoratedContentCollection.doc(documentID).update(value.toDocument()).then((_) => value);
  }

  Future<DecoratedContentModel> add(DecoratedContentModel value) {
    return DecoratedContentCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(DecoratedContentModel value) {
    return DecoratedContentCollection.doc(value.documentID).delete();
  }

  Future<DecoratedContentModel> update(DecoratedContentModel value) {
    return DecoratedContentCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<DecoratedContentModel?> _populateDoc(DocumentSnapshot value) async {
    return DecoratedContentModel.fromEntity(value.id, DecoratedContentEntity.fromMap(value.data()));
  }

  Future<DecoratedContentModel?> _populateDocPlus(DocumentSnapshot value) async {
    return DecoratedContentModel.fromEntityPlus(value.id, DecoratedContentEntity.fromMap(value.data()), appId: appId);  }

  Future<DecoratedContentEntity?> getEntity(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = DecoratedContentCollection.doc(id);
      var doc = await collection.get();
      return DecoratedContentEntity.fromMap(doc.data());
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving DecoratedContent with id $id");
        print("Exceptoin: $e");
      }
    };
return null;
  }

  Future<DecoratedContentModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = DecoratedContentCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch(e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving DecoratedContent with id $id");
        print("Exceptoin: $e");
      }
    };
return null;
  }

  StreamSubscription<List<DecoratedContentModel?>> listen(DecoratedContentModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<DecoratedContentModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(DecoratedContentCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDoc(doc)).toList());
    });

    return stream.listen((listOfDecoratedContentModels) {
      trigger(listOfDecoratedContentModels);
    });
  }

  StreamSubscription<List<DecoratedContentModel?>> listenWithDetails(DecoratedContentModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<DecoratedContentModel?>> stream;
    stream = getQuery(getCollection(), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
//  see comment listen(...) above
//  stream = getQuery(DecoratedContentCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfDecoratedContentModels) {
      trigger(listOfDecoratedContentModels);
    });
  }

  @override
  StreamSubscription<DecoratedContentModel?> listenTo(String documentId, DecoratedContentChanged changed, {DecoratedContentErrorHandler? errorHandler}) {
    var stream = DecoratedContentCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    var theStream = stream.listen((value) {
      changed(value);
    });
    theStream.onError((theException, theStacktrace) {
      if (errorHandler != null) {
        errorHandler(theException, theStacktrace);
      }
    });
    return theStream;
  }

  Stream<List<DecoratedContentModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<DecoratedContentModel?>> _values = getQuery(DecoratedContentCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<DecoratedContentModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<DecoratedContentModel?>> _values = getQuery(DecoratedContentCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<DecoratedContentModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<DecoratedContentModel?> _values = await getQuery(DecoratedContentCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<DecoratedContentModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<DecoratedContentModel?> _values = await getQuery(DecoratedContentCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
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
    return DecoratedContentCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return DecoratedContentCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<DecoratedContentModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return DecoratedContentCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  final String appId;
  DecoratedContentFirestore(this.getCollection, this.appId): DecoratedContentCollection = getCollection();

  final CollectionReference DecoratedContentCollection;
  final GetCollection getCollection;
}

