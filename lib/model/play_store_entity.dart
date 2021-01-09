/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class PlayStoreEntity {
  final String appId;
  final String description;
  final String itemBackgroundId;
  final ConditionsSimpleEntity conditions;

  PlayStoreEntity({this.appId, this.description, this.itemBackgroundId, this.conditions, });


  List<Object> get props => [appId, description, itemBackgroundId, conditions, ];

  @override
  String toString() {
    return 'PlayStoreEntity{appId: $appId, description: $description, itemBackgroundId: $itemBackgroundId, conditions: $conditions}';
  }

  static PlayStoreEntity fromMap(Map map) {
    if (map == null) return null;

    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = ConditionsSimpleEntity.fromMap(conditionsFromMap);

    return PlayStoreEntity(
      appId: map['appId'], 
      description: map['description'], 
      itemBackgroundId: map['itemBackgroundId'], 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object> toDocument() {
    final Map<String, dynamic> conditionsMap = conditions != null 
        ? conditions.toDocument()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (itemBackgroundId != null) theDocument["itemBackgroundId"] = itemBackgroundId;
      else theDocument["itemBackgroundId"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static PlayStoreEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

