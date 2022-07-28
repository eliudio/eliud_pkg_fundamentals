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


import 'package:eliud_pkg_fundamentals/model/fader_entity.dart';

import 'package:eliud_core/tools/random.dart';



class FaderModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals';
  static const String id = 'faders';

  String documentID;
  String appId;
  String? description;

  // The duration of the transition between the images
  int? animationMilliseconds;

  // The time to display 1 image
  int? imageSeconds;
  List<ListedItemModel>? items;
  BackgroundModel? background;
  StorageConditionsModel? conditions;

  FaderModel({required this.documentID, required this.appId, this.description, this.animationMilliseconds, this.imageSeconds, this.items, this.background, this.conditions, })  {
    assert(documentID != null);
  }

  FaderModel copyWith({String? documentID, String? appId, String? description, int? animationMilliseconds, int? imageSeconds, List<ListedItemModel>? items, BackgroundModel? background, StorageConditionsModel? conditions, }) {
    return FaderModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, animationMilliseconds: animationMilliseconds ?? this.animationMilliseconds, imageSeconds: imageSeconds ?? this.imageSeconds, items: items ?? this.items, background: background ?? this.background, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ animationMilliseconds.hashCode ^ imageSeconds.hashCode ^ items.hashCode ^ background.hashCode ^ conditions.hashCode;

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
          background == other.background &&
          conditions == other.conditions;

  @override
  String toString() {
    String itemsCsv = (items == null) ? '' : items!.join(', ');

    return 'FaderModel{documentID: $documentID, appId: $appId, description: $description, animationMilliseconds: $animationMilliseconds, imageSeconds: $imageSeconds, items: ListedItem[] { $itemsCsv }, background: $background, conditions: $conditions}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (items != null) {
      for (var item in items!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (background != null) referencesCollector.addAll(await background!.collectReferences(appId: appId));
    if (conditions != null) referencesCollector.addAll(await conditions!.collectReferences(appId: appId));
    return referencesCollector;
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
          background: (background != null) ? background!.toEntity(appId: appId) : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<FaderModel?> fromEntity(String documentID, FaderEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return FaderModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
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
          background: 
            await BackgroundModel.fromEntity(entity.background), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<FaderModel?> fromEntityPlus(String documentID, FaderEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return FaderModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          animationMilliseconds: entity.animationMilliseconds, 
          imageSeconds: entity.imageSeconds, 
          items: 
            entity. items == null ? null : List<ListedItemModel>.from(await Future.wait(entity. items
            !.map((item) {
            counter++;
            return ListedItemModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          background: 
            await BackgroundModel.fromEntityPlus(entity.background, appId: appId), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

