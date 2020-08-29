/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'section_model.dart';
import 'section_repository.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

class SectionCache implements SectionRepository {

  final SectionRepository reference;
  final Map<String, SectionModel> fullCache = Map();

  SectionCache(this.reference);

  Future<SectionModel> add(SectionModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(SectionModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<SectionModel> get(String id){
    SectionModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<SectionModel> update(SectionModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<SectionModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<SectionModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<SectionModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<SectionModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<SectionModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<SectionModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<SectionModel> refreshRelations(SectionModel model) async {

    ImageModel imageHolder;
    if (model.image != null) {
      try {
        await imageRepository().get(model.image.documentID).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<LinkModel> linksHolder = List<LinkModel>.from(await Future.wait(await model.links.map((element) async {
      return await LinkCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        image: imageHolder,

        links: linksHolder,


    );
  }

}

