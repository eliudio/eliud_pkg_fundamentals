/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/play_store_repository.dart';

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

class PlayStoreFirestore implements PlayStoreRepository {
  Future<PlayStoreModel> add(PlayStoreModel value) {
    return PlayStoreCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(PlayStoreModel value) {
    return PlayStoreCollection.document(value.documentID).delete();
  }

  Future<PlayStoreModel> update(PlayStoreModel value) {
    return PlayStoreCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  PlayStoreModel _populateDoc(DocumentSnapshot value) {
    return PlayStoreModel.fromEntity(value.documentID, PlayStoreEntity.fromMap(value.data));
  }

  Future<PlayStoreModel> _populateDocPlus(DocumentSnapshot value) async {
    return PlayStoreModel.fromEntityPlus(value.documentID, PlayStoreEntity.fromMap(value.data), appId: appId);  }

  Future<PlayStoreModel> get(String id) {
    return PlayStoreCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<PlayStoreModel>> listen(PlayStoreModelTrigger trigger, {String currentMember, String orderBy, bool descending}) {
    Stream<List<PlayStoreModel>> stream;
    if (orderBy == null) {
       stream = PlayStoreCollection.snapshots().map((data) {
        Iterable<PlayStoreModel> playStores  = data.documents.map((doc) {
          PlayStoreModel value = _populateDoc(doc);
          return value;
        }).toList();
        return playStores;
      });
    } else {
      stream = PlayStoreCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<PlayStoreModel> playStores  = data.documents.map((doc) {
          PlayStoreModel value = _populateDoc(doc);
          return value;
        }).toList();
        return playStores;
      });
  
    }
    return stream.listen((listOfPlayStoreModels) {
      trigger(listOfPlayStoreModels);
    });
  }

  StreamSubscription<List<PlayStoreModel>> listenWithDetails(PlayStoreModelTrigger trigger, {String currentMember, String orderBy, bool descending}) {
    Stream<List<PlayStoreModel>> stream;
    if (orderBy == null) {
      stream = PlayStoreCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = PlayStoreCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfPlayStoreModels) {
      trigger(listOfPlayStoreModels);
    });
  }


  Stream<List<PlayStoreModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    DocumentSnapshot lastDoc;
    Stream<List<PlayStoreModel>> _values = getQuery(PlayStoreCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<PlayStoreModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    DocumentSnapshot lastDoc;
    Stream<List<PlayStoreModel>> _values = getQuery(PlayStoreCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PlayStoreModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    DocumentSnapshot lastDoc;
    List<PlayStoreModel> _values = await getQuery(PlayStoreCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<PlayStoreModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    DocumentSnapshot lastDoc;
    List<PlayStoreModel> _values = await getQuery(PlayStoreCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).getDocuments().then((value) {
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
    return PlayStoreCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }


  final String appId;
  final CollectionReference PlayStoreCollection;

  PlayStoreFirestore(this.appId) : PlayStoreCollection = Firestore.instance.collection('PlayStore-${appId}');
}

