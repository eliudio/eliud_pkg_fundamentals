/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_entity.dart
                       
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
class DividerEntity {
  final String? appId;
  final String? description;
  final RgbEntity? color;
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final StorageConditionsEntity? conditions;

  DividerEntity({this.appId, this.description, this.color, this.height, this.thickness, this.indent, this.endIndent, this.conditions, });


  List<Object?> get props => [appId, description, color, height, thickness, indent, endIndent, conditions, ];

  @override
  String toString() {
    return 'DividerEntity{appId: $appId, description: $description, color: $color, height: $height, thickness: $thickness, indent: $indent, endIndent: $endIndent, conditions: $conditions}';
  }

  static DividerEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var colorFromMap;
    colorFromMap = map['color'];
    if (colorFromMap != null)
      colorFromMap = RgbEntity.fromMap(colorFromMap);
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

    return DividerEntity(
      appId: map['appId'], 
      description: map['description'], 
      color: colorFromMap, 
      height: double.tryParse(map['height'].toString()), 
      thickness: double.tryParse(map['thickness'].toString()), 
      indent: double.tryParse(map['indent'].toString()), 
      endIndent: double.tryParse(map['endIndent'].toString()), 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? colorMap = color != null 
        ? color!.toDocument()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (color != null) theDocument["color"] = colorMap;
      else theDocument["color"] = null;
    if (height != null) theDocument["height"] = height;
      else theDocument["height"] = null;
    if (thickness != null) theDocument["thickness"] = thickness;
      else theDocument["thickness"] = null;
    if (indent != null) theDocument["indent"] = indent;
      else theDocument["indent"] = null;
    if (endIndent != null) theDocument["endIndent"] = endIndent;
      else theDocument["endIndent"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static DividerEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

