/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class FaderEntity implements EntityBase {
  final String? appId;
  final String? description;
  final int? animationMilliseconds;
  final int? imageSeconds;
  final List<ListedItemEntity>? items;
  final StorageConditionsEntity? conditions;

  FaderEntity({required this.appId, this.description, this.animationMilliseconds, this.imageSeconds, this.items, this.conditions, });


  List<Object?> get props => [appId, description, animationMilliseconds, imageSeconds, items, conditions, ];

  @override
  String toString() {
    String itemsCsv = (items == null) ? '' : items!.join(', ');

    return 'FaderEntity{appId: $appId, description: $description, animationMilliseconds: $animationMilliseconds, imageSeconds: $imageSeconds, items: ListedItem[] { $itemsCsv }, conditions: $conditions}';
  }

  static FaderEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var itemsFromMap;
    itemsFromMap = map['items'];
    var itemsList;
    if (itemsFromMap != null)
      itemsList = (map['items'] as List<dynamic>)
        .map((dynamic item) =>
        ListedItemEntity.fromMap(item as Map)!)
        .toList();
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

    return FaderEntity(
      appId: map['appId'], 
      description: map['description'], 
      animationMilliseconds: int.tryParse(map['animationMilliseconds'].toString()), 
      imageSeconds: int.tryParse(map['imageSeconds'].toString()), 
      items: itemsList, 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? itemsListMap = items != null 
        ? items!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (animationMilliseconds != null) theDocument["animationMilliseconds"] = animationMilliseconds;
      else theDocument["animationMilliseconds"] = null;
    if (imageSeconds != null) theDocument["imageSeconds"] = imageSeconds;
      else theDocument["imageSeconds"] = null;
    if (items != null) theDocument["items"] = itemsListMap;
      else theDocument["items"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static FaderEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

