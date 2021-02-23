/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/common_tools.dart';

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


import 'package:eliud_pkg_fundamentals/model/photo_and_text_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum PhotoAndTextImagePosition {
  LeftIfSpaceAvailableOtherwiseTop, LeftIfSpaceAvailableOtherwiseDrop, LeftIfSpaceAvailableOtherwiseBottom, RightIfSpaceAvailableOtherwiseTop, RightIfSpaceAvailableOtherwiseDrop, RightIfSpaceAvailableOtherwiseBottom, Unknown
}


PhotoAndTextImagePosition toPhotoAndTextImagePosition(int index) {
  switch (index) {
    case 0: return PhotoAndTextImagePosition.LeftIfSpaceAvailableOtherwiseTop;
    case 1: return PhotoAndTextImagePosition.LeftIfSpaceAvailableOtherwiseDrop;
    case 2: return PhotoAndTextImagePosition.LeftIfSpaceAvailableOtherwiseBottom;
    case 3: return PhotoAndTextImagePosition.RightIfSpaceAvailableOtherwiseTop;
    case 4: return PhotoAndTextImagePosition.RightIfSpaceAvailableOtherwiseDrop;
    case 5: return PhotoAndTextImagePosition.RightIfSpaceAvailableOtherwiseBottom;
  }
  return PhotoAndTextImagePosition.Unknown;
}


class PhotoAndTextModel {
  String documentID;
  String appId;
  String name;
  String title;
  String contents;
  MemberMediumModel image;
  PhotoAndTextImagePosition imagePosition;
  double percentageImageVisible;
  ConditionsSimpleModel conditions;

  PhotoAndTextModel({this.documentID, this.appId, this.name, this.title, this.contents, this.image, this.imagePosition, this.percentageImageVisible, this.conditions, })  {
    assert(documentID != null);
  }

  PhotoAndTextModel copyWith({String documentID, String appId, String name, String title, String contents, MemberMediumModel image, PhotoAndTextImagePosition imagePosition, double percentageImageVisible, ConditionsSimpleModel conditions, }) {
    return PhotoAndTextModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, title: title ?? this.title, contents: contents ?? this.contents, image: image ?? this.image, imagePosition: imagePosition ?? this.imagePosition, percentageImageVisible: percentageImageVisible ?? this.percentageImageVisible, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ title.hashCode ^ contents.hashCode ^ image.hashCode ^ imagePosition.hashCode ^ percentageImageVisible.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PhotoAndTextModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          title == other.title &&
          contents == other.contents &&
          image == other.image &&
          imagePosition == other.imagePosition &&
          percentageImageVisible == other.percentageImageVisible &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'PhotoAndTextModel{documentID: $documentID, appId: $appId, name: $name, title: $title, contents: $contents, image: $image, imagePosition: $imagePosition, percentageImageVisible: $percentageImageVisible, conditions: $conditions}';
  }

  PhotoAndTextEntity toEntity({String appId}) {
    return PhotoAndTextEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          title: (title != null) ? title : null, 
          contents: (contents != null) ? contents : null, 
          imageId: (image != null) ? image.documentID : null, 
          imagePosition: (imagePosition != null) ? imagePosition.index : null, 
          percentageImageVisible: (percentageImageVisible != null) ? percentageImageVisible : null, 
          conditions: (conditions != null) ? conditions.toEntity(appId: appId) : null, 
    );
  }

  static PhotoAndTextModel fromEntity(String documentID, PhotoAndTextEntity entity) {
    if (entity == null) return null;
    return PhotoAndTextModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          title: entity.title, 
          contents: entity.contents, 
          imagePosition: toPhotoAndTextImagePosition(entity.imagePosition), 
          percentageImageVisible: entity.percentageImageVisible, 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<PhotoAndTextModel> fromEntityPlus(String documentID, PhotoAndTextEntity entity, { String appId}) async {
    if (entity == null) return null;

    MemberMediumModel imageHolder;
    if (entity.imageId != null) {
      try {
        await memberMediumRepository(appId: appId).get(entity.imageId).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return PhotoAndTextModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          title: entity.title, 
          contents: entity.contents, 
          image: imageHolder, 
          imagePosition: toPhotoAndTextImagePosition(entity.imagePosition), 
          percentageImageVisible: entity.percentageImageVisible, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

