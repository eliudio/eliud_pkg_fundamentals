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
import 'package:eliud_core/tools/random.dart';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class TutorialEntity implements EntityBase {
  final String? appId;
  final String? name;
  final String? title;
  final String? description;
  final List<TutorialEntryEntity>? tutorialEntries;
  final StorageConditionsEntity? conditions;

  TutorialEntity({required this.appId, this.name, this.title, this.description, this.tutorialEntries, this.conditions, });

  TutorialEntity copyWith({String? documentID, String? appId, String? name, String? title, String? description, List<TutorialEntryEntity>? tutorialEntries, StorageConditionsEntity? conditions, }) {
    return TutorialEntity(appId : appId ?? this.appId, name : name ?? this.name, title : title ?? this.title, description : description ?? this.description, tutorialEntries : tutorialEntries ?? this.tutorialEntries, conditions : conditions ?? this.conditions, );
  }
  List<Object?> get props => [appId, name, title, description, tutorialEntries, conditions, ];

  @override
  String toString() {
    String tutorialEntriesCsv = (tutorialEntries == null) ? '' : tutorialEntries!.join(', ');

    return 'TutorialEntity{appId: $appId, name: $name, title: $title, description: $description, tutorialEntries: TutorialEntry[] { $tutorialEntriesCsv }, conditions: $conditions}';
  }

  static TutorialEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var tutorialEntriesFromMap;
    tutorialEntriesFromMap = map['tutorialEntries'];
    var tutorialEntriesList;
    if (tutorialEntriesFromMap != null)
      tutorialEntriesList = (map['tutorialEntries'] as List<dynamic>)
        .map((dynamic item) =>
        TutorialEntryEntity.fromMap(item as Map, newDocumentIds: newDocumentIds)!)
        .toList();
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap, newDocumentIds: newDocumentIds);

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

  @override
  TutorialEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static TutorialEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

