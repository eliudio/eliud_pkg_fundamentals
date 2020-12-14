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
import 'package:eliud_pkg_fundamentals/model/listed_item_repository.dart';
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

class ListedItemCache implements ListedItemRepository {

  final ListedItemRepository reference;
  final Map<String, ListedItemModel> fullCache = Map();

  ListedItemCache(this.reference);

  Future<ListedItemModel> add(ListedItemModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(ListedItemModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<ListedItemModel> get(String id){
    ListedItemModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<ListedItemModel> update(ListedItemModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<ListedItemModel>> values({String orderBy, bool descending }) {
    return reference.values();
  }

  @override
  Stream<List<ListedItemModel>> valuesWithDetails({String orderBy, bool descending }) {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<ListedItemModel>> valuesList({String orderBy, bool descending }) async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<ListedItemModel>> valuesListWithDetails({String orderBy, bool descending }) async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<ListedItemModel>> listen(trigger, { String orderBy, bool descending }) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending);
  }

  @override
  StreamSubscription<List<ListedItemModel>> listenWithDetails(trigger, {String orderBy, bool descending }) {
    return reference.listenWithDetails(trigger);
  }


  static Future<ListedItemModel> refreshRelations(ListedItemModel model) async {

    ImageModel imageHolder;
    if (model.image != null) {
      try {
        await imageRepository().get(model.image.documentID).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    PosSizeModel posSizeHolder;
    if (model.posSize != null) {
      try {
        await posSizeRepository(appId: model.posSize.appId).get(model.posSize.documentID).then((val) {
          posSizeHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        image: imageHolder,

        posSize: posSizeHolder,


    );
  }

}

