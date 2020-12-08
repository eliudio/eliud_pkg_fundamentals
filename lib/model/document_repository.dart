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
import 'package:eliud_pkg_fundamentals/model/document_model.dart';

typedef DocumentModelTrigger(List<DocumentModel> list);

abstract class DocumentRepository {
  Future<DocumentModel> add(DocumentModel value);
  Future<void> delete(DocumentModel value);
  Future<DocumentModel> get(String id);
  Future<DocumentModel> update(DocumentModel value);
  Stream<List<DocumentModel>> values();
  Stream<List<DocumentModel>> valuesWithDetails();  Future<List<DocumentModel>> valuesList();
  Future<List<DocumentModel>> valuesListWithDetails();
  StreamSubscription<List<DocumentModel>> listen(DocumentModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<DocumentModel>> listenWithDetails(DocumentModelTrigger trigger);
  void flush();

  Future<void> deleteAll();
}


