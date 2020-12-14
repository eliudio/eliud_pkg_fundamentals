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
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';

typedef ListedItemModelTrigger(List<ListedItemModel> list);

abstract class ListedItemRepository {
  Future<ListedItemModel> add(ListedItemModel value);
  Future<void> delete(ListedItemModel value);
  Future<ListedItemModel> get(String id);
  Future<ListedItemModel> update(ListedItemModel value);
  Stream<List<ListedItemModel>> values({String orderBy, bool descending });
  Stream<List<ListedItemModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<ListedItemModel>> valuesList({String orderBy, bool descending });
  Future<List<ListedItemModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<ListedItemModel>> listen(ListedItemModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<ListedItemModel>> listenWithDetails(ListedItemModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


