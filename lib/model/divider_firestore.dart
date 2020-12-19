/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/divider_repository.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class DividerFirestore implements DividerRepository {
  Future<DividerModel> add(DividerModel value) {
    return DividerCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(DividerModel value) {
    return DividerCollection.document(value.documentID).delete();
  }

  Future<DividerModel> update(DividerModel value) {
    return DividerCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  DividerModel _populateDoc(DocumentSnapshot value) {
    return DividerModel.fromEntity(value.documentID, DividerEntity.fromMap(value.data));
  }

  Future<DividerModel> _populateDocPlus(DocumentSnapshot value) async {
    return DividerModel.fromEntityPlus(value.documentID, DividerEntity.fromMap(value.data), appId: appId);  }

  Future<DividerModel> get(String id) {
    return DividerCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<DividerModel>> listen(DividerModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    Stream<List<DividerModel>> stream;
    if (orderBy == null) {
       stream = DividerCollection.snapshots().map((data) {
        Iterable<DividerModel> dividers  = data.documents.map((doc) {
          DividerModel value = _populateDoc(doc);
          return value;
        }).toList();
        return dividers;
      });
    } else {
      stream = DividerCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<DividerModel> dividers  = data.documents.map((doc) {
          DividerModel value = _populateDoc(doc);
          return value;
        }).toList();
        return dividers;
      });
  
    }
    return stream.listen((listOfDividerModels) {
      trigger(listOfDividerModels);
    });
  }

  StreamSubscription<List<DividerModel>> listenWithDetails(DividerModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    Stream<List<DividerModel>> stream;
    if (orderBy == null) {
      stream = DividerCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = DividerCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfDividerModels) {
      trigger(listOfDividerModels);
    });
  }


  Stream<List<DividerModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<DividerModel>> _values = getQuery(DividerCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<DividerModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<DividerModel>> _values = getQuery(DividerCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<DividerModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<DividerModel> _values = await getQuery(DividerCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<DividerModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<DividerModel> _values = await getQuery(DividerCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).getDocuments().then((value) {
      var list = value.documents;
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
    return DividerCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }


  final String appId;
  final CollectionReference DividerCollection;

  DividerFirestore(this.appId) : DividerCollection = Firestore.instance.collection('Divider-${appId}');
}

