/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'divider_model.dart';
import 'divider_repository.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';

class DividerCache implements DividerRepository {

  final DividerRepository reference;
  final Map<String, DividerModel> fullCache = Map();

  DividerCache(this.reference);

  Future<DividerModel> add(DividerModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(DividerModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<DividerModel> get(String id){
    DividerModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<DividerModel> update(DividerModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<DividerModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<DividerModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<DividerModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<DividerModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<DividerModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<DividerModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<DividerModel> refreshRelations(DividerModel model) async {

    return model.copyWith(

    );
  }

}

