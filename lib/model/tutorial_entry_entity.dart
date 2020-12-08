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
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class TutorialEntryEntity {
  final String description;
  final String imageId;
  final String code;

  TutorialEntryEntity({this.description, this.imageId, this.code, });


  List<Object> get props => [description, imageId, code, ];

  @override
  String toString() {
    return 'TutorialEntryEntity{description: $description, imageId: $imageId, code: $code}';
  }

  static TutorialEntryEntity fromMap(Map map) {
    if (map == null) return null;

    return TutorialEntryEntity(
      description: map['description'], 
      imageId: map['imageId'], 
      code: map['code'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (imageId != null) theDocument["imageId"] = imageId;
      else theDocument["imageId"] = null;
    if (code != null) theDocument["code"] = code;
      else theDocument["code"] = null;
    return theDocument;
  }

  static TutorialEntryEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

