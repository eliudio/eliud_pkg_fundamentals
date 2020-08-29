/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_firestore.dart
                       
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


class GridJsFirestore implements GridRepository {
  Future<GridModel> add(GridModel value) {
    return gridCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(GridModel value) {
    return gridCollection.doc(value.documentID).delete();
  }

  Future<GridModel> update(GridModel value) {
    return gridCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  GridModel _populateDoc(DocumentSnapshot doc) {
    return GridModel.fromEntity(doc.id, GridEntity.fromMap(doc.data()));
  }

  Future<GridModel> _populateDocPlus(DocumentSnapshot doc) async {
    return GridModel.fromEntityPlus(doc.id, GridEntity.fromMap(doc.data()));
  }

  Future<GridModel> get(String id) {
    return gridCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<GridModel>> listen(GridModelTrigger trigger) {
    // If we use gridCollection here, then the second subscription fails
    Stream<List<GridModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<GridModel> grids  = data.docs.map((doc) {
        GridModel value = _populateDoc(doc);
        return value;
      }).toList();
      return grids;
    });

    return stream.listen((listOfGridModels) {
      trigger(listOfGridModels);
    });
  }

  StreamSubscription<List<GridModel>> listenWithDetails(GridModelTrigger trigger) {
    // If we use gridCollection here, then the second subscription fails
    Stream<List<GridModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfGridModels) {
      trigger(listOfGridModels);
    });
  }

  Stream<List<GridModel>> values() {
    return gridCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<GridModel>> valuesWithDetails() {
    return gridCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<GridModel>> valuesList() {
    return gridCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<GridModel>> valuesListWithDetails() {
    return gridCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return gridCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => gridCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Grid-$appID');

  final String appID;
  
  GridJsFirestore(this.appID) : gridCollection = firestore().collection('Grid-$appID');

  final CollectionReference gridCollection;
}
