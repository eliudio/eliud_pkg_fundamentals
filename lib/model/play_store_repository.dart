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

import 'package:eliud_pkg_fundamentals/model/play_store_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef PlayStoreModelTrigger(List<PlayStoreModel> list);

abstract class PlayStoreRepository {
  Future<PlayStoreModel> add(PlayStoreModel value);
  Future<void> delete(PlayStoreModel value);
  Future<PlayStoreModel> get(String id);
  Future<PlayStoreModel> update(PlayStoreModel value);

  Stream<List<PlayStoreModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});
  Stream<List<PlayStoreModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});
  Future<List<PlayStoreModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});
  Future<List<PlayStoreModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel});

  StreamSubscription<List<PlayStoreModel>> listen(PlayStoreModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel});
  StreamSubscription<List<PlayStoreModel>> listenWithDetails(PlayStoreModelTrigger trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel});
  void flush();

  Future<void> deleteAll();
}


