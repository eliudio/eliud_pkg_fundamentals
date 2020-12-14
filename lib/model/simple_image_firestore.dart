/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/simple_image_repository.dart';

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


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

class SimpleImageFirestore implements SimpleImageRepository {
  Future<SimpleImageModel> add(SimpleImageModel value) {
    return SimpleImageCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(SimpleImageModel value) {
    return SimpleImageCollection.document(value.documentID).delete();
  }

  Future<SimpleImageModel> update(SimpleImageModel value) {
    return SimpleImageCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  SimpleImageModel _populateDoc(DocumentSnapshot value) {
    return SimpleImageModel.fromEntity(value.documentID, SimpleImageEntity.fromMap(value.data));
  }

  Future<SimpleImageModel> _populateDocPlus(DocumentSnapshot value) async {
    return SimpleImageModel.fromEntityPlus(value.documentID, SimpleImageEntity.fromMap(value.data), appId: appId);  }

  Future<SimpleImageModel> get(String id) {
    return SimpleImageCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<SimpleImageModel>> listen(SimpleImageModelTrigger trigger, {String currentMember, String orderBy, bool descending}) {
    Stream<List<SimpleImageModel>> stream;
    if (orderBy == null) {
       stream = SimpleImageCollection.snapshots().map((data) {
        Iterable<SimpleImageModel> simpleImages  = data.documents.map((doc) {
          SimpleImageModel value = _populateDoc(doc);
          return value;
        }).toList();
        return simpleImages;
      });
    } else {
      stream = SimpleImageCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<SimpleImageModel> simpleImages  = data.documents.map((doc) {
          SimpleImageModel value = _populateDoc(doc);
          return value;
        }).toList();
        return simpleImages;
      });
  
    }
    return stream.listen((listOfSimpleImageModels) {
      trigger(listOfSimpleImageModels);
    });
  }

  StreamSubscription<List<SimpleImageModel>> listenWithDetails(SimpleImageModelTrigger trigger, {String currentMember, String orderBy, bool descending}) {
    Stream<List<SimpleImageModel>> stream;
    if (orderBy == null) {
      stream = SimpleImageCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = SimpleImageCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfSimpleImageModels) {
      trigger(listOfSimpleImageModels);
    });
  }


  Stream<List<SimpleImageModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    DocumentSnapshot lastDoc;
    Stream<List<SimpleImageModel>> _values = getQuery(SimpleImageCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<SimpleImageModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) {
    DocumentSnapshot lastDoc;
    Stream<List<SimpleImageModel>> _values = getQuery(SimpleImageCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<SimpleImageModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    DocumentSnapshot lastDoc;
    List<SimpleImageModel> _values = await getQuery(SimpleImageCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<SimpleImageModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc }) async {
    DocumentSnapshot lastDoc;
    List<SimpleImageModel> _values = await getQuery(SimpleImageCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit).getDocuments().then((value) {
      var list = value.documents;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  void flush() {}

  Future<void> deleteAll() {
    return SimpleImageCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }


  final String appId;
  final CollectionReference SimpleImageCollection;

  SimpleImageFirestore(this.appId) : SimpleImageCollection = Firestore.instance.collection('SimpleImage-${appId}');
}

