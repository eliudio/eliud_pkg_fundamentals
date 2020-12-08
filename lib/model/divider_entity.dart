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
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class DividerEntity {
  final String appId;
  final String name;
  final RgbEntity color;
  final double height;
  final double thickness;
  final double indent;
  final double endIndent;

  DividerEntity({this.appId, this.name, this.color, this.height, this.thickness, this.indent, this.endIndent, });


  List<Object> get props => [appId, name, color, height, thickness, indent, endIndent, ];

  @override
  String toString() {
    return 'DividerEntity{appId: $appId, name: $name, color: $color, height: $height, thickness: $thickness, indent: $indent, endIndent: $endIndent}';
  }

  static DividerEntity fromMap(Map map) {
    if (map == null) return null;

    var colorFromMap;
    colorFromMap = map['color'];
    if (colorFromMap != null)
      colorFromMap = RgbEntity.fromMap(colorFromMap);

    return DividerEntity(
      appId: map['appId'], 
      name: map['name'], 
      color: colorFromMap, 
      height: double.tryParse(map['height'].toString()), 
      thickness: double.tryParse(map['thickness'].toString()), 
      indent: double.tryParse(map['indent'].toString()), 
      endIndent: double.tryParse(map['endIndent'].toString()), 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> colorMap = color != null 
        ? color.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
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
    return theDocument;
  }

  static DividerEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

