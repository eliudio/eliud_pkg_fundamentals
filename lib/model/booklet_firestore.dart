/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


class BookletFirestore implements BookletRepository {
  Future<BookletModel> add(BookletModel value) {
    return BookletCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(BookletModel value) {
    return BookletCollection.document(value.documentID).delete();
  }

  Future<BookletModel> update(BookletModel value) {
    return BookletCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  BookletModel _populateDoc(DocumentSnapshot value) {
    return BookletModel.fromEntity(value.documentID, BookletEntity.fromMap(value.data));
  }

  Future<BookletModel> _populateDocPlus(DocumentSnapshot value) async {
    return BookletModel.fromEntityPlus(value.documentID, BookletEntity.fromMap(value.data), appId: appId);  }

  Future<BookletModel> get(String id) {
    return BookletCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<BookletModel>> listen(BookletModelTrigger trigger, { String orderBy, bool descending }) {
    var stream = (orderBy == null ?  BookletCollection : BookletCollection.orderBy(orderBy, descending: descending)).snapshots()
        .map((data) {
      Iterable<BookletModel> booklets  = data.documents.map((doc) {
        BookletModel value = _populateDoc(doc);
        return value;
      }).toList();
      return booklets;
    });

    return stream.listen((listOfBookletModels) {
      trigger(listOfBookletModels);
    });
  }

  StreamSubscription<List<BookletModel>> listenWithDetails(BookletModelTrigger trigger) {
    Stream<List<BookletModel>> stream = BookletCollection.snapshots()
        .asyncMap((data) async {
      return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfBookletModels) {
      trigger(listOfBookletModels);
    });
  }


  Stream<List<BookletModel>> values() {
    return BookletCollection.snapshots().map((snapshot) {
      return snapshot.documents
            .map((doc) => _populateDoc(doc)).toList();
    });
  }

  Stream<List<BookletModel>> valuesWithDetails() {
    return BookletCollection.snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents
          .map((doc) => _populateDocPlus(doc)).toList());
    });
  }

  Future<List<BookletModel>> valuesList() async {
    return await BookletCollection.getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  Future<List<BookletModel>> valuesListWithDetails() async {
    return await BookletCollection.getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {}

  Future<void> deleteAll() {
    return BookletCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference BookletCollection;

  BookletFirestore(this.appId) : BookletCollection = Firestore.instance.collection('Booklet-${appId}');
}

