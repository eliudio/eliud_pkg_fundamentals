/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';


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

class PresentationFirestore implements PresentationRepository {
  Future<PresentationModel> add(PresentationModel value) {
    return PresentationCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(PresentationModel value) {
    return PresentationCollection.document(value.documentID).delete();
  }

  Future<PresentationModel> update(PresentationModel value) {
    return PresentationCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  PresentationModel _populateDoc(DocumentSnapshot value) {
    return PresentationModel.fromEntity(value.documentID, PresentationEntity.fromMap(value.data));
  }

  Future<PresentationModel> _populateDocPlus(DocumentSnapshot value) async {
    return PresentationModel.fromEntityPlus(value.documentID, PresentationEntity.fromMap(value.data), appId: appId);  }

  Future<PresentationModel> get(String id, {Function(Exception) onError}) {
    return PresentationCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    }).catchError((Object e) {
      if (onError != null) {
        onError(e);
      }
    });
  }

  StreamSubscription<List<PresentationModel>> listen(PresentationModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<PresentationModel>> stream;
    stream = getQuery(PresentationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((data) {
      Iterable<PresentationModel> presentations  = data.documents.map((doc) {
        PresentationModel value = _populateDoc(doc);
        return value;
      }).toList();
      return presentations;
    });
    return stream.listen((listOfPresentationModels) {
      trigger(listOfPresentationModels);
    });
  }

  StreamSubscription<List<PresentationModel>> listenWithDetails(PresentationModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<PresentationModel>> stream;
    stream = getQuery(PresentationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPresentationModels) {
      trigger(listOfPresentationModels);
    });
  }

  @override
  StreamSubscription<PresentationModel> listenTo(String documentId, PresentationChanged changed) {
    var stream = PresentationCollection.document(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<PresentationModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<PresentationModel>> _values = getQuery(PresentationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<PresentationModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<PresentationModel>> _values = getQuery(PresentationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PresentationModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<PresentationModel> _values = await getQuery(PresentationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PresentationModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<PresentationModel> _values = await getQuery(PresentationCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).getDocuments().then((value) {
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
    return PresentationCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return PresentationCollection.document(documentId).collection(name);
  }

  String timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  final String appId;
  PresentationFirestore(this.PresentationCollection, this.appId);

  final CollectionReference PresentationCollection;
}

