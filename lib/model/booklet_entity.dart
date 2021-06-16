/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class BookletEntity {
  final String? appId;
  final String? name;
  final List<SectionEntity>? sections;
  final ConditionsSimpleEntity? conditions;

  BookletEntity({this.appId, this.name, this.sections, this.conditions, });


  List<Object?> get props => [appId, name, sections, conditions, ];

  @override
  String toString() {
    String sectionsCsv = (sections == null) ? '' : sections!.join(', ');

    return 'BookletEntity{appId: $appId, name: $name, sections: Section[] { $sectionsCsv }, conditions: $conditions}';
  }

  static BookletEntity? fromMap(Map? map) {
    if (map == null) return null;

    var sectionsFromMap;
    sectionsFromMap = map['sections'];
    var sectionsList;
    if (sectionsFromMap != null)
      sectionsList = (map['sections'] as List<dynamic>)
        .map((dynamic item) =>
        SectionEntity.fromMap(item as Map)!)
        .toList();
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsSimpleEntity.fromMap(conditionsFromMap);

    return BookletEntity(
      appId: map['appId'], 
      name: map['name'], 
      sections: sectionsList, 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? sectionsListMap = sections != null 
        ? sections!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (sections != null) theDocument["sections"] = sectionsListMap;
      else theDocument["sections"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static BookletEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

