/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/photo_and_text_repository.dart';


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

class PhotoAndTextFirestore implements PhotoAndTextRepository {
  Future<PhotoAndTextModel> add(PhotoAndTextModel value) {
    return PhotoAndTextCollection.doc(value.documentID).set(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(PhotoAndTextModel value) {
    return PhotoAndTextCollection.doc(value.documentID).delete();
  }

  Future<PhotoAndTextModel> update(PhotoAndTextModel value) {
    return PhotoAndTextCollection.doc(value.documentID).update(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  PhotoAndTextModel _populateDoc(DocumentSnapshot value) {
    return PhotoAndTextModel.fromEntity(value.id, PhotoAndTextEntity.fromMap(value.data()));
  }

  Future<PhotoAndTextModel> _populateDocPlus(DocumentSnapshot value) async {
    return PhotoAndTextModel.fromEntityPlus(value.id, PhotoAndTextEntity.fromMap(value.data()), appId: appId);  }

  Future<PhotoAndTextModel> get(String id, {Function(Exception) onError}) {
    return PhotoAndTextCollection.doc(id).get().then((doc) {
      if (doc.data() != null)
        return _populateDocPlus(doc);
      else
        return null;
    }).catchError((Object e) {
      if (onError != null) {
        onError(e);
      }
    });
  }

  StreamSubscription<List<PhotoAndTextModel>> listen(PhotoAndTextModelTrigger trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<PhotoAndTextModel>> stream;
//    stream = getQuery(PhotoAndTextCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((data) {
//    The above line is replaced by the below line. The reason is because the same collection can not be subscribed to twice
//    The reason we're subscribing twice to the same list, is because the close on bloc isn't called. This needs to be fixed.
//    See https://github.com/felangel/bloc/issues/2073.
//    In the meantime:
      stream = getQuery(appRepository().getSubCollection(appId, 'photoandtext'), orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((data) {
      Iterable<PhotoAndTextModel> photoAndTexts  = data.docs.map((doc) {
        PhotoAndTextModel value = _populateDoc(doc);
        return value;
      }).toList();
      return photoAndTexts;
    });
    return stream.listen((listOfPhotoAndTextModels) {
      trigger(listOfPhotoAndTextModels);
    });
  }

  StreamSubscription<List<PhotoAndTextModel>> listenWithDetails(PhotoAndTextModelTrigger trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery}) {
    Stream<List<PhotoAndTextModel>> stream;
//  stream = getQuery(PhotoAndTextCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots()
//  see comment listen(...) above
    stream = getQuery(appRepository().getSubCollection(appId, 'photoandtext'), orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPhotoAndTextModels) {
      trigger(listOfPhotoAndTextModels);
    });
  }

  @override
  StreamSubscription<PhotoAndTextModel> listenTo(String documentId, PhotoAndTextChanged changed) {
    var stream = PhotoAndTextCollection.doc(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<PhotoAndTextModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<PhotoAndTextModel>> _values = getQuery(PhotoAndTextCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<PhotoAndTextModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) {
    DocumentSnapshot lastDoc;
    Stream<List<PhotoAndTextModel>> _values = getQuery(PhotoAndTextCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PhotoAndTextModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<PhotoAndTextModel> _values = await getQuery(PhotoAndTextCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PhotoAndTextModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery }) async {
    DocumentSnapshot lastDoc;
    List<PhotoAndTextModel> _values = await getQuery(PhotoAndTextCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId).get().then((value) {
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
    return PhotoAndTextCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return PhotoAndTextCollection.doc(documentId).collection(name);
  }

  String timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  Future<PhotoAndTextModel> changeValue(String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return PhotoAndTextCollection.doc(documentId).update({fieldName: change}).then((v) => get(documentId));
  }


  final String appId;
  PhotoAndTextFirestore(this.PhotoAndTextCollection, this.appId);

  final CollectionReference PhotoAndTextCollection;
}

