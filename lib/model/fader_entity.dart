/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class FaderEntity implements EntityBase {
  final String? appId;
  final String? description;
  final int? animationMilliseconds;
  final int? imageSeconds;
  final List<ListedItemEntity>? items;
  final BackgroundEntity? background;
  final StorageConditionsEntity? conditions;

  FaderEntity({
    required this.appId,
    this.description,
    this.animationMilliseconds,
    this.imageSeconds,
    this.items,
    this.background,
    this.conditions,
  });

  FaderEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    int? animationMilliseconds,
    int? imageSeconds,
    List<ListedItemEntity>? items,
    BackgroundEntity? background,
    StorageConditionsEntity? conditions,
  }) {
    return FaderEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      animationMilliseconds:
          animationMilliseconds ?? this.animationMilliseconds,
      imageSeconds: imageSeconds ?? this.imageSeconds,
      items: items ?? this.items,
      background: background ?? this.background,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        animationMilliseconds,
        imageSeconds,
        items,
        background,
        conditions,
      ];

  @override
  String toString() {
    String itemsCsv = (items == null) ? '' : items!.join(', ');

    return 'FaderEntity{appId: $appId, description: $description, animationMilliseconds: $animationMilliseconds, imageSeconds: $imageSeconds, items: ListedItem[] { $itemsCsv }, background: $background, conditions: $conditions}';
  }

  static FaderEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var itemsFromMap = map['items'];
    List<ListedItemEntity> itemsList;
    if (itemsFromMap != null) {
      itemsList = (map['items'] as List<dynamic>)
          .map((dynamic item) => ListedItemEntity.fromMap(item as Map,
              newDocumentIds: newDocumentIds)!)
          .toList();
    } else {
      itemsList = [];
    }
    var backgroundFromMap = map['background'];
    if (backgroundFromMap != null) {
      backgroundFromMap = BackgroundEntity.fromMap(backgroundFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return FaderEntity(
      appId: map['appId'],
      description: map['description'],
      animationMilliseconds:
          int.tryParse(map['animationMilliseconds'].toString()),
      imageSeconds: int.tryParse(map['imageSeconds'].toString()),
      items: itemsList,
      background: backgroundFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? itemsListMap =
        items != null ? items!.map((item) => item.toDocument()).toList() : null;
    final Map<String, dynamic>? backgroundMap =
        background != null ? background!.toDocument() : null;
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (animationMilliseconds != null) {
      theDocument["animationMilliseconds"] = animationMilliseconds;
    } else {
      theDocument["animationMilliseconds"] = null;
    }
    if (imageSeconds != null) {
      theDocument["imageSeconds"] = imageSeconds;
    } else {
      theDocument["imageSeconds"] = null;
    }
    if (items != null) {
      theDocument["items"] = itemsListMap;
    } else {
      theDocument["items"] = null;
    }
    if (background != null) {
      theDocument["background"] = backgroundMap;
    } else {
      theDocument["background"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  FaderEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static FaderEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
