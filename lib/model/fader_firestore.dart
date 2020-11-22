/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


class FaderFirestore implements FaderRepository {
  Future<FaderModel> add(FaderModel value) {
    return FaderCollection.document(value.documentID).setData(value.toEntity(appId: appID).toDocument()).then((_) => value);
  }

  Future<void> delete(FaderModel value) {
    return FaderCollection.document(value.documentID).delete();
  }

  Future<FaderModel> update(FaderModel value) {
    return FaderCollection.document(value.documentID).updateData(value.toEntity(appId: appID).toDocument()).then((_) => value);
  }

  FaderModel _populateDoc(DocumentSnapshot doc) {
    return FaderModel.fromEntity(doc.documentID, FaderEntity.fromMap(doc.data));
  }

  Future<FaderModel> _populateDocPlus(DocumentSnapshot doc) async {
    return FaderModel.fromEntityPlus(doc.documentID, FaderEntity.fromMap(doc.data));  }

  Future<FaderModel> get(String id) {
    return FaderCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<FaderModel>> listen(FaderModelTrigger trigger) {
    Stream<List<FaderModel>> stream = FaderCollection.snapshots()
        .map((data) {
      Iterable<FaderModel> faders  = data.documents.map((doc) {
        FaderModel value = _populateDoc(doc);
        return value;
      }).toList();
      return faders;
    });

    return stream.listen((listOfFaderModels) {
      trigger(listOfFaderModels);
    });
  }

  StreamSubscription<List<FaderModel>> listenWithDetails(FaderModelTrigger trigger) {
    Stream<List<FaderModel>> stream = FaderCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfFaderModels) {
      trigger(listOfFaderModels);
    });
  }


  Stream<List<FaderModel>> values() {
    return FaderCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<FaderModel>> valuesWithDetails() {
    return FaderCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<FaderModel>> valuesList() async {
    return await FaderCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<FaderModel>> valuesListWithDetails() async {
    return await FaderCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return FaderCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appID;
  final CollectionReference FaderCollection;

  FaderFirestore(this.appID) : FaderCollection = Firestore.instance.collection('Fader-${appID}');
}

