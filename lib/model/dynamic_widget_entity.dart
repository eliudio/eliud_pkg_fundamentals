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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class DynamicWidgetEntity {
  final String? appId;
  final String? description;
  final String? content;
  final BackgroundEntity? background;
  final StorageConditionsEntity? conditions;

  DynamicWidgetEntity({required this.appId, this.description, this.content, this.background, this.conditions, });


  List<Object?> get props => [appId, description, content, background, conditions, ];

  @override
  String toString() {
    return 'DynamicWidgetEntity{appId: $appId, description: $description, content: $content, background: $background, conditions: $conditions}';
  }

  static DynamicWidgetEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var backgroundFromMap;
    backgroundFromMap = map['background'];
    if (backgroundFromMap != null)
      backgroundFromMap = BackgroundEntity.fromMap(backgroundFromMap);
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

    return DynamicWidgetEntity(
      appId: map['appId'], 
      description: map['description'], 
      content: map['content'], 
      background: backgroundFromMap, 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? backgroundMap = background != null 
        ? background!.toDocument()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (content != null) theDocument["content"] = content;
      else theDocument["content"] = null;
    if (background != null) theDocument["background"] = backgroundMap;
      else theDocument["background"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static DynamicWidgetEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

