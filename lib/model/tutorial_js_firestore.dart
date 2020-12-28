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

import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';



import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_core/tools/js_firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

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
  StreamSubscription<List<TutorialModel>> listen(TutorialModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<TutorialModel> tutorials  = data.docs.map((doc) {
          TutorialModel value = _populateDoc(doc);
          return value;
        }).toList();
        return tutorials;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<TutorialModel> tutorials  = data.docs.map((doc) {
          TutorialModel value = _populateDoc(doc);
          return value;
        }).toList();
        return tutorials;
      });
    }
    return stream.listen((listOfTutorialModels) {
      trigger(listOfTutorialModels);
    });
  }

  StreamSubscription<List<TutorialModel>> listenWithDetails(TutorialModelTrigger trigger, {String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    var stream;
    if (orderBy == null) {
      // If we use tutorialCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use tutorialCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfTutorialModels) {
      trigger(listOfTutorialModels);
    });
  }

  @override
  StreamSubscription<TutorialModel> listenTo(String documentId, TutorialChanged changed) {
    var stream = getCollection().doc(documentId)
        .onSnapshot
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<TutorialModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<TutorialModel>> _values = getQuery(tutorialCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId)
      .onSnapshot
      .map((data) { 
        return data.docs.map((doc) {
          lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<TutorialModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<TutorialModel>> _values = getQuery(tutorialCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId)
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
  Future<List<TutorialModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<TutorialModel> _values = await getQuery(tutorialCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId).get().then((value) {
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
  Future<List<TutorialModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<TutorialModel> _values = await getQuery(tutorialCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId).get().then((value) {
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
    return tutorialCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => tutorialCollection.doc(element.id).delete()));
  }
  
  dynamic getSubCollection(String documentId, String name) {
    return tutorialCollection.doc(documentId).collection(name);
  }

  String timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 
  final String appId;
  TutorialJsFirestore(this.tutorialCollection, this.appId);

  // In flutterweb, it seems we require to re-retrieve the collection. If not then subscribing / listening to it a second time fails.
  // CollectionReference getCollection() => tutorialCollection;
  CollectionReference getCollection() => appRepository().getSubCollection(appId, 'tutorial');
  final CollectionReference tutorialCollection;
}

