/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/link_model.dart';
import 'package:eliud_pkg_fundamentals/model/link_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_pkg_fundamentals/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class LinkCache implements LinkRepository {

  final LinkRepository reference;
  final Map<String, LinkModel> fullCache = Map();

  LinkCache(this.reference);

  Future<LinkModel> add(LinkModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(LinkModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<LinkModel> get(String id){
    LinkModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<LinkModel> update(LinkModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<LinkModel>> values({String orderBy, bool descending }) {
    return reference.values();
  }

  @override
  Stream<List<LinkModel>> valuesWithDetails({String orderBy, bool descending }) {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<LinkModel>> valuesList({String orderBy, bool descending }) async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<LinkModel>> valuesListWithDetails({String orderBy, bool descending }) async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<LinkModel>> listen(trigger, { String orderBy, bool descending }) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending);
  }

  @override
  StreamSubscription<List<LinkModel>> listenWithDetails(trigger, {String orderBy, bool descending }) {
    return reference.listenWithDetails(trigger);
  }


  static Future<LinkModel> refreshRelations(LinkModel model) async {

    return model.copyWith(

    );
  }

}

