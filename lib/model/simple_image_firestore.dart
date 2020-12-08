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
import 'package:cloud_firestore/cloud_firestore.dart';
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


class SimpleImageFirestore implements SimpleImageRepository {
  Future<SimpleImageModel> add(SimpleImageModel value) {
    return SimpleImageCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(SimpleImageModel value) {
    return SimpleImageCollection.document(value.documentID).delete();
  }

  Future<SimpleImageModel> update(SimpleImageModel value) {
    return SimpleImageCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  SimpleImageModel _populateDoc(DocumentSnapshot value) {
    return SimpleImageModel.fromEntity(value.documentID, SimpleImageEntity.fromMap(value.data));
  }

  Future<SimpleImageModel> _populateDocPlus(DocumentSnapshot value) async {
    return SimpleImageModel.fromEntityPlus(value.documentID, SimpleImageEntity.fromMap(value.data), appId: appId);  }

  Future<SimpleImageModel> get(String id) {
    return SimpleImageCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<SimpleImageModel>> listen(SimpleImageModelTrigger trigger, { String orderBy, bool descending }) {
    var stream = (orderBy == null ?  SimpleImageCollection : SimpleImageCollection.orderBy(orderBy, descending: descending)).snapshots()
        .map((data) {
      Iterable<SimpleImageModel> simpleImages  = data.documents.map((doc) {
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
    Stream<List<SimpleImageModel>> stream = SimpleImageCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfSimpleImageModels) {
      trigger(listOfSimpleImageModels);
    });
  }


  Stream<List<SimpleImageModel>> values() {
    return SimpleImageCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<SimpleImageModel>> valuesWithDetails() {
    return SimpleImageCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<SimpleImageModel>> valuesList() async {
    return await SimpleImageCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<SimpleImageModel>> valuesListWithDetails() async {
    return await SimpleImageCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return SimpleImageCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference SimpleImageCollection;

  SimpleImageFirestore(this.appId) : SimpleImageCollection = Firestore.instance.collection('SimpleImage-${appId}');
}

