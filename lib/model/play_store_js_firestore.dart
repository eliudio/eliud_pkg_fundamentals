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

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
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
  StreamSubscription<List<PlayStoreModel>> listen(PlayStoreModelTrigger trigger, {String orderBy, bool descending }) {
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
      stream = (orderBy == null ?  getCollection() : getCollection().orderBy(orderBy, descending ? 'desc': 'asc')).onSnapshot
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

  StreamSubscription<List<PlayStoreModel>> listenWithDetails(PlayStoreModelTrigger trigger) {
    // If we use playStoreCollection here, then the second subscription fails
    Stream<List<PlayStoreModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPlayStoreModels) {
      trigger(listOfPlayStoreModels);
    });
  }

  Stream<List<PlayStoreModel>> values() {
    return playStoreCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<PlayStoreModel>> valuesWithDetails() {
    return playStoreCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<PlayStoreModel>> valuesList() {
    return playStoreCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<PlayStoreModel>> valuesListWithDetails() {
    return playStoreCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
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
