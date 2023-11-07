/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';

class ListedItemEntity implements EntityBase {
  final String? description;
  final ActionEntity? action;
  final String? imageId;
  final PosSizeEntity? posSize;

  ListedItemEntity({
    this.description,
    this.action,
    this.imageId,
    this.posSize,
  });

  ListedItemEntity copyWith({
    String? documentID,
    String? description,
    ActionEntity? action,
    String? imageId,
    PosSizeEntity? posSize,
  }) {
    return ListedItemEntity(
      description: description ?? this.description,
      action: action ?? this.action,
      imageId: imageId ?? this.imageId,
      posSize: posSize ?? this.posSize,
    );
  }

  List<Object?> get props => [
        description,
        action,
        imageId,
        posSize,
      ];

  @override
  String toString() {
    return 'ListedItemEntity{description: $description, action: $action, imageId: $imageId, posSize: $posSize}';
  }

  static ListedItemEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var actionFromMap = map['action'];
    if (actionFromMap != null) {
      actionFromMap =
          ActionEntity.fromMap(actionFromMap, newDocumentIds: newDocumentIds);
    }
    var imageIdNewDocmentId = map['imageId'];
    if ((newDocumentIds != null) && (imageIdNewDocmentId != null)) {
      var imageIdOldDocmentId = imageIdNewDocmentId;
      imageIdNewDocmentId = newRandomKey();
      newDocumentIds[imageIdOldDocmentId] = imageIdNewDocmentId;
    }
    var posSizeFromMap = map['posSize'];
    if (posSizeFromMap != null) {
      posSizeFromMap =
          PosSizeEntity.fromMap(posSizeFromMap, newDocumentIds: newDocumentIds);
    }

    return ListedItemEntity(
      description: map['description'],
      action: actionFromMap,
      imageId: imageIdNewDocmentId,
      posSize: posSizeFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? actionMap =
        action != null ? action!.toDocument() : null;
    final Map<String, dynamic>? posSizeMap =
        posSize != null ? posSize!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (action != null) {
      theDocument["action"] = actionMap;
    } else {
      theDocument["action"] = null;
    }
    if (imageId != null) {
      theDocument["imageId"] = imageId;
    } else {
      theDocument["imageId"] = null;
    }
    if (posSize != null) {
      theDocument["posSize"] = posSizeMap;
    } else {
      theDocument["posSize"] = null;
    }
    return theDocument;
  }

  @override
  ListedItemEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static ListedItemEntity? fromJsonString(String json,
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
