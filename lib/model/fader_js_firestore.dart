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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


class FaderJsFirestore implements FaderRepository {
  Future<FaderModel> add(FaderModel value) {
    return faderCollection.doc(value.documentID)
        .set(value.toEntity(appId: appID).toDocument())
        .then((_) => value);
  }

  Future<void> delete(FaderModel value) {
    return faderCollection.doc(value.documentID).delete();
  }

  Future<FaderModel> update(FaderModel value) {
    return faderCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appID).toDocument())
        .then((_) => value);
  }

  FaderModel _populateDoc(DocumentSnapshot doc) {
    return FaderModel.fromEntity(doc.id, FaderEntity.fromMap(doc.data()));
  }

  Future<FaderModel> _populateDocPlus(DocumentSnapshot doc) async {
    return FaderModel.fromEntityPlus(doc.id, FaderEntity.fromMap(doc.data()));
  }

  Future<FaderModel> get(String id) {
    return faderCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<FaderModel>> listen(FaderModelTrigger trigger) {
    // If we use faderCollection here, then the second subscription fails
    Stream<List<FaderModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<FaderModel> faders  = data.docs.map((doc) {
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
    // If we use faderCollection here, then the second subscription fails
    Stream<List<FaderModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfFaderModels) {
      trigger(listOfFaderModels);
    });
  }

  Stream<List<FaderModel>> values() {
    return faderCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<FaderModel>> valuesWithDetails() {
    return faderCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<FaderModel>> valuesList() {
    return faderCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<FaderModel>> valuesListWithDetails() {
    return faderCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return faderCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => faderCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Fader-$appID');

  final String appID;
  
  FaderJsFirestore(this.appID) : faderCollection = firestore().collection('Fader-$appID');

  final CollectionReference faderCollection;
}
