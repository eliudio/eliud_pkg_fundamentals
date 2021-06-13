/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';
import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';

class GridFirestore implements GridRepository {
  Future<GridModel> add(GridModel value) {
    return GridCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(GridModel value) {
    return GridCollection.doc(value.documentID).delete();
  }

  Future<GridModel> update(GridModel value) {
    return GridCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  GridModel? _populateDoc(DocumentSnapshot value) {
    return GridModel.fromEntity(value.id, GridEntity.fromMap(value.data()));
  }

  Future<GridModel?> _populateDocPlus(DocumentSnapshot value) async {
    return GridModel.fromEntityPlus(value.id, GridEntity.fromMap(value.data()), appId: appId);  }

  Future<GridModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = GridCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch(e) {
      print("Error whilst retrieving Grid with id $id");
      print("Exceptoin: $e");
      if (onError != null) {
        onError(e);
      }
    };
  }

  StreamSubscription<List<GridModel?>> listen(GridModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<GridModel?>> stream;
//    stream = getQuery(GridCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().map((data) {
//    The above line is replaced by the below line. The reason is because the same collection can not be subscribed to twice
//    The reason we're subscribing twice to the same list, is because the close on bloc isn't called. This needs to be fixed.
//    See https://github.com/felangel/bloc/issues/2073.
//    In the meantime:
      stream = getQuery(appRepository()!.getSubCollection(appId, 'grid'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().map((data) {
      Iterable<GridModel?> grids  = data.docs.map((doc) {
        GridModel? value = _populateDoc(doc);
        return value;
      }).toList();
      return grids as List<GridModel?>;
    });
    return stream.listen((listOfGridModels) {
      trigger(listOfGridModels);
    });
  }

  StreamSubscription<List<GridModel?>> listenWithDetails(GridModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery}) {
    Stream<List<GridModel?>> stream;
//  stream = getQuery(GridCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots()
//  see comment listen(...) above
    stream = getQuery(appRepository()!.getSubCollection(appId, 'grid'), orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfGridModels) {
      trigger(listOfGridModels);
    });
  }

  @override
  StreamSubscription<GridModel?> listenTo(String documentId, GridChanged changed) {
    var stream = GridCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<GridModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<GridModel?>> _values = getQuery(GridCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<GridModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) {
    DocumentSnapshot? lastDoc;
    Stream<List<GridModel?>> _values = getQuery(GridCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<GridModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<GridModel?> _values = await getQuery(GridCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<GridModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery }) async {
    DocumentSnapshot? lastDoc;
    List<GridModel?> _values = await getQuery(GridCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.get().then((value) {
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
    return GridCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return GridCollection.doc(documentId).collection(name);
  }

  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<GridModel?> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return GridCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  final String appId;
  GridFirestore(this.GridCollection, this.appId);

  final CollectionReference GridCollection;
}

