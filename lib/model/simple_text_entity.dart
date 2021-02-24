/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class SimpleTextEntity {
  final String appId;
  final String title;
  final String text;
  final ConditionsSimpleEntity conditions;
  final int textAlign;

  SimpleTextEntity({this.appId, this.title, this.text, this.conditions, this.textAlign, });


  List<Object> get props => [appId, title, text, conditions, textAlign, ];

  @override
  String toString() {
    return 'SimpleTextEntity{appId: $appId, title: $title, text: $text, conditions: $conditions, textAlign: $textAlign}';
  }

  static SimpleTextEntity fromMap(Map map) {
    if (map == null) return null;

    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsSimpleEntity.fromMap(conditionsFromMap);

    return SimpleTextEntity(
      appId: map['appId'], 
      title: map['title'], 
      text: map['text'], 
      conditions: conditionsFromMap, 
      textAlign: map['textAlign'], 
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
    if (text != null) theDocument["text"] = text;
      else theDocument["text"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    if (textAlign != null) theDocument["textAlign"] = textAlign;
      else theDocument["textAlign"] = null;
    return theDocument;
  }

  static SimpleTextEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

