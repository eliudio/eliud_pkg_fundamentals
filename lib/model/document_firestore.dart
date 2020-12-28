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

import 'package:eliud_pkg_fundamentals/model/document_repository.dart';


import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

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

  StreamSubscription<List<DocumentModel>> listen(DocumentModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
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

  StreamSubscription<List<DocumentModel>> listenWithDetails(DocumentModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel}) {
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

  @override
  StreamSubscription<DocumentModel> listenTo(String documentId, DocumentChanged changed) {
    var stream = DocumentCollection.document(documentId)
        .snapshots()
        .asyncMap((data) {
      return _populateDocPlus(data);
    });
    return stream.listen((value) {
      changed(value);
    });
  }

  Stream<List<DocumentModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<DocumentModel>> _values = getQuery(DocumentCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, appId: appId).snapshots().map((snapshot) {
      return snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();});
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Stream<List<DocumentModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) {
    DocumentSnapshot lastDoc;
    Stream<List<DocumentModel>> _values = getQuery(DocumentCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter, limit: limit, privilegeLevel: privilegeLevel, appId: appId).snapshots().asyncMap((snapshot) {
      return Future.wait(snapshot.documents.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<DocumentModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<DocumentModel> _values = await getQuery(DocumentCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId).getDocuments().then((value) {
      var list = value.documents;
      return list.map((doc) { 
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList();
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return _values;
  }

  Future<List<DocumentModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel }) async {
    DocumentSnapshot lastDoc;
    List<DocumentModel> _values = await getQuery(DocumentCollection, currentMember: currentMember, orderBy: orderBy,  descending: descending,  startAfter: startAfter,  limit: limit, privilegeLevel: privilegeLevel, appId: appId).getDocuments().then((value) {
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
    return DocumentCollection.getDocuments().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
  }

  dynamic getSubCollection(String documentId, String name) {
    return DocumentCollection.document(documentId).collection(name);
  }

  String timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  } 

  final String appId;
  DocumentFirestore(this.DocumentCollection, this.appId);

  final CollectionReference DocumentCollection;
}

