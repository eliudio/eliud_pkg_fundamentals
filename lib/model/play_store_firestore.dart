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
import 'package:cloud_firestore/cloud_firestore.dart';
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


class PlayStoreFirestore implements PlayStoreRepository {
  Future<PlayStoreModel> add(PlayStoreModel value) {
    return PlayStoreCollection.document(value.documentID).setData(value.toEntity().toDocument()).then((_) => value);
  }

  Future<void> delete(PlayStoreModel value) {
    return PlayStoreCollection.document(value.documentID).delete();
  }

  Future<PlayStoreModel> update(PlayStoreModel value) {
    return PlayStoreCollection.document(value.documentID).updateData(value.toEntity().toDocument()).then((_) => value);
  }

  PlayStoreModel _populateDoc(DocumentSnapshot doc) {
    return PlayStoreModel.fromEntity(doc.documentID, PlayStoreEntity.fromMap(doc.data));
  }

  Future<PlayStoreModel> _populateDocPlus(DocumentSnapshot doc) async {
    return PlayStoreModel.fromEntityPlus(doc.documentID, PlayStoreEntity.fromMap(doc.data));  }

  Future<PlayStoreModel> get(String id) {
    return PlayStoreCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<PlayStoreModel>> listen(PlayStoreModelTrigger trigger) {
    Stream<List<PlayStoreModel>> stream = PlayStoreCollection.snapshots()
        .map((data) {
      Iterable<PlayStoreModel> playStores  = data.documents.map((doc) {
        PlayStoreModel value = _populateDoc(doc);
        return value;
      }).toList();
      return playStores;
    });

    return stream.listen((listOfPlayStoreModels) {
      trigger(listOfPlayStoreModels);
    });
  }

  StreamSubscription<List<PlayStoreModel>> listenWithDetails(PlayStoreModelTrigger trigger) {
    Stream<List<PlayStoreModel>> stream = PlayStoreCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPlayStoreModels) {
      trigger(listOfPlayStoreModels);
    });
  }


  Stream<List<PlayStoreModel>> values() {
    return PlayStoreCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<PlayStoreModel>> valuesWithDetails() {
    return PlayStoreCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<PlayStoreModel>> valuesList() async {
    return await PlayStoreCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<PlayStoreModel>> valuesListWithDetails() async {
    return await PlayStoreCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return PlayStoreCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference PlayStoreCollection;

  PlayStoreFirestore(this.appID) : PlayStoreCollection = Firestore.instance.collection('PlayStore-${appID}');
}

