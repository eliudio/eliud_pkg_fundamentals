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
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class DividerEntity implements EntityBase {
  final String? appId;
  final String? description;
  final RgbEntity? color;
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final StorageConditionsEntity? conditions;

  DividerEntity({
    required this.appId,
    this.description,
    this.color,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.conditions,
  });

  DividerEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    RgbEntity? color,
    double? height,
    double? thickness,
    double? indent,
    double? endIndent,
    StorageConditionsEntity? conditions,
  }) {
    return DividerEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      color: color ?? this.color,
      height: height ?? this.height,
      thickness: thickness ?? this.thickness,
      indent: indent ?? this.indent,
      endIndent: endIndent ?? this.endIndent,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        color,
        height,
        thickness,
        indent,
        endIndent,
        conditions,
      ];

  @override
  String toString() {
    return 'DividerEntity{appId: $appId, description: $description, color: $color, height: $height, thickness: $thickness, indent: $indent, endIndent: $endIndent, conditions: $conditions}';
  }

  static DividerEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var colorFromMap = map['color'];
    if (colorFromMap != null) {
      colorFromMap =
          RgbEntity.fromMap(colorFromMap, newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

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

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? colorMap =
        color != null ? color!.toDocument() : null;
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
    if (color != null) {
      theDocument["color"] = colorMap;
    } else {
      theDocument["color"] = null;
    }
    if (height != null) {
      theDocument["height"] = height;
    } else {
      theDocument["height"] = null;
    }
    if (thickness != null) {
      theDocument["thickness"] = thickness;
    } else {
      theDocument["thickness"] = null;
    }
    if (indent != null) {
      theDocument["indent"] = indent;
    } else {
      theDocument["indent"] = null;
    }
    if (endIndent != null) {
      theDocument["endIndent"] = endIndent;
    } else {
      theDocument["endIndent"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  DividerEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static DividerEntity? fromJsonString(String json,
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
