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

import 'package:eliud_core/model/entity_export.dart';

class DecoratedContentEntity {
  final String? appId;
  final String? name;
  final String? decoratingComponentName;
  final String? decoratingComponentId;
  final String? contentComponentName;
  final String? contentComponentId;
  final int? decorationComponentPosition;
  final double? percentageDecorationVisible;
  final ConditionsSimpleEntity? conditions;

  DecoratedContentEntity({this.appId, this.name, this.decoratingComponentName, this.decoratingComponentId, this.contentComponentName, this.contentComponentId, this.decorationComponentPosition, this.percentageDecorationVisible, this.conditions, });


  List<Object?> get props => [appId, name, decoratingComponentName, decoratingComponentId, contentComponentName, contentComponentId, decorationComponentPosition, percentageDecorationVisible, conditions, ];

  @override
  String toString() {
    return 'DecoratedContentEntity{appId: $appId, name: $name, decoratingComponentName: $decoratingComponentName, decoratingComponentId: $decoratingComponentId, contentComponentName: $contentComponentName, contentComponentId: $contentComponentId, decorationComponentPosition: $decorationComponentPosition, percentageDecorationVisible: $percentageDecorationVisible, conditions: $conditions}';
  }

  static DecoratedContentEntity? fromMap(Map? map) {
    if (map == null) return null;

    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsSimpleEntity.fromMap(conditionsFromMap);

    return DecoratedContentEntity(
      appId: map['appId'], 
      name: map['name'], 
      decoratingComponentName: map['decoratingComponentName'], 
      decoratingComponentId: map['decoratingComponentId'], 
      contentComponentName: map['contentComponentName'], 
      contentComponentId: map['contentComponentId'], 
      decorationComponentPosition: map['decorationComponentPosition'], 
      percentageDecorationVisible: double.tryParse(map['percentageDecorationVisible'].toString()), 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (decoratingComponentName != null) theDocument["decoratingComponentName"] = decoratingComponentName;
      else theDocument["decoratingComponentName"] = null;
    if (decoratingComponentId != null) theDocument["decoratingComponentId"] = decoratingComponentId;
      else theDocument["decoratingComponentId"] = null;
    if (contentComponentName != null) theDocument["contentComponentName"] = contentComponentName;
      else theDocument["contentComponentName"] = null;
    if (contentComponentId != null) theDocument["contentComponentId"] = contentComponentId;
      else theDocument["contentComponentId"] = null;
    if (decorationComponentPosition != null) theDocument["decorationComponentPosition"] = decorationComponentPosition;
      else theDocument["decorationComponentPosition"] = null;
    if (percentageDecorationVisible != null) theDocument["percentageDecorationVisible"] = percentageDecorationVisible;
      else theDocument["percentageDecorationVisible"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static DecoratedContentEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

