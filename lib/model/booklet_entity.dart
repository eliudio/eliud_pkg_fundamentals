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
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class BookletEntity {
  final String appId;
  final String name;
  final List<SectionEntity> sections;

  BookletEntity({this.appId, this.name, this.sections, });


  List<Object> get props => [appId, name, sections, ];

  @override
  String toString() {
    String sectionsCsv = (sections == null) ? '' : sections.join(', ');

    return 'BookletEntity{appId: $appId, name: $name, sections: Section[] { $sectionsCsv }}';
  }

  static BookletEntity fromMap(Map map) {
    if (map == null) return null;

    final sectionsList = (map['sections'] as List<dynamic>)
        .map((dynamic item) =>
        SectionEntity.fromMap(item as Map))
        .toList();

    return BookletEntity(
      appId: map['appId'], 
      name: map['name'], 
      sections: sectionsList, 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> sectionsListMap = sections != null 
        ? sections.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (sections != null) theDocument["sections"] = sectionsListMap;
      else theDocument["sections"] = null;
    return theDocument;
  }

  static BookletEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

