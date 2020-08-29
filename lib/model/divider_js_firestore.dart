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


// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


class DividerJsFirestore implements DividerRepository {
  Future<DividerModel> add(DividerModel value) {
    return dividerCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(DividerModel value) {
    return dividerCollection.doc(value.documentID).delete();
  }

  Future<DividerModel> update(DividerModel value) {
    return dividerCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  DividerModel _populateDoc(DocumentSnapshot doc) {
    return DividerModel.fromEntity(doc.id, DividerEntity.fromMap(doc.data()));
  }

  Future<DividerModel> _populateDocPlus(DocumentSnapshot doc) async {
    return DividerModel.fromEntityPlus(doc.id, DividerEntity.fromMap(doc.data()));
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

  StreamSubscription<List<DividerModel>> listen(DividerModelTrigger trigger) {
    // If we use dividerCollection here, then the second subscription fails
    Stream<List<DividerModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<DividerModel> dividers  = data.docs.map((doc) {
        DividerModel value = _populateDoc(doc);
        return value;
      }).toList();
      return dividers;
    });

    return stream.listen((listOfDividerModels) {
      trigger(listOfDividerModels);
    });
  }

  StreamSubscription<List<DividerModel>> listenWithDetails(DividerModelTrigger trigger) {
    // If we use dividerCollection here, then the second subscription fails
    Stream<List<DividerModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfDividerModels) {
      trigger(listOfDividerModels);
    });
  }

  Stream<List<DividerModel>> values() {
    return dividerCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<DividerModel>> valuesWithDetails() {
    return dividerCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<DividerModel>> valuesList() {
    return dividerCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<DividerModel>> valuesListWithDetails() {
    return dividerCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return dividerCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => dividerCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Divider-$appID');

  final String appID;
  
  DividerJsFirestore(this.appID) : dividerCollection = firestore().collection('Divider-$appID');

  final CollectionReference dividerCollection;
}
