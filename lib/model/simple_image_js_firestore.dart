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
import 'simple_image_repository.dart';


import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


class SimpleImageJsFirestore implements SimpleImageRepository {
  Future<SimpleImageModel> add(SimpleImageModel value) {
    return simpleImageCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(SimpleImageModel value) {
    return simpleImageCollection.doc(value.documentID).delete();
  }

  Future<SimpleImageModel> update(SimpleImageModel value) {
    return simpleImageCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  SimpleImageModel _populateDoc(DocumentSnapshot doc) {
    return SimpleImageModel.fromEntity(doc.id, SimpleImageEntity.fromMap(doc.data()));
  }

  Future<SimpleImageModel> _populateDocPlus(DocumentSnapshot doc) async {
    return SimpleImageModel.fromEntityPlus(doc.id, SimpleImageEntity.fromMap(doc.data()));
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

  StreamSubscription<List<SimpleImageModel>> listen(SimpleImageModelTrigger trigger) {
    // If we use simpleImageCollection here, then the second subscription fails
    Stream<List<SimpleImageModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<SimpleImageModel> simpleImages  = data.docs.map((doc) {
        SimpleImageModel value = _populateDoc(doc);
        return value;
      }).toList();
      return simpleImages;
    });

    return stream.listen((listOfSimpleImageModels) {
      trigger(listOfSimpleImageModels);
    });
  }

  StreamSubscription<List<SimpleImageModel>> listenWithDetails(SimpleImageModelTrigger trigger) {
    // If we use simpleImageCollection here, then the second subscription fails
    Stream<List<SimpleImageModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfSimpleImageModels) {
      trigger(listOfSimpleImageModels);
    });
  }

  Stream<List<SimpleImageModel>> values() {
    return simpleImageCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<SimpleImageModel>> valuesWithDetails() {
    return simpleImageCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<SimpleImageModel>> valuesList() {
    return simpleImageCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<SimpleImageModel>> valuesListWithDetails() {
    return simpleImageCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return simpleImageCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => simpleImageCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('SimpleImage-$appID');

  final String appID;
  
  SimpleImageJsFirestore(this.appID) : simpleImageCollection = firestore().collection('SimpleImage-$appID');

  final CollectionReference simpleImageCollection;
}
