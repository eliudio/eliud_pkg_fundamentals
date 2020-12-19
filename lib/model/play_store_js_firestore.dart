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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/tools/js_firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class PlayStoreJsFirestore implements PlayStoreRepository {
  Future<PlayStoreModel> add(PlayStoreModel value) {
    return playStoreCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(PlayStoreModel value) {
    return playStoreCollection.doc(value.documentID).delete();
  }

  Future<PlayStoreModel> update(PlayStoreModel value) {
    return playStoreCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  PlayStoreModel _populateDoc(DocumentSnapshot value) {
    return PlayStoreModel.fromEntity(value.id, PlayStoreEntity.fromMap(value.data()));
  }

  Future<PlayStoreModel> _populateDocPlus(DocumentSnapshot value) async {
    return PlayStoreModel.fromEntityPlus(value.id, PlayStoreEntity.fromMap(value.data()), appId: appId);
  }

  Future<PlayStoreModel> get(String id) {
    return playStoreCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<PlayStoreModel>> listen(PlayStoreModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<PlayStoreModel> playStores  = data.docs.map((doc) {
          PlayStoreModel value = _populateDoc(doc);
          return value;
        }).toList();
        return playStores;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<PlayStoreModel> playStores  = data.docs.map((doc) {
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

  StreamSubscription<List<PlayStoreModel>> listenWithDetails(PlayStoreModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      // If we use playStoreCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use playStoreCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfPlayStoreModels) {
      trigger(listOfPlayStoreModels);
    });
  }

  Stream<List<PlayStoreModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<PlayStoreModel>> _values = getQuery(playStoreCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel)
      .onSnapshot
      .map((data) { 
        return data.docs.map((doc) {
          lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<PlayStoreModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<PlayStoreModel>> _values = getQuery(playStoreCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel)
      .onSnapshot
      .asyncMap((data) {
        return Future.wait(data.docs.map((doc) { 
          lastDoc = doc;
          return _populateDocPlus(doc);
        }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  @override
  Future<List<PlayStoreModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<PlayStoreModel> _values = await getQuery(playStoreCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).get().then((value) {
      var list = value.docs;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  @override
  Future<List<PlayStoreModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<PlayStoreModel> _values = await getQuery(playStoreCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel).get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {  
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return playStoreCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => playStoreCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('PlayStore-$appId');

  final String appId;
  
  PlayStoreJsFirestore(this.appId) : playStoreCollection = firestore().collection('PlayStore-$appId');

  final CollectionReference playStoreCollection;
}
