/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'package:eliud_pkg_fundamentals/model/section_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum RelativeImagePosition {
  Behind, InFront, Below, Above, Aside, Unknown
}

enum SectionImageAlignment {
  Left, Center, Right, Unknown
}


RelativeImagePosition toRelativeImagePosition(int? index) {
  switch (index) {
    case 0: return RelativeImagePosition.Behind;
    case 1: return RelativeImagePosition.InFront;
    case 2: return RelativeImagePosition.Below;
    case 3: return RelativeImagePosition.Above;
    case 4: return RelativeImagePosition.Aside;
  }
  return RelativeImagePosition.Unknown;
}

SectionImageAlignment toSectionImageAlignment(int? index) {
  switch (index) {
    case 0: return SectionImageAlignment.Left;
    case 1: return SectionImageAlignment.Center;
    case 2: return SectionImageAlignment.Right;
  }
  return SectionImageAlignment.Unknown;
}


class SectionModel implements ModelBase {
  String documentID;
  String? title;
  String? description;
  PlatformMediumModel? image;
  RelativeImagePosition? imagePositionRelative;
  SectionImageAlignment? imageAlignment;

  // Width of the image
  double? imageWidth;
  List<LinkModel>? links;

  SectionModel({required this.documentID, this.title, this.description, this.image, this.imagePositionRelative, this.imageAlignment, this.imageWidth, this.links, })  {
    assert(documentID != null);
  }

  SectionModel copyWith({String? documentID, String? title, String? description, PlatformMediumModel? image, RelativeImagePosition? imagePositionRelative, SectionImageAlignment? imageAlignment, double? imageWidth, List<LinkModel>? links, }) {
    return SectionModel(documentID: documentID ?? this.documentID, title: title ?? this.title, description: description ?? this.description, image: image ?? this.image, imagePositionRelative: imagePositionRelative ?? this.imagePositionRelative, imageAlignment: imageAlignment ?? this.imageAlignment, imageWidth: imageWidth ?? this.imageWidth, links: links ?? this.links, );
  }

  @override
  int get hashCode => documentID.hashCode ^ title.hashCode ^ description.hashCode ^ image.hashCode ^ imagePositionRelative.hashCode ^ imageAlignment.hashCode ^ imageWidth.hashCode ^ links.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is SectionModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          title == other.title &&
          description == other.description &&
          image == other.image &&
          imagePositionRelative == other.imagePositionRelative &&
          imageAlignment == other.imageAlignment &&
          imageWidth == other.imageWidth &&
          ListEquality().equals(links, other.links);

  @override
  String toString() {
    String linksCsv = (links == null) ? '' : links!.join(', ');

    return 'SectionModel{documentID: $documentID, title: $title, description: $description, image: $image, imagePositionRelative: $imagePositionRelative, imageAlignment: $imageAlignment, imageWidth: $imageWidth, links: Link[] { $linksCsv }}';
  }

  SectionEntity toEntity({String? appId}) {
    return SectionEntity(
          title: (title != null) ? title : null, 
          description: (description != null) ? description : null, 
          imageId: (image != null) ? image!.documentID : null, 
          imagePositionRelative: (imagePositionRelative != null) ? imagePositionRelative!.index : null, 
          imageAlignment: (imageAlignment != null) ? imageAlignment!.index : null, 
          imageWidth: (imageWidth != null) ? imageWidth : null, 
          links: (links != null) ? links
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
    );
  }

  static Future<SectionModel?> fromEntity(String documentID, SectionEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return SectionModel(
          documentID: documentID, 
          title: entity.title, 
          description: entity.description, 
          imagePositionRelative: toRelativeImagePosition(entity.imagePositionRelative), 
          imageAlignment: toSectionImageAlignment(entity.imageAlignment), 
          imageWidth: entity.imageWidth, 
          links: 
            entity.links == null ? null : List<LinkModel>.from(await Future.wait(entity. links
            !.map((item) {
            counter++;
              return LinkModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
    );
  }

  static Future<SectionModel?> fromEntityPlus(String documentID, SectionEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    PlatformMediumModel? imageHolder;
    if (entity.imageId != null) {
      try {
          imageHolder = await platformMediumRepository(appId: appId)!.get(entity.imageId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise image');
        print('Error whilst retrieving platformMedium with id ${entity.imageId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return SectionModel(
          documentID: documentID, 
          title: entity.title, 
          description: entity.description, 
          image: imageHolder, 
          imagePositionRelative: toRelativeImagePosition(entity.imagePositionRelative), 
          imageAlignment: toSectionImageAlignment(entity.imageAlignment), 
          imageWidth: entity.imageWidth, 
          links: 
            entity. links == null ? null : List<LinkModel>.from(await Future.wait(entity. links
            !.map((item) {
            counter++;
            return LinkModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
    );
  }

}

