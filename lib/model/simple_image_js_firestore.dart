/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_repository.dart';


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


class SimpleImageJsFirestore implements SimpleImageRepository {
  Future<SimpleImageModel> add(SimpleImageModel value) {
    return simpleImageCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(SimpleImageModel value) {
    return simpleImageCollection.doc(value.documentID).delete();
  }

  Future<SimpleImageModel> update(SimpleImageModel value) {
    return simpleImageCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  SimpleImageModel _populateDoc(DocumentSnapshot value) {
    return SimpleImageModel.fromEntity(value.id, SimpleImageEntity.fromMap(value.data()));
  }

  Future<SimpleImageModel> _populateDocPlus(DocumentSnapshot value) async {
    return SimpleImageModel.fromEntityPlus(value.id, SimpleImageEntity.fromMap(value.data()), appId: appId);
  }

  Future<SimpleImageModel> get(String id) {
    return simpleImageCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<SimpleImageModel>> listen(SimpleImageModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<SimpleImageModel> simpleImages  = data.docs.map((doc) {
          SimpleImageModel value = _populateDoc(doc);
          return value;
        }).toList();
        return simpleImages;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<SimpleImageModel> simpleImages  = data.docs.map((doc) {
          SimpleImageModel value = _populateDoc(doc);
          return value;
        }).toList();
        return simpleImages;
      });
    }
    return stream.listen((listOfSimpleImageModels) {
      trigger(listOfSimpleImageModels);
    });
  }

  StreamSubscription<List<SimpleImageModel>> listenWithDetails(SimpleImageModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      // If we use simpleImageCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use simpleImageCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfSimpleImageModels) {
      trigger(listOfSimpleImageModels);
    });
  }

  Stream<List<SimpleImageModel>> values({String orderBy, bool descending }) {
    if (orderBy == null) {
      return simpleImageCollection.onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    } else {
      return simpleImageCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    }
  }

  Stream<List<SimpleImageModel>> valuesWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return simpleImageCollection.onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    } else {
      return simpleImageCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    }
  }

  @override
  Future<List<SimpleImageModel>> valuesList({String orderBy, bool descending }) {
    if (orderBy == null) {
      return simpleImageCollection.get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return simpleImageCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Future<List<SimpleImageModel>> valuesListWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return simpleImageCollection.get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return simpleImageCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return simpleImageCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => simpleImageCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('SimpleImage-$appId');

  final String appId;
  
  SimpleImageJsFirestore(this.appId) : simpleImageCollection = firestore().collection('SimpleImage-$appId');

  final CollectionReference simpleImageCollection;
}
