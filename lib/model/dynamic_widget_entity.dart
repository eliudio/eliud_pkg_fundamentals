/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class DynamicWidgetEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? content;
  final BackgroundEntity? background;
  final StorageConditionsEntity? conditions;

  DynamicWidgetEntity({
    required this.appId,
    this.description,
    this.content,
    this.background,
    this.conditions,
  });

  DynamicWidgetEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? content,
    BackgroundEntity? background,
    StorageConditionsEntity? conditions,
  }) {
    return DynamicWidgetEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      content: content ?? this.content,
      background: background ?? this.background,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        content,
        background,
        conditions,
      ];

  @override
  String toString() {
    return 'DynamicWidgetEntity{appId: $appId, description: $description, content: $content, background: $background, conditions: $conditions}';
  }

  static DynamicWidgetEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

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

    return DynamicWidgetEntity(
      appId: map['appId'],
      description: map['description'],
      content: map['content'],
      background: backgroundFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
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
    if (content != null) {
      theDocument["content"] = content;
    } else {
      theDocument["content"] = null;
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
  DynamicWidgetEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static DynamicWidgetEntity? fromJsonString(String json,
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
