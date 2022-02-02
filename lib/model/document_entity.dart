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
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class DocumentEntity {
  final String? appId;
  final String? name;
  final int? documentRenderer;
  final String? content;
  final double? padding;
  final List<DocumentItemEntity>? images;
  final BackgroundEntity? background;
  final StorageConditionsEntity? conditions;

  DocumentEntity({this.appId, this.name, this.documentRenderer, this.content, this.padding, this.images, this.background, this.conditions, });


  List<Object?> get props => [appId, name, documentRenderer, content, padding, images, background, conditions, ];

  @override
  String toString() {
    String imagesCsv = (images == null) ? '' : images!.join(', ');

    return 'DocumentEntity{appId: $appId, name: $name, documentRenderer: $documentRenderer, content: $content, padding: $padding, images: DocumentItem[] { $imagesCsv }, background: $background, conditions: $conditions}';
  }

  static DocumentEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var imagesFromMap;
    imagesFromMap = map['images'];
    var imagesList;
    if (imagesFromMap != null)
      imagesList = (map['images'] as List<dynamic>)
        .map((dynamic item) =>
        DocumentItemEntity.fromMap(item as Map)!)
        .toList();
    var backgroundFromMap;
    backgroundFromMap = map['background'];
    if (backgroundFromMap != null)
      backgroundFromMap = BackgroundEntity.fromMap(backgroundFromMap);
    var conditionsFromMap;
    conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null)
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap);

    return DocumentEntity(
      appId: map['appId'], 
      name: map['name'], 
      documentRenderer: map['documentRenderer'], 
      content: map['content'], 
      padding: double.tryParse(map['padding'].toString()), 
      images: imagesList, 
      background: backgroundFromMap, 
      conditions: conditionsFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? imagesListMap = images != null 
        ? images!.map((item) => item.toDocument()).toList()
        : null;
    final Map<String, dynamic>? backgroundMap = background != null 
        ? background!.toDocument()
        : null;
    final Map<String, dynamic>? conditionsMap = conditions != null 
        ? conditions!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
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
    if (background != null) theDocument["background"] = backgroundMap;
      else theDocument["background"] = null;
    if (conditions != null) theDocument["conditions"] = conditionsMap;
      else theDocument["conditions"] = null;
    return theDocument;
  }

  static DocumentEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

