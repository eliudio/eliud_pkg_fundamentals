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
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class PresentationEntity {
  final String appId;
  final String title;
  final List<BodyComponentEntity> bodyComponents;
  final String imageId;
  final int imagePositionRelative;
  final int imageAlignment;
  final double imageWidth;
  final ConditionsSimpleEntity conditions;

  PresentationEntity({this.appId, this.title, this.bodyComponents, this.imageId, this.imagePositionRelative, this.imageAlignment, this.imageWidth, this.conditions, });


  List<Object> get props => [appId, title, bodyComponents, imageId, imagePositionRelative, imageAlignment, imageWidth, conditions, ];

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents.join(', ');

    return 'PresentationEntity{appId: $appId, title: $title, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, imageId: $imageId, imagePositionRelative: $imagePositionRelative, imageAlignment: $imageAlignment, imageWidth: $imageWidth, conditions: $conditions}';
  }

  static PresentationEntity fromMap(Map map) {
    if (map == null) return null;

    var bodyComponentsFromMap;
    bodyComponentsFromMap = map['bodyComponents'];
    var bodyComponentsList;
    if (bodyComponentsFromMap != null)
      bodyComponentsList = (map['bodyComponents'] as List<dynamic>)
        .map((dynamic item) =>
        BodyComponentEntity.fromMap(item as Map))
        .toList();
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsSimpleEntity.fromMap(conditionsFromMap);

    return PresentationEntity(
      appId: map['appId'], 
      title: map['title'], 
      bodyComponents: bodyComponentsList, 
      imageId: map['imageId'], 
      imagePositionRelative: map['imagePositionRelative'], 
      imageAlignment: map['imageAlignment'], 
      imageWidth: double.tryParse(map['imageWidth'].toString()), 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> bodyComponentsListMap = bodyComponents != null 
        ? bodyComponents.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic> conditionsMap = conditions != null 
        ? conditions.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
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

  static PresentationEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

