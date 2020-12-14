/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:eliud_pkg_fundamentals/model/divider_repository.dart';


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


class DividerJsFirestore implements DividerRepository {
  Future<DividerModel> add(DividerModel value) {
    return dividerCollection.doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<void> delete(DividerModel value) {
    return dividerCollection.doc(value.documentID).delete();
  }

  Future<DividerModel> update(DividerModel value) {
    return dividerCollection.doc(value.documentID)
        .update(data: value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  DividerModel _populateDoc(DocumentSnapshot value) {
    return DividerModel.fromEntity(value.id, DividerEntity.fromMap(value.data()));
  }

  Future<DividerModel> _populateDocPlus(DocumentSnapshot value) async {
    return DividerModel.fromEntityPlus(value.id, DividerEntity.fromMap(value.data()), appId: appId);
  }

  Future<DividerModel> get(String id) {
    return dividerCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  @override
  StreamSubscription<List<DividerModel>> listen(DividerModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      stream = getCollection().onSnapshot
          .map((data) {
        Iterable<DividerModel> dividers  = data.docs.map((doc) {
          DividerModel value = _populateDoc(doc);
          return value;
        }).toList();
        return dividers;
      });
    } else {
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) {
        Iterable<DividerModel> dividers  = data.docs.map((doc) {
          DividerModel value = _populateDoc(doc);
          return value;
        }).toList();
        return dividers;
      });
    }
    return stream.listen((listOfDividerModels) {
      trigger(listOfDividerModels);
    });
  }

  StreamSubscription<List<DividerModel>> listenWithDetails(DividerModelTrigger trigger, {String orderBy, bool descending }) {
    var stream;
    if (orderBy == null) {
      // If we use dividerCollection here, then the second subscription fails
      stream = getCollection().onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      // If we use dividerCollection here, then the second subscription fails
      stream = getCollection().orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) async {
        return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
    return stream.listen((listOfDividerModels) {
      trigger(listOfDividerModels);
    });
  }

  Stream<List<DividerModel>> values({String orderBy, bool descending }) {
    if (orderBy == null) {
      return dividerCollection.onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    } else {
      return dividerCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
    }
  }

  Stream<List<DividerModel>> valuesWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return dividerCollection.onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    } else {
      return dividerCollection.orderBy(orderBy, descending ? 'desc': 'asc').onSnapshot
          .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
    }
  }

  @override
  Future<List<DividerModel>> valuesList({String orderBy, bool descending }) {
    if (orderBy == null) {
      return dividerCollection.get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return dividerCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  @override
  Future<List<DividerModel>> valuesListWithDetails({String orderBy, bool descending }) {
    if (orderBy == null) {
      return dividerCollection.get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return dividerCollection.orderBy(orderBy, descending ? 'desc': 'asc').get().then((value) {
        var list = value.docs;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return dividerCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => dividerCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Divider-$appId');

  final String appId;
  
  DividerJsFirestore(this.appId) : dividerCollection = firestore().collection('Divider-$appId');

  final CollectionReference dividerCollection;
}
