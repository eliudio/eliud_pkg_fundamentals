/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


class TutorialJsFirestore implements TutorialRepository {
  Future<TutorialModel> add(TutorialModel value) {
    return tutorialCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(TutorialModel value) {
    return tutorialCollection.doc(value.documentID).delete();
  }

  Future<TutorialModel> update(TutorialModel value) {
    return tutorialCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  TutorialModel _populateDoc(DocumentSnapshot value) {
    return TutorialModel.fromEntity(value.id, TutorialEntity.fromMap(value.data()));
  }

  Future<TutorialModel> _populateDocPlus(DocumentSnapshot value) async {
    return TutorialModel.fromEntityPlus(value.id, TutorialEntity.fromMap(value.data()), appId: appId);
  }

  Future<TutorialModel> get(String id) {
    return tutorialCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<TutorialModel>> listen(TutorialModelTrigger trigger, {String orderBy, bool descending }) {
    var stream = (orderBy == null ?  getCollection() : getCollection().orderBy(orderBy, descending ? 'desc': 'asc')).onSnapshot
        .map((data) {
      Iterable<TutorialModel> tutorials  = data.docs.map((doc) {
        TutorialModel value = _populateDoc(doc);
        return value;
      }).toList();
      return tutorials;
    });

    return stream.listen((listOfTutorialModels) {
      trigger(listOfTutorialModels);
    });
  }

  StreamSubscription<List<TutorialModel>> listenWithDetails(TutorialModelTrigger trigger) {
    // If we use tutorialCollection here, then the second subscription fails
    Stream<List<TutorialModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfTutorialModels) {
      trigger(listOfTutorialModels);
    });
  }

  Stream<List<TutorialModel>> values() {
    return tutorialCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<TutorialModel>> valuesWithDetails() {
    return tutorialCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<TutorialModel>> valuesList() {
    return tutorialCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<TutorialModel>> valuesListWithDetails() {
    return tutorialCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return tutorialCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => tutorialCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Tutorial-$appId');

  final String appId;
  
  TutorialJsFirestore(this.appId) : tutorialCollection = firestore().collection('Tutorial-$appId');

  final CollectionReference tutorialCollection;
}
