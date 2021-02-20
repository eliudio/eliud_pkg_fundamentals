/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_model.dart
                       
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


import 'package:eliud_pkg_fundamentals/model/listed_item_entity.dart';

import 'package:eliud_core/tools/random.dart';



class ListedItemModel {
  String documentID;
  String description;
  ActionModel action;
  MemberMediumModel image;
  PosSizeModel posSize;

  ListedItemModel({this.documentID, this.description, this.action, this.image, this.posSize, })  {
    assert(documentID != null);
  }

  ListedItemModel copyWith({String documentID, String description, ActionModel action, MemberMediumModel image, PosSizeModel posSize, }) {
    return ListedItemModel(documentID: documentID ?? this.documentID, description: description ?? this.description, action: action ?? this.action, image: image ?? this.image, posSize: posSize ?? this.posSize, );
  }

  @override
  int get hashCode => documentID.hashCode ^ description.hashCode ^ action.hashCode ^ image.hashCode ^ posSize.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is ListedItemModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          description == other.description &&
          action == other.action &&
          image == other.image &&
          posSize == other.posSize;

  @override
  String toString() {
    return 'ListedItemModel{documentID: $documentID, description: $description, action: $action, image: $image, posSize: $posSize}';
  }

  ListedItemEntity toEntity({String appId}) {
    return ListedItemEntity(
          description: (description != null) ? description : null, 
          action: (action != null) ? action.toEntity(appId: appId) : null, 
          imageId: (image != null) ? image.documentID : null, 
          posSizeId: (posSize != null) ? posSize.documentID : null, 
    );
  }

  static ListedItemModel fromEntity(String documentID, ListedItemEntity entity) {
    if (entity == null) return null;
    return ListedItemModel(
          documentID: documentID, 
          description: entity.description, 
          action: 
            ActionModel.fromEntity(entity.action), 
    );
  }

  static Future<ListedItemModel> fromEntityPlus(String documentID, ListedItemEntity entity, { String appId}) async {
    if (entity == null) return null;

    MemberMediumModel imageHolder;
    if (entity.imageId != null) {
      try {
        await memberMediumRepository(appId: appId).get(entity.imageId).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    PosSizeModel posSizeHolder;
    if (entity.posSizeId != null) {
      try {
        await posSizeRepository(appId: appId).get(entity.posSizeId).then((val) {
          posSizeHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return ListedItemModel(
          documentID: documentID, 
          description: entity.description, 
          action: 
            await ActionModel.fromEntityPlus(entity.action, appId: appId), 
          image: imageHolder, 
          posSize: posSizeHolder, 
    );
  }

}

