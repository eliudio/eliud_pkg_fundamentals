/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class PhotoAndTextEntity {
  final String appId;
  final String name;
  final String title;
  final String contents;
  final String imageId;
  final int imagePosition;
  final ConditionsSimpleEntity conditions;

  PhotoAndTextEntity({this.appId, this.name, this.title, this.contents, this.imageId, this.imagePosition, this.conditions, });


  List<Object> get props => [appId, name, title, contents, imageId, imagePosition, conditions, ];

  @override
  String toString() {
    return 'PhotoAndTextEntity{appId: $appId, name: $name, title: $title, contents: $contents, imageId: $imageId, imagePosition: $imagePosition, conditions: $conditions}';
  }

  static PhotoAndTextEntity fromMap(Map map) {
    if (map == null) return null;

    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsSimpleEntity.fromMap(conditionsFromMap);

    return PhotoAndTextEntity(
      appId: map['appId'], 
      name: map['name'], 
      title: map['title'], 
      contents: map['contents'], 
      imageId: map['imageId'], 
      imagePosition: map['imagePosition'], 
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
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (contents != null) theDocument["contents"] = contents;
      else theDocument["contents"] = null;
    if (imageId != null) theDocument["imageId"] = imageId;
      else theDocument["imageId"] = null;
    if (imagePosition != null) theDocument["imagePosition"] = imagePosition;
      else theDocument["imagePosition"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static PhotoAndTextEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

