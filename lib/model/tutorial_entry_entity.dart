/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/core/base/entity_base.dart';

class TutorialEntryEntity implements EntityBase {
  final String? description;
  final String? imageId;
  final String? code;

  TutorialEntryEntity({
    this.description,
    this.imageId,
    this.code,
  });

  TutorialEntryEntity copyWith({
    String? documentID,
    String? description,
    String? imageId,
    String? code,
  }) {
    return TutorialEntryEntity(
      description: description ?? this.description,
      imageId: imageId ?? this.imageId,
      code: code ?? this.code,
    );
  }

  List<Object?> get props => [
        description,
        imageId,
        code,
      ];

  @override
  String toString() {
    return 'TutorialEntryEntity{description: $description, imageId: $imageId, code: $code}';
  }

  static TutorialEntryEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var imageIdNewDocmentId = map['imageId'];
    if ((newDocumentIds != null) && (imageIdNewDocmentId != null)) {
      var imageIdOldDocmentId = imageIdNewDocmentId;
      imageIdNewDocmentId = newRandomKey();
      newDocumentIds[imageIdOldDocmentId] = imageIdNewDocmentId;
    }
    return TutorialEntryEntity(
      description: map['description'],
      imageId: imageIdNewDocmentId,
      code: map['code'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (imageId != null) {
      theDocument["imageId"] = imageId;
    } else {
      theDocument["imageId"] = null;
    }
    if (code != null) {
      theDocument["code"] = code;
    } else {
      theDocument["code"] = null;
    }
    return theDocument;
  }

  @override
  TutorialEntryEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static TutorialEntryEntity? fromJsonString(String json,
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
