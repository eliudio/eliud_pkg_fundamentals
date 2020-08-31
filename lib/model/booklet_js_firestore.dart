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
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'booklet_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


class BookletJsFirestore implements BookletRepository {
  Future<BookletModel> add(BookletModel value) {
    return bookletCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(BookletModel value) {
    return bookletCollection.doc(value.documentID).delete();
  }

  Future<BookletModel> update(BookletModel value) {
    return bookletCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  BookletModel _populateDoc(DocumentSnapshot doc) {
    return BookletModel.fromEntity(doc.id, BookletEntity.fromMap(doc.data()));
  }

  Future<BookletModel> _populateDocPlus(DocumentSnapshot doc) async {
    return BookletModel.fromEntityPlus(doc.id, BookletEntity.fromMap(doc.data()));
  }

  Future<BookletModel> get(String id) {
    return bookletCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<BookletModel>> listen(BookletModelTrigger trigger) {
    // If we use bookletCollection here, then the second subscription fails
    Stream<List<BookletModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<BookletModel> booklets  = data.docs.map((doc) {
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
    // If we use bookletCollection here, then the second subscription fails
    Stream<List<BookletModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfBookletModels) {
      trigger(listOfBookletModels);
    });
  }

  Stream<List<BookletModel>> values() {
    return bookletCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<BookletModel>> valuesWithDetails() {
    return bookletCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<BookletModel>> valuesList() {
    return bookletCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<BookletModel>> valuesListWithDetails() {
    return bookletCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return bookletCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => bookletCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Booklet-$appID');

  final String appID;
  
  BookletJsFirestore(this.appID) : bookletCollection = firestore().collection('Booklet-$appID');

  final CollectionReference bookletCollection;
}
