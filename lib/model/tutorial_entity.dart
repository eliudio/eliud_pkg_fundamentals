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
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class TutorialEntity {
  final String appId;
  final String name;
  final String title;
  final String description;
  final List<TutorialEntryEntity> tutorialEntries;

  TutorialEntity({this.appId, this.name, this.title, this.description, this.tutorialEntries, });


  List<Object> get props => [appId, name, title, description, tutorialEntries, ];

  @override
  String toString() {
    String tutorialEntriesCsv = (tutorialEntries == null) ? '' : tutorialEntries.join(', ');

    return 'TutorialEntity{appId: $appId, name: $name, title: $title, description: $description, tutorialEntries: TutorialEntry[] { $tutorialEntriesCsv }}';
  }

  static TutorialEntity fromMap(Map map) {
    if (map == null) return null;

    final tutorialEntriesList = (map['tutorialEntries'] as List<dynamic>)
        .map((dynamic item) =>
        TutorialEntryEntity.fromMap(item as Map))
        .toList();

    return TutorialEntity(
      appId: map['appId'], 
      name: map['name'], 
      title: map['title'], 
      description: map['description'], 
      tutorialEntries: tutorialEntriesList, 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> tutorialEntriesListMap = tutorialEntries != null 
        ? tutorialEntries.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
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
    return theDocument;
  }

  static TutorialEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

