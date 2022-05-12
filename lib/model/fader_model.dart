/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
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


import 'package:eliud_pkg_fundamentals/model/fader_entity.dart';

import 'package:eliud_core/tools/random.dart';



class FaderModel {
  String? documentID;
  String? appId;
  String? description;

  // The duration of the transition between the images
  int? animationMilliseconds;

  // The time to display 1 image
  int? imageSeconds;
  List<ListedItemModel>? items;
  StorageConditionsModel? conditions;

  FaderModel({this.documentID, this.appId, this.description, this.animationMilliseconds, this.imageSeconds, this.items, this.conditions, })  {
    assert(documentID != null);
  }

  FaderModel copyWith({String? documentID, String? appId, String? description, int? animationMilliseconds, int? imageSeconds, List<ListedItemModel>? items, StorageConditionsModel? conditions, }) {
    return FaderModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, animationMilliseconds: animationMilliseconds ?? this.animationMilliseconds, imageSeconds: imageSeconds ?? this.imageSeconds, items: items ?? this.items, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ animationMilliseconds.hashCode ^ imageSeconds.hashCode ^ items.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is FaderModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          animationMilliseconds == other.animationMilliseconds &&
          imageSeconds == other.imageSeconds &&
          ListEquality().equals(items, other.items) &&
          conditions == other.conditions;

  @override
  String toString() {
    String itemsCsv = (items == null) ? '' : items!.join(', ');

    return 'FaderModel{documentID: $documentID, appId: $appId, description: $description, animationMilliseconds: $animationMilliseconds, imageSeconds: $imageSeconds, items: ListedItem[] { $itemsCsv }, conditions: $conditions}';
  }

  FaderEntity toEntity({String? appId}) {
    return FaderEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          animationMilliseconds: (animationMilliseconds != null) ? animationMilliseconds : null, 
          imageSeconds: (imageSeconds != null) ? imageSeconds : null, 
          items: (items != null) ? items
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<FaderModel?> fromEntity(String documentID, FaderEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return FaderModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          animationMilliseconds: entity.animationMilliseconds, 
          imageSeconds: entity.imageSeconds, 
          items: 
            entity.items == null ? null : List<ListedItemModel>.from(await Future.wait(entity. items
            !.map((item) {
            counter++;
              return ListedItemModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<FaderModel?> fromEntityPlus(String documentID, FaderEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return FaderModel(
          documentID: documentID, 
          appId: entity.appId, 
          description: entity.description, 
          animationMilliseconds: entity.animationMilliseconds, 
          imageSeconds: entity.imageSeconds, 
          items: 
            entity. items == null ? null : List<ListedItemModel>.from(await Future.wait(entity. items
            !.map((item) {
            counter++;
            return ListedItemModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

