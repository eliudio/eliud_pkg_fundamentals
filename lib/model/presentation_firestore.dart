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
import 'package:cloud_firestore/cloud_firestore.dart';
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


class PresentationFirestore implements PresentationRepository {
  Future<PresentationModel> add(PresentationModel value) {
    return PresentationCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(PresentationModel value) {
    return PresentationCollection.document(value.documentID).delete();
  }

  Future<PresentationModel> update(PresentationModel value) {
    return PresentationCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  PresentationModel _populateDoc(DocumentSnapshot value) {
    return PresentationModel.fromEntity(value.documentID, PresentationEntity.fromMap(value.data));
  }

  Future<PresentationModel> _populateDocPlus(DocumentSnapshot value) async {
    return PresentationModel.fromEntityPlus(value.documentID, PresentationEntity.fromMap(value.data), appId: appId);  }

  Future<PresentationModel> get(String id) {
    return PresentationCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<PresentationModel>> listen(PresentationModelTrigger trigger, { String orderBy, bool descending }) {
    var stream = (orderBy == null ?  PresentationCollection : PresentationCollection.orderBy(orderBy, descending: descending)).snapshots()
        .map((data) {
      Iterable<PresentationModel> presentations  = data.documents.map((doc) {
        PresentationModel value = _populateDoc(doc);
        return value;
      }).toList();
      return presentations;
    });

    return stream.listen((listOfPresentationModels) {
      trigger(listOfPresentationModels);
    });
  }

  StreamSubscription<List<PresentationModel>> listenWithDetails(PresentationModelTrigger trigger) {
    Stream<List<PresentationModel>> stream = PresentationCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPresentationModels) {
      trigger(listOfPresentationModels);
    });
  }


  Stream<List<PresentationModel>> values() {
    return PresentationCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<PresentationModel>> valuesWithDetails() {
    return PresentationCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<PresentationModel>> valuesList() async {
    return await PresentationCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<PresentationModel>> valuesListWithDetails() async {
    return await PresentationCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return PresentationCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference PresentationCollection;

  PresentationFirestore(this.appId) : PresentationCollection = Firestore.instance.collection('Presentation-${appId}');
}

