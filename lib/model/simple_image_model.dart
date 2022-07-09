/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'package:eliud_pkg_fundamentals/model/simple_image_entity.dart';

import 'package:eliud_core/tools/random.dart';



class SimpleImageModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals';
  static const String id = 'simpleImages';

  String documentID;
  String appId;
  String? description;
  PlatformMediumModel? image;
  StorageConditionsModel? conditions;

  SimpleImageModel({required this.documentID, required this.appId, this.description, this.image, this.conditions, })  {
    assert(documentID != null);
  }

  SimpleImageModel copyWith({String? documentID, String? appId, String? description, PlatformMediumModel? image, StorageConditionsModel? conditions, }) {
    return SimpleImageModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, image: image ?? this.image, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ image.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is SimpleImageModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          image == other.image &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'SimpleImageModel{documentID: $documentID, appId: $appId, description: $description, image: $image, conditions: $conditions}';
  }

  SimpleImageEntity toEntity({String? appId, List<ModelReference>? referencesCollector}) {
    if (referencesCollector != null) {
      if (image != null) referencesCollector.add(ModelReference(PlatformMediumModel.packageName, PlatformMediumModel.id, image!));
    }
    return SimpleImageEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          imageId: (image != null) ? image!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId, referencesCollector: referencesCollector) : null, 
    );
  }

  static Future<SimpleImageModel?> fromEntity(String documentID, SimpleImageEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return SimpleImageModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<SimpleImageModel?> fromEntityPlus(String documentID, SimpleImageEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PlatformMediumModel? imageHolder;
    if (entity.imageId != null) {
      try {
          imageHolder = await platformMediumRepository(appId: appId)!.get(entity.imageId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise image');
        print('Error whilst retrieving platformMedium with id ${entity.imageId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return SimpleImageModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          image: imageHolder, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

