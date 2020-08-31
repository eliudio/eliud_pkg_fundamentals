/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'tutorial_entry_model.dart';
import 'tutorial_entry_repository.dart';
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

class TutorialEntryCache implements TutorialEntryRepository {

  final TutorialEntryRepository reference;
  final Map<String, TutorialEntryModel> fullCache = Map();

  TutorialEntryCache(this.reference);

  Future<TutorialEntryModel> add(TutorialEntryModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(TutorialEntryModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<TutorialEntryModel> get(String id){
    TutorialEntryModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<TutorialEntryModel> update(TutorialEntryModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<TutorialEntryModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<TutorialEntryModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<TutorialEntryModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<TutorialEntryModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<TutorialEntryModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<TutorialEntryModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<TutorialEntryModel> refreshRelations(TutorialEntryModel model) async {

    ImageModel imageHolder;
    if (model.image != null) {
      try {
        await imageRepository().get(model.image.documentID).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
        image: imageHolder,


    );
  }

}

