/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class PresentationEntity implements EntityBase {
  final String? appId;
  final String? description;
  final List<BodyComponentEntity>? bodyComponents;
  final String? imageId;
  final int? imagePositionRelative;
  final int? imageAlignment;
  final double? imageWidth;
  final StorageConditionsEntity? conditions;

  PresentationEntity({required this.appId, this.description, this.bodyComponents, this.imageId, this.imagePositionRelative, this.imageAlignment, this.imageWidth, this.conditions, });

  PresentationEntity copyWith({String? documentID, String? appId, String? description, List<BodyComponentEntity>? bodyComponents, String? imageId, int? imagePositionRelative, int? imageAlignment, double? imageWidth, StorageConditionsEntity? conditions, }) {
    return PresentationEntity(appId : appId ?? this.appId, description : description ?? this.description, bodyComponents : bodyComponents ?? this.bodyComponents, imageId : imageId ?? this.imageId, imagePositionRelative : imagePositionRelative ?? this.imagePositionRelative, imageAlignment : imageAlignment ?? this.imageAlignment, imageWidth : imageWidth ?? this.imageWidth, conditions : conditions ?? this.conditions, );
  }
  List<Object?> get props => [appId, description, bodyComponents, imageId, imagePositionRelative, imageAlignment, imageWidth, conditions, ];

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'PresentationEntity{appId: $appId, description: $description, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, imageId: $imageId, imagePositionRelative: $imagePositionRelative, imageAlignment: $imageAlignment, imageWidth: $imageWidth, conditions: $conditions}';
  }

  static PresentationEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var bodyComponentsFromMap;
    bodyComponentsFromMap = map['bodyComponents'];
    List<BodyComponentEntity> bodyComponentsList;
    if (bodyComponentsFromMap != null) {
      bodyComponentsList = (map['bodyComponents'] as List<dynamic>)
        .map((dynamic item) =>
        BodyComponentEntity.fromMap(item as Map, newDocumentIds: newDocumentIds)!)
        .toList();
    } else {
      bodyComponentsList = [];
    }
    var imageIdNewDocmentId = map['imageId'];
    if ((newDocumentIds != null) && (imageIdNewDocmentId != null)) {
      var imageIdOldDocmentId = imageIdNewDocmentId;
      imageIdNewDocmentId = newRandomKey();
      newDocumentIds[imageIdOldDocmentId] = imageIdNewDocmentId;
    }
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap, newDocumentIds: newDocumentIds);

    return PresentationEntity(
      appId: map['appId'], 
      description: map['description'], 
      bodyComponents: bodyComponentsList, 
      imageId: imageIdNewDocmentId, 
      imagePositionRelative: map['imagePositionRelative'], 
      imageAlignment: map['imageAlignment'], 
      imageWidth: double.tryParse(map['imageWidth'].toString()), 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? bodyComponentsListMap = bodyComponents != null 
        ? bodyComponents!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (bodyComponents != null) theDocument["bodyComponents"] = bodyComponentsListMap;
      else theDocument["bodyComponents"] = null;
    if (imageId != null) theDocument["imageId"] = imageId;
      else theDocument["imageId"] = null;
    if (imagePositionRelative != null) theDocument["imagePositionRelative"] = imagePositionRelative;
      else theDocument["imagePositionRelative"] = null;
    if (imageAlignment != null) theDocument["imageAlignment"] = imageAlignment;
      else theDocument["imageAlignment"] = null;
    if (imageWidth != null) theDocument["imageWidth"] = imageWidth;
      else theDocument["imageWidth"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  @override
  PresentationEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static PresentationEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

