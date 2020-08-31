/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'simple_image_model.dart';
import 'simple_image_repository.dart';
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

class SimpleImageCache implements SimpleImageRepository {

  final SimpleImageRepository reference;
  final Map<String, SimpleImageModel> fullCache = Map();

  SimpleImageCache(this.reference);

  Future<SimpleImageModel> add(SimpleImageModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(SimpleImageModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<SimpleImageModel> get(String id){
    SimpleImageModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<SimpleImageModel> update(SimpleImageModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<SimpleImageModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<SimpleImageModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<SimpleImageModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<SimpleImageModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<SimpleImageModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<SimpleImageModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<SimpleImageModel> refreshRelations(SimpleImageModel model) async {

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

