/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_pkg_fundamentals/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class TutorialCache implements TutorialRepository {

  final TutorialRepository reference;
  final Map<String, TutorialModel> fullCache = Map();

  TutorialCache(this.reference);

  Future<TutorialModel> add(TutorialModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(TutorialModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<TutorialModel> get(String id){
    TutorialModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<TutorialModel> update(TutorialModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<TutorialModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<TutorialModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<TutorialModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<TutorialModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<TutorialModel>> listen(trigger, { String orderBy, bool descending }) {
    return reference.listen(trigger, orderBy: orderBy, descending: descending);
  }

  @override
  StreamSubscription<List<TutorialModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<TutorialModel> refreshRelations(TutorialModel model) async {

    List<TutorialEntryModel> tutorialEntriesHolder = List<TutorialEntryModel>.from(await Future.wait(await model.tutorialEntries.map((element) async {
      return await TutorialEntryCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        tutorialEntries: tutorialEntriesHolder,


    );
  }

}

