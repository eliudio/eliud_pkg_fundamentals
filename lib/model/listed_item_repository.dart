/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'listed_item_model.dart';

typedef ListedItemModelTrigger(List<ListedItemModel> list);

abstract class ListedItemRepository {
  Future<ListedItemModel> add(ListedItemModel value);
  Future<void> delete(ListedItemModel value);
  Future<ListedItemModel> get(String id);
  Future<ListedItemModel> update(ListedItemModel value);
  Stream<List<ListedItemModel>> values();
  Stream<List<ListedItemModel>> valuesWithDetails();
  StreamSubscription<List<ListedItemModel>> listen(ListedItemModelTrigger trigger);
StreamSubscription<List<ListedItemModel>> listenWithDetails(ListedItemModelTrigger trigger);
  void flush();
  Future<List<ListedItemModel>> valuesList();
  Future<List<ListedItemModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


