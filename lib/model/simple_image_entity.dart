/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';

class SimpleImageEntity {
  final String appId;
  final String title;
  final String imageId;

  SimpleImageEntity({this.appId, this.title, this.imageId, });

  List<Object> get props => [appId, title, imageId, ];

  @override
  String toString() {
    return 'SimpleImageEntity{appId: $appId, title: $title, imageId: $imageId}';
  }

  static SimpleImageEntity fromMap(Map map) {
    if (map == null) return null;

    return SimpleImageEntity(
      appId: map['appId'], 
      title: map['title'], 
      imageId: map['imageId'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (imageId != null) theDocument["imageId"] = imageId;
      else theDocument["imageId"] = null;
    return theDocument;
  }

  static SimpleImageEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

