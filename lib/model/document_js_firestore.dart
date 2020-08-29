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


class DocumentJsFirestore implements DocumentRepository {
  Future<DocumentModel> add(DocumentModel value) {
    return documentCollection.doc(value.documentID)
        .set(value.toEntity().toDocument())
        .then((_) => value);
  }

  Future<void> delete(DocumentModel value) {
    return documentCollection.doc(value.documentID).delete();
  }

  Future<DocumentModel> update(DocumentModel value) {
    return documentCollection.doc(value.documentID)
        .update(data: value.toEntity().toDocument())
        .then((_) => value);
  }

  DocumentModel _populateDoc(DocumentSnapshot doc) {
    return DocumentModel.fromEntity(doc.id, DocumentEntity.fromMap(doc.data()));
  }

  Future<DocumentModel> _populateDocPlus(DocumentSnapshot doc) async {
    return DocumentModel.fromEntityPlus(doc.id, DocumentEntity.fromMap(doc.data()));
  }

  Future<DocumentModel> get(String id) {
    return documentCollection.doc(id).get().then((data) {
      if (data.data() != null) {
        return _populateDocPlus(data);
      } else {
        return null;
      }
    });
  }

  StreamSubscription<List<DocumentModel>> listen(DocumentModelTrigger trigger) {
    // If we use documentCollection here, then the second subscription fails
    Stream<List<DocumentModel>> stream = getCollection().onSnapshot
        .map((data) {
      Iterable<DocumentModel> documents  = data.docs.map((doc) {
        DocumentModel value = _populateDoc(doc);
        return value;
      }).toList();
      return documents;
    });

    return stream.listen((listOfDocumentModels) {
      trigger(listOfDocumentModels);
    });
  }

  StreamSubscription<List<DocumentModel>> listenWithDetails(DocumentModelTrigger trigger) {
    // If we use documentCollection here, then the second subscription fails
    Stream<List<DocumentModel>> stream = getCollection().onSnapshot
        .asyncMap((data) async {
      return await Future.wait(data.docs.map((doc) =>  _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfDocumentModels) {
      trigger(listOfDocumentModels);
    });
  }

  Stream<List<DocumentModel>> values() {
    return documentCollection.onSnapshot
        .map((data) => data.docs.map((doc) => _populateDoc(doc)).toList());
  }

  Stream<List<DocumentModel>> valuesWithDetails() {
    return documentCollection.onSnapshot
        .asyncMap((data) => Future.wait(data.docs.map((doc) => _populateDocPlus(doc)).toList()));
  }

  @override
  Future<List<DocumentModel>> valuesList() {
    return documentCollection.get().then((value) {
      var list = value.docs;
      return list.map((doc) => _populateDoc(doc)).toList();
    });
  }

  @override
  Future<List<DocumentModel>> valuesListWithDetails() {
    return documentCollection.get().then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) =>  _populateDocPlus(doc)).toList());
    });
  }

  void flush() {
  }
  
  Future<void> deleteAll() {
    return documentCollection.get().then((snapshot) => snapshot.docs
        .forEach((element) => documentCollection.doc(element.id).delete()));
  }
  CollectionReference getCollection() => firestore().collection('Document-$appID');

  final String appID;
  
  DocumentJsFirestore(this.appID) : documentCollection = firestore().collection('Document-$appID');

  final CollectionReference documentCollection;
}
