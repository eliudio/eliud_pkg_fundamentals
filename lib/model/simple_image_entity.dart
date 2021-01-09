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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class SimpleImageEntity {
  final String appId;
  final String title;
  final String imageId;
  final ConditionsSimpleEntity conditions;

  SimpleImageEntity({this.appId, this.title, this.imageId, this.conditions, });


  List<Object> get props => [appId, title, imageId, conditions, ];

  @override
  String toString() {
    return 'SimpleImageEntity{appId: $appId, title: $title, imageId: $imageId, conditions: $conditions}';
  }

  static SimpleImageEntity fromMap(Map map) {
    if (map == null) return null;

    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsSimpleEntity.fromMap(conditionsFromMap);

    return SimpleImageEntity(
      appId: map['appId'], 
      title: map['title'], 
      imageId: map['imageId'], 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> conditionsMap = conditions != null 
        ? conditions.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (imageId != null) theDocument["imageId"] = imageId;
      else theDocument["imageId"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static SimpleImageEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

