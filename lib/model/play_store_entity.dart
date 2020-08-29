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
import 'entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';
class PlayStoreEntity {
  final String appId;
  final String description;
  final String itemBackgroundId;

  PlayStoreEntity({this.appId, this.description, this.itemBackgroundId, });

  List<Object> get props => [appId, description, itemBackgroundId, ];

  @override
  String toString() {
    return 'PlayStoreEntity{appId: $appId, description: $description, itemBackgroundId: $itemBackgroundId}';
  }

  static PlayStoreEntity fromMap(Map map) {
    if (map == null) return null;

    return PlayStoreEntity(
      appId: map['appId'], 
      description: map['description'], 
      itemBackgroundId: map['itemBackgroundId'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (itemBackgroundId != null) theDocument["itemBackgroundId"] = itemBackgroundId;
      else theDocument["itemBackgroundId"] = null;
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

