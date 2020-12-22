/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class TutorialFirestore implements TutorialRepository {
  Future<TutorialModel> add(TutorialModel value) {
    return TutorialCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(TutorialModel value) {
    return TutorialCollection.document(value.documentID).delete();
  }

  Future<TutorialModel> update(TutorialModel value) {
    return TutorialCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  TutorialModel _populateDoc(DocumentSnapshot value) {
    return TutorialModel.fromEntity(value.documentID, TutorialEntity.fromMap(value.data));
  }

  Future<TutorialModel> _populateDocPlus(DocumentSnapshot value) async {
    return TutorialModel.fromEntityPlus(value.documentID, TutorialEntity.fromMap(value.data), appId: appId);  }

  Future<TutorialModel> get(String id) {
    return TutorialCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<TutorialModel>> listen(TutorialModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    Stream<List<TutorialModel>> stream;
    if (orderBy == null) {
       stream = TutorialCollection.snapshots().map((data) {
        Iterable<TutorialModel> tutorials  = data.documents.map((doc) {
          TutorialModel value = _populateDoc(doc);
          return value;
        }).toList();
        return tutorials;
      });
    } else {
      stream = TutorialCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<TutorialModel> tutorials  = data.documents.map((doc) {
          TutorialModel value = _populateDoc(doc);
          return value;
        }).toList();
        return tutorials;
      });
  
    }
    return stream.listen((listOfTutorialModels) {
      trigger(listOfTutorialModels);
    });
  }

  StreamSubscription<List<TutorialModel>> listenWithDetails(TutorialModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
    Stream<List<TutorialModel>> stream;
    if (orderBy == null) {
      stream = TutorialCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = TutorialCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfTutorialModels) {
      trigger(listOfTutorialModels);
    });
  }


  Stream<List<TutorialModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<TutorialModel>> _values = getQuery(TutorialCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, appId: appId).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<TutorialModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<TutorialModel>> _values = getQuery(TutorialCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, appId: appId).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<TutorialModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<TutorialModel> _values = await getQuery(TutorialCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<TutorialModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<TutorialModel> _values = await getQuery(TutorialCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId).getDocuments().then((value) {
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
    return TutorialCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return TutorialCollection.document(documentId).collection(name);
  }


  final String appId;
  TutorialFirestore(this.TutorialCollection, this.appId);

  final CollectionReference TutorialCollection;
}

