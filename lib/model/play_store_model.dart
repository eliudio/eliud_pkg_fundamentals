/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_model.dart
                       
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


import 'package:eliud_pkg_fundamentals/model/play_store_entity.dart';

import 'package:eliud_core/tools/random.dart';



class PlayStoreModel {
  String documentID;
  String appId;
  String description;
  BackgroundModel itemBackground;

  PlayStoreModel({this.documentID, this.appId, this.description, this.itemBackground, })  {
    assert(documentID != null);
  }

  PlayStoreModel copyWith({String documentID, String appId, String description, BackgroundModel itemBackground, }) {
    return PlayStoreModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, itemBackground: itemBackground ?? this.itemBackground, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ itemBackground.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PlayStoreModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          itemBackground == other.itemBackground;

  @override
  String toString() {
    return 'PlayStoreModel{documentID: $documentID, appId: $appId, description: $description, itemBackground: $itemBackground}';
  }

  PlayStoreEntity toEntity({String appId}) {
    return PlayStoreEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          itemBackgroundId: (itemBackground != null) ? itemBackground.documentID : null, 
    );
  }

  static PlayStoreModel fromEntity(String documentID, PlayStoreEntity entity) {
    if (entity == null) return null;
    return PlayStoreModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
    );
  }

  static Future<PlayStoreModel> fromEntityPlus(String documentID, PlayStoreEntity entity, { String appId}) async {
    if (entity == null) return null;

    BackgroundModel itemBackgroundHolder;
    if (entity.itemBackgroundId != null) {
      try {
        await backgroundRepository(appId: appId).get(entity.itemBackgroundId).then((val) {
          itemBackgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return PlayStoreModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          itemBackground: itemBackgroundHolder, 
    );
  }

}

