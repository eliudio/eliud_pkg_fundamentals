/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class GridEntity implements EntityBase {
  final String? appId;
  final String? description;
  final List<BodyComponentEntity>? bodyComponents;
  final String? gridViewId;
  final StorageConditionsEntity? conditions;

  GridEntity({
    required this.appId,
    this.description,
    this.bodyComponents,
    this.gridViewId,
    this.conditions,
  });

  GridEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    List<BodyComponentEntity>? bodyComponents,
    String? gridViewId,
    StorageConditionsEntity? conditions,
  }) {
    return GridEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      bodyComponents: bodyComponents ?? this.bodyComponents,
      gridViewId: gridViewId ?? this.gridViewId,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        bodyComponents,
        gridViewId,
        conditions,
      ];

  @override
  String toString() {
    String bodyComponentsCsv =
        (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'GridEntity{appId: $appId, description: $description, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, gridViewId: $gridViewId, conditions: $conditions}';
  }

  static GridEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var bodyComponentsFromMap = map['bodyComponents'];
    List<BodyComponentEntity> bodyComponentsList;
    if (bodyComponentsFromMap != null) {
      bodyComponentsList = (map['bodyComponents'] as List<dynamic>)
          .map((dynamic item) => BodyComponentEntity.fromMap(item as Map,
              newDocumentIds: newDocumentIds)!)
          .toList();
    } else {
      bodyComponentsList = [];
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return GridEntity(
      appId: map['appId'],
      description: map['description'],
      bodyComponents: bodyComponentsList,
      gridViewId: map['gridViewId'],
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? bodyComponentsListMap =
        bodyComponents != null
            ? bodyComponents!.map((item) => item.toDocument()).toList()
            : null;
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
    if (bodyComponents != null) {
      theDocument["bodyComponents"] = bodyComponentsListMap;
    } else {
      theDocument["bodyComponents"] = null;
    }
    if (gridViewId != null) {
      theDocument["gridViewId"] = gridViewId;
    } else {
      theDocument["gridViewId"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  GridEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static GridEntity? fromJsonString(String json,
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
