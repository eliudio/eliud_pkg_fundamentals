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
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_model.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_repository.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_pkg_fundamentals/model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class PlayStoreCache implements PlayStoreRepository {

  final PlayStoreRepository reference;
  final Map<String, PlayStoreModel> fullCache = Map();

  PlayStoreCache(this.reference);

  Future<PlayStoreModel> add(PlayStoreModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(PlayStoreModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<PlayStoreModel> get(String id){
    PlayStoreModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<PlayStoreModel> update(PlayStoreModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<PlayStoreModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    return reference.values(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  @override
  Stream<List<PlayStoreModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) {
    return reference.valuesWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  @override
  Future<List<PlayStoreModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel }) async {
    return await reference.valuesList(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }
  
  @override
  Future<List<PlayStoreModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, bool isLoggedIn, int privilegeLevel}) async {
    return await reference.valuesListWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<PlayStoreModel>> listen(trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    return reference.listen(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }

  @override
  StreamSubscription<List<PlayStoreModel>> listenWithDetails(trigger, {String currentMember, String orderBy, bool descending, bool isLoggedIn, int privilegeLevel}) {
    return reference.listenWithDetails(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, isLoggedIn: isLoggedIn, privilegeLevel: privilegeLevel);
  }


  static Future<PlayStoreModel> refreshRelations(PlayStoreModel model) async {

    BackgroundModel itemBackgroundHolder;
    if (model.itemBackground != null) {
      try {
        await backgroundRepository(appId: model.itemBackground.appId).get(model.itemBackground.documentID).then((val) {
          itemBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        itemBackground: itemBackgroundHolder,


    );
  }

}

