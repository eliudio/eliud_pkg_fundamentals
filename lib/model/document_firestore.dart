/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_pkg_fundamentals/model/document_repository.dart';

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


class DocumentFirestore implements DocumentRepository {
  Future<DocumentModel> add(DocumentModel value) {
    return DocumentCollection.document(value.documentID).setData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  Future<void> delete(DocumentModel value) {
    return DocumentCollection.document(value.documentID).delete();
  }

  Future<DocumentModel> update(DocumentModel value) {
    return DocumentCollection.document(value.documentID).updateData(value.toEntity(appId: appId).toDocument()).then((_) => value);
  }

  DocumentModel _populateDoc(DocumentSnapshot value) {
    return DocumentModel.fromEntity(value.documentID, DocumentEntity.fromMap(value.data));
  }

  Future<DocumentModel> _populateDocPlus(DocumentSnapshot value) async {
    return DocumentModel.fromEntityPlus(value.documentID, DocumentEntity.fromMap(value.data), appId: appId);  }

  Future<DocumentModel> get(String id) {
    return DocumentCollection.document(id).get().then((doc) {
      if (doc.data != null)
        return _populateDocPlus(doc);
      else
        return null;
    });
  }

  StreamSubscription<List<DocumentModel>> listen(DocumentModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<DocumentModel>> stream;
    if (orderBy == null) {
       stream = DocumentCollection.snapshots().map((data) {
        Iterable<DocumentModel> documents  = data.documents.map((doc) {
          DocumentModel value = _populateDoc(doc);
          return value;
        }).toList();
        return documents;
      });
    } else {
      stream = DocumentCollection.orderBy(orderBy, descending: descending).snapshots().map((data) {
        Iterable<DocumentModel> documents  = data.documents.map((doc) {
          DocumentModel value = _populateDoc(doc);
          return value;
        }).toList();
        return documents;
      });
  
    }
    return stream.listen((listOfDocumentModels) {
      trigger(listOfDocumentModels);
    });
  }

  StreamSubscription<List<DocumentModel>> listenWithDetails(DocumentModelTrigger trigger, { String orderBy, bool descending }) {
    Stream<List<DocumentModel>> stream;
    if (orderBy == null) {
      stream = DocumentCollection.snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      stream = DocumentCollection.orderBy(orderBy, descending: descending).snapshots()
          .asyncMap((data) async {
        return await Future.wait(data.documents.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }

    return stream.listen((listOfDocumentModels) {
      trigger(listOfDocumentModels);
    });
  }


  Stream<List<DocumentModel>> values({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return DocumentCollection.snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return DocumentCollection.orderBy(orderBy, descending: descending).snapshots().map((snapshot) {
        return snapshot.documents
              .map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Stream<List<DocumentModel>> valuesWithDetails({ String orderBy, bool descending }) {
    if (orderBy == null) {
      return DocumentCollection.snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    } else {
      return DocumentCollection.orderBy(orderBy, descending: descending).snapshots().asyncMap((snapshot) {
        return Future.wait(snapshot.documents
            .map((doc) => _populateDocPlus(doc)).toList());
      });
    }
  }

  Future<List<DocumentModel>> valuesList({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await DocumentCollection.getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    } else {
      return await DocumentCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return list.map((doc) => _populateDoc(doc)).toList();
      });
    }
  }

  Future<List<DocumentModel>> valuesListWithDetails({ String orderBy, bool descending }) async {
    if (orderBy == null) {
      return await DocumentCollection.getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    } else {
      return await DocumentCollection.orderBy(orderBy, descending: descending).getDocuments().then((value) {
        var list = value.documents;
        return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
      });
    }
  }

  void flush() {}

  Future<void> deleteAll() {
    return DocumentCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }});
  }


  final String appId;
  final CollectionReference DocumentCollection;

  DocumentFirestore(this.appId) : DocumentCollection = Firestore.instance.collection('Document-${appId}');
}

