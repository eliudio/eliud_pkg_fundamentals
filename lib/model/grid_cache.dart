/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/grid_model.dart';
import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';
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

class GridCache implements GridRepository {

  final GridRepository reference;
  final Map<String, GridModel> fullCache = Map();

  GridCache(this.reference);

  Future<GridModel> add(GridModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(GridModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<GridModel> get(String id){
    GridModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<GridModel> update(GridModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<GridModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<GridModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<GridModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<GridModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<GridModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<GridModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<GridModel> refreshRelations(GridModel model) async {

    GridViewModel gridViewHolder;
    if (model.gridView != null) {
      try {
        await gridViewRepository(appID: model.appId).get(model.gridView.documentID).then((val) {
          gridViewHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<BodyComponentModel> bodyComponentsHolder = List<BodyComponentModel>.from(await Future.wait(await model.bodyComponents.map((element) async {
      return await BodyComponentCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        gridView: gridViewHolder,

        bodyComponents: bodyComponentsHolder,


    );
  }

}

