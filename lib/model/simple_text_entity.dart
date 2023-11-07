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
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';

class SimpleTextEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? title;
  final String? text;
  final StorageConditionsEntity? conditions;
  final int? textAlign;

  SimpleTextEntity({
    required this.appId,
    this.description,
    this.title,
    this.text,
    this.conditions,
    this.textAlign,
  });

  SimpleTextEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? title,
    String? text,
    StorageConditionsEntity? conditions,
    int? textAlign,
  }) {
    return SimpleTextEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      title: title ?? this.title,
      text: text ?? this.text,
      conditions: conditions ?? this.conditions,
      textAlign: textAlign ?? this.textAlign,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        title,
        text,
        conditions,
        textAlign,
      ];

  @override
  String toString() {
    return 'SimpleTextEntity{appId: $appId, description: $description, title: $title, text: $text, conditions: $conditions, textAlign: $textAlign}';
  }

  static SimpleTextEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return SimpleTextEntity(
      appId: map['appId'],
      description: map['description'],
      title: map['title'],
      text: map['text'],
      conditions: conditionsFromMap,
      textAlign: map['textAlign'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
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
    if (title != null) {
      theDocument["title"] = title;
    } else {
      theDocument["title"] = null;
    }
    if (text != null) {
      theDocument["text"] = text;
    } else {
      theDocument["text"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    if (textAlign != null) {
      theDocument["textAlign"] = textAlign;
    } else {
      theDocument["textAlign"] = null;
    }
    return theDocument;
  }

  @override
  SimpleTextEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static SimpleTextEntity? fromJsonString(String json,
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
