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



class SimpleImageModel {
  String? documentID;
  String? appId;
  String? title;
  MemberMediumModel? image;
  ConditionsSimpleModel? conditions;

  SimpleImageModel({this.documentID, this.appId, this.title, this.image, this.conditions, })  {
    assert(documentID != null);
  }

  SimpleImageModel copyWith({String? documentID, String? appId, String? title, MemberMediumModel? image, ConditionsSimpleModel? conditions, }) {
    return SimpleImageModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, image: image ?? this.image, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ image.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is SimpleImageModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          image == other.image &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'SimpleImageModel{documentID: $documentID, appId: $appId, title: $title, image: $image, conditions: $conditions}';
  }

  SimpleImageEntity toEntity({String? appId}) {
    return SimpleImageEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          imageId: (image != null) ? image!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static SimpleImageModel? fromEntity(String documentID, SimpleImageEntity? entity) {
    if (entity == null) return null;
    var counter = 0;
    return SimpleImageModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<SimpleImageModel?> fromEntityPlus(String documentID, SimpleImageEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    MemberMediumModel? imageHolder;
    if (entity.imageId != null) {
      try {
          imageHolder = await memberMediumRepository(appId: appId)!.get(entity.imageId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise image');
        print('Error whilst retrieving memberMedium with id ${entity.imageId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return SimpleImageModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          image: imageHolder, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

