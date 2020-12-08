/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';

typedef DocumentItemModelTrigger(List<DocumentItemModel> list);

abstract class DocumentItemRepository {
  Future<DocumentItemModel> add(DocumentItemModel value);
  Future<void> delete(DocumentItemModel value);
  Future<DocumentItemModel> get(String id);
  Future<DocumentItemModel> update(DocumentItemModel value);
  Stream<List<DocumentItemModel>> values();
  Stream<List<DocumentItemModel>> valuesWithDetails();
  StreamSubscription<List<DocumentItemModel>> listen(DocumentItemModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<DocumentItemModel>> listenWithDetails(DocumentItemModelTrigger trigger);
  void flush();
  Future<List<DocumentItemModel>> valuesList();
  Future<List<DocumentItemModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


