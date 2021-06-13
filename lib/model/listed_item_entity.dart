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

import '../tools/bespoke_entities.dart';

class ListedItemEntity {
  final String? description;
  final ActionEntity? action;
  final String? imageId;
  final String? posSizeId;

  ListedItemEntity({this.description, this.action, this.imageId, this.posSizeId, });


  List<Object?> get props => [description, action, imageId, posSizeId, ];

  @override
  String toString() {
    return 'ListedItemEntity{description: $description, action: $action, imageId: $imageId, posSizeId: $posSizeId}';
  }

  static ListedItemEntity? fromMap(Map? map) {
    if (map == null) return null;

    var actionFromMap;
    actionFromMap = map['action'];
    if (actionFromMap != null)
      actionFromMap = ActionEntity.fromMap(actionFromMap);

    return ListedItemEntity(
      description: map['description'], 
      action: actionFromMap, 
      imageId: map['imageId'], 
      posSizeId: map['posSizeId'], 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? actionMap = action != null 
        ? action!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (action != null) theDocument["action"] = actionMap;
      else theDocument["action"] = null;
    if (imageId != null) theDocument["imageId"] = imageId;
      else theDocument["imageId"] = null;
    if (posSizeId != null) theDocument["posSizeId"] = posSizeId;
      else theDocument["posSizeId"] = null;
    return theDocument;
  }

  static ListedItemEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

