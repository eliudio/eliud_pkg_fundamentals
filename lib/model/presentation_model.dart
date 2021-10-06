/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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


import 'package:eliud_pkg_fundamentals/model/presentation_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum PresentationRelativeImagePosition {
  Behind, InFront, Below, Above, Aside, Unknown
}

enum PresentationImageAlignment {
  Left, Center, Right, Unknown
}


PresentationRelativeImagePosition toPresentationRelativeImagePosition(int? index) {
  switch (index) {
    case 0: return PresentationRelativeImagePosition.Behind;
    case 1: return PresentationRelativeImagePosition.InFront;
    case 2: return PresentationRelativeImagePosition.Below;
    case 3: return PresentationRelativeImagePosition.Above;
    case 4: return PresentationRelativeImagePosition.Aside;
  }
  return PresentationRelativeImagePosition.Unknown;
}

PresentationImageAlignment toPresentationImageAlignment(int? index) {
  switch (index) {
    case 0: return PresentationImageAlignment.Left;
    case 1: return PresentationImageAlignment.Center;
    case 2: return PresentationImageAlignment.Right;
  }
  return PresentationImageAlignment.Unknown;
}


class PresentationModel {
  String? documentID;
  String? appId;
  String? title;
  List<BodyComponentModel>? bodyComponents;
  PlatformMediumModel? image;
  PresentationRelativeImagePosition? imagePositionRelative;
  PresentationImageAlignment? imageAlignment;

  // Width of the image
  double? imageWidth;
  ConditionsSimpleModel? conditions;

  PresentationModel({this.documentID, this.appId, this.title, this.bodyComponents, this.image, this.imagePositionRelative, this.imageAlignment, this.imageWidth, this.conditions, })  {
    assert(documentID != null);
  }

  PresentationModel copyWith({String? documentID, String? appId, String? title, List<BodyComponentModel>? bodyComponents, PlatformMediumModel? image, PresentationRelativeImagePosition? imagePositionRelative, PresentationImageAlignment? imageAlignment, double? imageWidth, ConditionsSimpleModel? conditions, }) {
    return PresentationModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, bodyComponents: bodyComponents ?? this.bodyComponents, image: image ?? this.image, imagePositionRelative: imagePositionRelative ?? this.imagePositionRelative, imageAlignment: imageAlignment ?? this.imageAlignment, imageWidth: imageWidth ?? this.imageWidth, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ bodyComponents.hashCode ^ image.hashCode ^ imagePositionRelative.hashCode ^ imageAlignment.hashCode ^ imageWidth.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is PresentationModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          ListEquality().equals(bodyComponents, other.bodyComponents) &&
          image == other.image &&
          imagePositionRelative == other.imagePositionRelative &&
          imageAlignment == other.imageAlignment &&
          imageWidth == other.imageWidth &&
          conditions == other.conditions;

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'PresentationModel{documentID: $documentID, appId: $appId, title: $title, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, image: $image, imagePositionRelative: $imagePositionRelative, imageAlignment: $imageAlignment, imageWidth: $imageWidth, conditions: $conditions}';
  }

  PresentationEntity toEntity({String? appId}) {
    return PresentationEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          bodyComponents: (bodyComponents != null) ? bodyComponents
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          imageId: (image != null) ? image!.documentID : null, 
          imagePositionRelative: (imagePositionRelative != null) ? imagePositionRelative!.index : null, 
          imageAlignment: (imageAlignment != null) ? imageAlignment!.index : null, 
          imageWidth: (imageWidth != null) ? imageWidth : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static PresentationModel? fromEntity(String documentID, PresentationEntity? entity) {
    if (entity == null) return null;
    var counter = 0;
    return PresentationModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity.bodyComponents == null ? null :
            entity.bodyComponents
            !.map((item) {
              counter++; 
              return BodyComponentModel.fromEntity(counter.toString(), item)!;
            })
            .toList(), 
          imagePositionRelative: toPresentationRelativeImagePosition(entity.imagePositionRelative), 
          imageAlignment: toPresentationImageAlignment(entity.imageAlignment), 
          imageWidth: entity.imageWidth, 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<PresentationModel?> fromEntityPlus(String documentID, PresentationEntity? entity, { String? appId}) async {
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
    return PresentationModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity. bodyComponents == null ? null : List<BodyComponentModel>.from(await Future.wait(entity. bodyComponents
            !.map((item) {
            counter++;
            return BodyComponentModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          image: imageHolder, 
          imagePositionRelative: toPresentationRelativeImagePosition(entity.imagePositionRelative), 
          imageAlignment: toPresentationImageAlignment(entity.imageAlignment), 
          imageWidth: entity.imageWidth, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

