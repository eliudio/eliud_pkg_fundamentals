/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/play_store_model.dart';

typedef PlayStoreModelTrigger(List<PlayStoreModel> list);

abstract class PlayStoreRepository {
  Future<PlayStoreModel> add(PlayStoreModel value);
  Future<void> delete(PlayStoreModel value);
  Future<PlayStoreModel> get(String id);
  Future<PlayStoreModel> update(PlayStoreModel value);
  Stream<List<PlayStoreModel>> values();
  Stream<List<PlayStoreModel>> valuesWithDetails();
  StreamSubscription<List<PlayStoreModel>> listen(PlayStoreModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<PlayStoreModel>> listenWithDetails(PlayStoreModelTrigger trigger);
  void flush();
  Future<List<PlayStoreModel>> valuesList();
  Future<List<PlayStoreModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


