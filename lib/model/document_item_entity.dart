/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class DocumentItemEntity {
  final String reference;
  final String imageId;

  DocumentItemEntity({this.reference, this.imageId, });


  List<Object> get props => [reference, imageId, ];

  @override
  String toString() {
    return 'DocumentItemEntity{reference: $reference, imageId: $imageId}';
  }

  static DocumentItemEntity fromMap(Map map) {
    if (map == null) return null;

    return DocumentItemEntity(
      reference: map['reference'], 
      imageId: map['imageId'], 
    );
  }

  Map<String, Object> toDocument() {
    Map<String, Object> theDocument = HashMap();
    if (reference != null) theDocument["reference"] = reference;
      else theDocument["reference"] = null;
    if (imageId != null) theDocument["imageId"] = imageId;
      else theDocument["imageId"] = null;
    return theDocument;
  }

  static DocumentItemEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

