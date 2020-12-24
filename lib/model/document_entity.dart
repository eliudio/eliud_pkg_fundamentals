/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class DocumentEntity {
  final String appId;
  final String name;
  final int documentRenderer;
  final String content;
  final double padding;
  final List<DocumentItemEntity> images;
  final String backgroundId;

  DocumentEntity({this.appId, this.name, this.documentRenderer, this.content, this.padding, this.images, this.backgroundId, });


  List<Object> get props => [appId, name, documentRenderer, content, padding, images, backgroundId, ];

  @override
  String toString() {
    String imagesCsv = (images == null) ? '' : images.join(', ');

    return 'DocumentEntity{appId: $appId, name: $name, documentRenderer: $documentRenderer, content: $content, padding: $padding, images: DocumentItem[] { $imagesCsv }, backgroundId: $backgroundId}';
  }

  static DocumentEntity fromMap(Map map) {
    if (map == null) return null;

    final imagesList = (map['images'] as List<dynamic>)
        .map((dynamic item) =>
        DocumentItemEntity.fromMap(item as Map))
        .toList();

    return DocumentEntity(
      appId: map['appId'], 
      name: map['name'], 
      documentRenderer: map['documentRenderer'], 
      content: map['content'], 
      padding: double.tryParse(map['padding'].toString()), 
      images: imagesList, 
      backgroundId: map['backgroundId'], 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> imagesListMap = images != null 
        ? images.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (appId != null) theDocument["appId"] = appId;
      else theDocument["appId"] = null;
    if (name != null) theDocument["name"] = name;
      else theDocument["name"] = null;
    if (documentRenderer != null) theDocument["documentRenderer"] = documentRenderer;
      else theDocument["documentRenderer"] = null;
    if (content != null) theDocument["content"] = content;
      else theDocument["content"] = null;
    if (padding != null) theDocument["padding"] = padding;
      else theDocument["padding"] = null;
    if (images != null) theDocument["images"] = imagesListMap;
      else theDocument["images"] = null;
    if (backgroundId != null) theDocument["backgroundId"] = backgroundId;
      else theDocument["backgroundId"] = null;
    return theDocument;
  }

  static DocumentEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

