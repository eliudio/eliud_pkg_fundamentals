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

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'package:eliud_pkg_fundamentals/model/simple_image_entity.dart';

import 'package:eliud_core/tools/random.dart';



class SimpleImageModel {
  String documentID;
  String appId;
  String title;
  ImageModel image;

  SimpleImageModel({this.documentID, this.appId, this.title, this.image, })  {
    assert(documentID != null);
  }

  SimpleImageModel copyWith({String documentID, String appId, String title, ImageModel image, }) {
    return SimpleImageModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, image: image ?? this.image, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ image.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is SimpleImageModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          image == other.image;

  @override
  String toString() {
    return 'SimpleImageModel{documentID: $documentID, appId: $appId, title: $title, image: $image}';
  }

  SimpleImageEntity toEntity(String appId) {
    return SimpleImageEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          imageId: (image != null) ? image.documentID : null, 
    );
  }

  static SimpleImageModel fromEntity(String documentID, SimpleImageEntity entity) {
    if (entity == null) return null;
    return SimpleImageModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
    );
  }

  static Future<SimpleImageModel> fromEntityPlus(String documentID, SimpleImageEntity entity) async {
    if (entity == null) return null;

    ImageModel imageHolder;
    if (entity.imageId != null) {
      try {
        await imageRepository(appID: entity.appId).get(entity.imageId).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return SimpleImageModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          image: imageHolder, 
    );
  }

}

