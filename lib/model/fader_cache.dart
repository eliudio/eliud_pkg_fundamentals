/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_pkg_fundamentals/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class FaderCache implements FaderRepository {

  final FaderRepository reference;
  final Map<String, FaderModel> fullCache = Map();

  FaderCache(this.reference);

  Future<FaderModel> add(FaderModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(FaderModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<FaderModel> get(String id){
    FaderModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<FaderModel> update(FaderModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<FaderModel>> values({String orderBy, bool descending }) {
    return reference.values();
  }

  @override
  Stream<List<FaderModel>> valuesWithDetails({String orderBy, bool descending }) {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<FaderModel>> valuesList({String orderBy, bool descending }) async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<FaderModel>> valuesListWithDetails({String orderBy, bool descending }) async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<FaderModel>> listen(trigger, { String orderBy, bool descending }) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending);
  }

  @override
  StreamSubscription<List<FaderModel>> listenWithDetails(trigger, {String orderBy, bool descending }) {
    return reference.listenWithDetails(trigger);
  }


  static Future<FaderModel> refreshRelations(FaderModel model) async {

    List<ListedItemModel> itemsHolder = List<ListedItemModel>.from(await Future.wait(await model.items.map((element) async {
      return await ListedItemCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        items: itemsHolder,


    );
  }

}

