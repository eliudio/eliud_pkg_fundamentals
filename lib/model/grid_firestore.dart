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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';

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


class GridFirestore implements GridRepository {
  Future<GridModel> add(GridModel value) {
    return GridCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(GridModel value) {
    return GridCollection.document(value.documentID).delete();
  }

  Future<GridModel> update(GridModel value) {
    return GridCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  GridModel _populateDoc(DocumentSnapshot value) {
    return GridModel.fromEntity(value.documentID, GridEntity.fromMap(value.data));
  }

  Future<GridModel> _populateDocPlus(DocumentSnapshot value) async {
    return GridModel.fromEntityPlus(value.documentID, GridEntity.fromMap(value.data), appId: appId);  }

  Future<GridModel> get(String id) {
    return GridCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<GridModel>> listen(GridModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<GridModel>> stream;
    if (orderBy == null) {
       stream = GridCollection.snapshots().map((data) {
        Iterable<GridModel> grids  = data.documents.map((doc) {
          GridModel value = _populateDoc(doc);
          return value;
        }).toList();
        return grids;
      });
    } else {
      stream = GridCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<GridModel> grids  = data.documents.map((doc) {
          GridModel value = _populateDoc(doc);
          return value;
        }).toList();
        return grids;
      });
  
    }
    return stream.listen((listOfGridModels) {
      trigger(listOfGridModels);
    });
  }

  StreamSubscription<List<GridModel>> listenWithDetails(GridModelTrigger trigger) {
    Stream<List<GridModel>> stream = GridCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfGridModels) {
      trigger(listOfGridModels);
    });
  }


  Stream<List<GridModel>> values() {
    return GridCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<GridModel>> valuesWithDetails() {
    return GridCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<GridModel>> valuesList() async {
    return await GridCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<GridModel>> valuesListWithDetails() async {
    return await GridCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return GridCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference GridCollection;

  GridFirestore(this.appId) : GridCollection = Firestore.instance.collection('Grid-${appId}');
}

