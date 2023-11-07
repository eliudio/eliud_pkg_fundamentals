/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class DecoratedContentEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? decoratingComponentName;
  final String? decoratingComponentId;
  final String? contentComponentName;
  final String? contentComponentId;
  final int? decorationComponentPosition;
  final double? percentageDecorationVisible;
  final StorageConditionsEntity? conditions;

  DecoratedContentEntity({
    required this.appId,
    this.description,
    this.decoratingComponentName,
    this.decoratingComponentId,
    this.contentComponentName,
    this.contentComponentId,
    this.decorationComponentPosition,
    this.percentageDecorationVisible,
    this.conditions,
  });

  DecoratedContentEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? decoratingComponentName,
    String? decoratingComponentId,
    String? contentComponentName,
    String? contentComponentId,
    int? decorationComponentPosition,
    double? percentageDecorationVisible,
    StorageConditionsEntity? conditions,
  }) {
    return DecoratedContentEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      decoratingComponentName:
          decoratingComponentName ?? this.decoratingComponentName,
      decoratingComponentId:
          decoratingComponentId ?? this.decoratingComponentId,
      contentComponentName: contentComponentName ?? this.contentComponentName,
      contentComponentId: contentComponentId ?? this.contentComponentId,
      decorationComponentPosition:
          decorationComponentPosition ?? this.decorationComponentPosition,
      percentageDecorationVisible:
          percentageDecorationVisible ?? this.percentageDecorationVisible,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        decoratingComponentName,
        decoratingComponentId,
        contentComponentName,
        contentComponentId,
        decorationComponentPosition,
        percentageDecorationVisible,
        conditions,
      ];

  @override
  String toString() {
    return 'DecoratedContentEntity{appId: $appId, description: $description, decoratingComponentName: $decoratingComponentName, decoratingComponentId: $decoratingComponentId, contentComponentName: $contentComponentName, contentComponentId: $contentComponentId, decorationComponentPosition: $decorationComponentPosition, percentageDecorationVisible: $percentageDecorationVisible, conditions: $conditions}';
  }

  static DecoratedContentEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return DecoratedContentEntity(
      appId: map['appId'],
      description: map['description'],
      decoratingComponentName: map['decoratingComponentName'],
      decoratingComponentId: map['decoratingComponentId'],
      contentComponentName: map['contentComponentName'],
      contentComponentId: map['contentComponentId'],
      decorationComponentPosition: map['decorationComponentPosition'],
      percentageDecorationVisible:
          double.tryParse(map['percentageDecorationVisible'].toString()),
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
    if (decoratingComponentName != null) {
      theDocument["decoratingComponentName"] = decoratingComponentName;
    } else {
      theDocument["decoratingComponentName"] = null;
    }
    if (decoratingComponentId != null) {
      theDocument["decoratingComponentId"] = decoratingComponentId;
    } else {
      theDocument["decoratingComponentId"] = null;
    }
    if (contentComponentName != null) {
      theDocument["contentComponentName"] = contentComponentName;
    } else {
      theDocument["contentComponentName"] = null;
    }
    if (contentComponentId != null) {
      theDocument["contentComponentId"] = contentComponentId;
    } else {
      theDocument["contentComponentId"] = null;
    }
    if (decorationComponentPosition != null) {
      theDocument["decorationComponentPosition"] = decorationComponentPosition;
    } else {
      theDocument["decorationComponentPosition"] = null;
    }
    if (percentageDecorationVisible != null) {
      theDocument["percentageDecorationVisible"] = percentageDecorationVisible;
    } else {
      theDocument["percentageDecorationVisible"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  DecoratedContentEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static DecoratedContentEntity? fromJsonString(String json,
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
