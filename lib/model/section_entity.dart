/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core/tools/common_tools.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class SectionEntity {
  final String title;
  final String description;
  final String imageId;
  final int imagePositionRelative;
  final int imageAlignment;
  final double imageWidth;
  final List<LinkEntity> links;

  SectionEntity({this.title, this.description, this.imageId, this.imagePositionRelative, this.imageAlignment, this.imageWidth, this.links, });


  List<Object> get props => [title, description, imageId, imagePositionRelative, imageAlignment, imageWidth, links, ];

  @override
  String toString() {
    String linksCsv = (links == null) ? '' : links.join(', ');

    return 'SectionEntity{title: $title, description: $description, imageId: $imageId, imagePositionRelative: $imagePositionRelative, imageAlignment: $imageAlignment, imageWidth: $imageWidth, links: Link[] { $linksCsv }}';
  }

  static SectionEntity fromMap(Map map) {
    if (map == null) return null;

    var linksFromMap;
    linksFromMap = map['links'];
    var linksList;
    if (linksFromMap != null)
      linksList = (map['links'] as List<dynamic>)
        .map((dynamic item) =>
        LinkEntity.fromMap(item as Map))
        .toList();

    return SectionEntity(
      title: map['title'], 
      description: map['description'], 
      imageId: map['imageId'], 
      imagePositionRelative: map['imagePositionRelative'], 
      imageAlignment: map['imageAlignment'], 
      imageWidth: double.tryParse(map['imageWidth'].toString()), 
      links: linksList, 
    );
  }

  Map<String, Object> toDocument() {
    final List<Map<String, dynamic>> linksListMap = links != null 
        ? links.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object> theDocument = HashMap();
    if (title != null) theDocument["title"] = title;
      else theDocument["title"] = null;
    if (description != null) theDocument["description"] = description;
      else theDocument["description"] = null;
    if (imageId != null) theDocument["imageId"] = imageId;
      else theDocument["imageId"] = null;
    if (imagePositionRelative != null) theDocument["imagePositionRelative"] = imagePositionRelative;
      else theDocument["imagePositionRelative"] = null;
    if (imageAlignment != null) theDocument["imageAlignment"] = imageAlignment;
      else theDocument["imageAlignment"] = null;
    if (imageWidth != null) theDocument["imageWidth"] = imageWidth;
      else theDocument["imageWidth"] = null;
    if (links != null) theDocument["links"] = linksListMap;
      else theDocument["links"] = null;
    return theDocument;
  }

  static SectionEntity fromJsonString(String json) {
    Map<String, dynamic> generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

}

