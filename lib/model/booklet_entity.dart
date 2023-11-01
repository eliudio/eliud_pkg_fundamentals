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
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class BookletEntity implements EntityBase {
  final String? appId;
  final String? description;
  final List<SectionEntity>? sections;
  final StorageConditionsEntity? conditions;

  BookletEntity({required this.appId, this.description, this.sections, this.conditions, });

  BookletEntity copyWith({String? documentID, String? appId, String? description, List<SectionEntity>? sections, StorageConditionsEntity? conditions, }) {
    return BookletEntity(appId : appId ?? this.appId, description : description ?? this.description, sections : sections ?? this.sections, conditions : conditions ?? this.conditions, );
  }
  List<Object?> get props => [appId, description, sections, conditions, ];

  @override
  String toString() {
    String sectionsCsv = (sections == null) ? '' : sections!.join(', ');

    return 'BookletEntity{appId: $appId, description: $description, sections: Section[] { $sectionsCsv }, conditions: $conditions}';
  }

  static BookletEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var sectionsFromMap;
    sectionsFromMap = map['sections'];
    List<SectionEntity> sectionsList;
    if (sectionsFromMap != null) {
      sectionsList = (map['sections'] as List<dynamic>)
        .map((dynamic item) =>
        SectionEntity.fromMap(item as Map, newDocumentIds: newDocumentIds)!)
        .toList();
    } else {
      sectionsList = [];
    }
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap, newDocumentIds: newDocumentIds);

    return BookletEntity(
      appId: map['appId'], 
      description: map['description'], 
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
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (sections != null) theDocument["sections"] = sectionsListMap;
      else theDocument["sections"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  @override
  BookletEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    newEntity = newEntity.copyWith(sections: (sections == null) ? null : (sections!.map((section) => section.copyWith(links: (section.links == null) ? null : (section.links!.map((link) => (link.copyWith( action: link.action == null ? null : link.action!.copyWith(appId: newAppId))))).toList()))).toList());
    return newEntity;
  }

  static BookletEntity? fromJsonString(String json, {Map<String, String>? newDocumentIds}) {
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

