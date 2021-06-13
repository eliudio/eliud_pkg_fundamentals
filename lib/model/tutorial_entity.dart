/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';

import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class TutorialEntity {
  final String? appId;
  final String? name;
  final String? title;
  final String? description;
  final List<TutorialEntryEntity>? tutorialEntries;
  final ConditionsSimpleEntity? conditions;

  TutorialEntity({this.appId, this.name, this.title, this.description, this.tutorialEntries, this.conditions, });


  List<Object?> get props => [appId, name, title, description, tutorialEntries, conditions, ];

  @override
  String toString() {
    String tutorialEntriesCsv = (tutorialEntries == null) ? '' : tutorialEntries!.join(', ');

    return 'TutorialEntity{appId: $appId, name: $name, title: $title, description: $description, tutorialEntries: TutorialEntry[] { $tutorialEntriesCsv }, conditions: $conditions}';
  }

  static TutorialEntity? fromMap(Map? map) {
    if (map == null) return null;

    var tutorialEntriesFromMap;
    tutorialEntriesFromMap = map['tutorialEntries'];
    var tutorialEntriesList;
    if (tutorialEntriesFromMap != null)
      tutorialEntriesList = (map['tutorialEntries'] as List<dynamic>)
        .map((dynamic item) =>
        TutorialEntryEntity.fromMap(item as Map)!)
        .toList();
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsSimpleEntity.fromMap(conditionsFromMap);

    return TutorialEntity(
      appId: map['appId'], 
      name: map['name'], 
      title: map['title'], 
      description: map['description'], 
      tutorialEntries: tutorialEntriesList, 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? tutorialEntriesListMap = tutorialEntries != null 
        ? tutorialEntries!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (tutorialEntries != null) theDocument["tutorialEntries"] = tutorialEntriesListMap;
      else theDocument["tutorialEntries"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static TutorialEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

