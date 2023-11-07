/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class SimpleImageEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? imageId;
  final StorageConditionsEntity? conditions;

  SimpleImageEntity({
    required this.appId,
    this.description,
    this.imageId,
    this.conditions,
  });

  SimpleImageEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? imageId,
    StorageConditionsEntity? conditions,
  }) {
    return SimpleImageEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      imageId: imageId ?? this.imageId,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        imageId,
        conditions,
      ];

  @override
  String toString() {
    return 'SimpleImageEntity{appId: $appId, description: $description, imageId: $imageId, conditions: $conditions}';
  }

  static SimpleImageEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var imageIdNewDocmentId = map['imageId'];
    if ((newDocumentIds != null) && (imageIdNewDocmentId != null)) {
      var imageIdOldDocmentId = imageIdNewDocmentId;
      imageIdNewDocmentId = newRandomKey();
      newDocumentIds[imageIdOldDocmentId] = imageIdNewDocmentId;
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return SimpleImageEntity(
      appId: map['appId'],
      description: map['description'],
      imageId: imageIdNewDocmentId,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
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
    if (imageId != null) {
      theDocument["imageId"] = imageId;
    } else {
      theDocument["imageId"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  SimpleImageEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static SimpleImageEntity? fromJsonString(String json,
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
