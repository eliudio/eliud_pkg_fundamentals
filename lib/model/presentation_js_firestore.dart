/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';


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


class PresentationJsFirestore implements PresentationRepository {
  Future<PresentationModel> add(PresentationModel value) {
    return presentationCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(PresentationModel value) {
    return presentationCollection.doc(value.documentID).delete();
  }

  Future<PresentationModel> update(PresentationModel value) {
    return presentationCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  PresentationModel _populateDoc(DocumentSnapshot value) {
    return PresentationModel.fromEntity(value.id, PresentationEntity.fromMap(value.data()));
  }

  Future<PresentationModel> _populateDocPlus(DocumentSnapshot value) async {
    return PresentationModel.fromEntityPlus(value.id, PresentationEntity.fromMap(value.data()), appId: appId);
  }

  Future<PresentationModel> get(String id) {
    return presentationCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<PresentationModel>> listen(PresentationModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<PresentationModel> presentations  = data.docs.map((doc) {
          PresentationModel value = _populateDoc(doc);
          return value;
        }).toList();
        return presentations;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<PresentationModel> presentations  = data.docs.map((doc) {
          PresentationModel value = _populateDoc(doc);
          return value;
        }).toList();
        return presentations;
      });
    }
    return stream.listen((listOfPresentationModels) {
      trigger(listOfPresentationModels);
    });
  }

  StreamSubscription<List<PresentationModel>> listenWithDetails(PresentationModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      // If we use presentationCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use presentationCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfPresentationModels) {
      trigger(listOfPresentationModels);
    });
  }

  Stream<List<PresentationModel>> values({String orderBy, bool descending }) {
    if (orderBy == null) {
      return presentationCollection.onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    } else {
      return presentationCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    }
  }

  Stream<List<PresentationModel>> valuesWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return presentationCollection.onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    } else {
      return presentationCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    }
  }

  @override
  Future<List<PresentationModel>> valuesList({String orderBy, bool descending }) {
    if (orderBy == null) {
      return presentationCollection.get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return presentationCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Future<List<PresentationModel>> valuesListWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return presentationCollection.get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return presentationCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return presentationCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => presentationCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Presentation-$appId');

  final String appId;
  
  PresentationJsFirestore(this.appId) : presentationCollection = firestore().collection('Presentation-$appId');

  final CollectionReference presentationCollection;
}
