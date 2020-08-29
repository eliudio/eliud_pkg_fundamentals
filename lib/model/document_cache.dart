/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'document_model.dart';
import 'document_repository.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

class DocumentCache implements DocumentRepository {

  final DocumentRepository reference;
  final Map<String, DocumentModel> fullCache = Map();

  DocumentCache(this.reference);

  Future<DocumentModel> add(DocumentModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(DocumentModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<DocumentModel> get(String id){
    DocumentModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<DocumentModel> update(DocumentModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<DocumentModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<DocumentModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<DocumentModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<DocumentModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<DocumentModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<DocumentModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<DocumentModel> refreshRelations(DocumentModel model) async {

    BackgroundModel backgroundHolder;
    if (model.background != null) {
      try {
        await backgroundRepository().get(model.background.documentID).then((val) {
          backgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<DocumentItemModel> imagesHolder = List<DocumentItemModel>.from(await Future.wait(await model.images.map((element) async {
      return await DocumentItemCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        background: backgroundHolder,

        images: imagesHolder,


    );
  }

}

