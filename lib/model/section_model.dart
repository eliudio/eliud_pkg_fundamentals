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
import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import '../model/abstract_repository_singleton.dart';
import 'repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import '../model/entity_export.dart';


import 'section_entity.dart';
import 'package:eliud_core/tools/random.dart';

enum RelativeImagePosition {
  Behind, InFront, Below, Above, Aside, Unknown
}

enum SectionImageAlignment {
  Left, Center, Right, Unknown
}


RelativeImagePosition toRelativeImagePosition(int index) {
  switch (index) {
    case 0: return RelativeImagePosition.Behind;
    case 1: return RelativeImagePosition.InFront;
    case 2: return RelativeImagePosition.Below;
    case 3: return RelativeImagePosition.Above;
    case 4: return RelativeImagePosition.Aside;
  }
  return RelativeImagePosition.Unknown;
}

SectionImageAlignment toSectionImageAlignment(int index) {
  switch (index) {
    case 0: return SectionImageAlignment.Left;
    case 1: return SectionImageAlignment.Center;
    case 2: return SectionImageAlignment.Right;
  }
  return SectionImageAlignment.Unknown;
}


class SectionModel {
  String documentID;
  String title;
  String description;
  ImageModel image;
  RelativeImagePosition imagePositionRelative;
  SectionImageAlignment imageAlignment;

  // Width of the image
  double imageWidth;
  List<LinkModel> links;

  SectionModel({this.documentID, this.title, this.description, this.image, this.imagePositionRelative, this.imageAlignment, this.imageWidth, this.links, })  {
    assert(documentID != null);
  }

  SectionModel copyWith({String documentID, String title, String description, ImageModel image, RelativeImagePosition imagePositionRelative, SectionImageAlignment imageAlignment, double imageWidth, List<LinkModel> links, }) {
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
    String linksCsv = (links == null) ? '' : links.join(', ');

    return 'SectionModel{documentID: $documentID, title: $title, description: $description, image: $image, imagePositionRelative: $imagePositionRelative, imageAlignment: $imageAlignment, imageWidth: $imageWidth, links: Link[] { $linksCsv }}';
  }

  SectionEntity toEntity() {
    return SectionEntity(
          title: (title != null) ? title : null, 
          description: (description != null) ? description : null, 
          imageId: (image != null) ? image.documentID : null, 
          imagePositionRelative: (imagePositionRelative != null) ? imagePositionRelative.index : null, 
          imageAlignment: (imageAlignment != null) ? imageAlignment.index : null, 
          imageWidth: (imageWidth != null) ? imageWidth : null, 
          links: (links != null) ? links
            .map((item) => item.toEntity())
            .toList() : null, 
    );
  }

  static SectionModel fromEntity(String documentID, SectionEntity entity) {
    if (entity == null) return null;
    return SectionModel(
          documentID: documentID, 
          title: entity.title, 
          description: entity.description, 
          imagePositionRelative: toRelativeImagePosition(entity.imagePositionRelative), 
          imageAlignment: toSectionImageAlignment(entity.imageAlignment), 
          imageWidth: entity.imageWidth, 
          links: 
            entity. links
            .map((item) => LinkModel.fromEntity(newRandomKey(), item))
            .toList(), 
    );
  }

  static Future<SectionModel> fromEntityPlus(String documentID, SectionEntity entity) async {
    if (entity == null) return null;

    ImageModel imageHolder;
    if (entity.imageId != null) {
      try {
        await imageRepository().get(entity.imageId).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return SectionModel(
          documentID: documentID, 
          title: entity.title, 
          description: entity.description, 
          image: imageHolder, 
          imagePositionRelative: toRelativeImagePosition(entity.imagePositionRelative), 
          imageAlignment: toSectionImageAlignment(entity.imageAlignment), 
          imageWidth: entity.imageWidth, 
          links: 
            new List<LinkModel>.from(await Future.wait(entity. links
            .map((item) => LinkModel.fromEntityPlus(newRandomKey(), item))
            .toList())), 
    );
  }

}

