/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'presentation_model.dart';
import 'presentation_repository.dart';
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

class PresentationCache implements PresentationRepository {

  final PresentationRepository reference;
  final Map<String, PresentationModel> fullCache = Map();

  PresentationCache(this.reference);

  Future<PresentationModel> add(PresentationModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(PresentationModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<PresentationModel> get(String id){
    PresentationModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<PresentationModel> update(PresentationModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<PresentationModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<PresentationModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<PresentationModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<PresentationModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<PresentationModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<PresentationModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<PresentationModel> refreshRelations(PresentationModel model) async {

    ImageModel imageHolder;
    if (model.image != null) {
      try {
        await imageRepository().get(model.image.documentID).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<BodyComponentModel> bodyComponentsHolder = List<BodyComponentModel>.from(await Future.wait(await model.bodyComponents.map((element) async {
      return await BodyComponentCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        image: imageHolder,

        bodyComponents: bodyComponentsHolder,


    );
  }

}

