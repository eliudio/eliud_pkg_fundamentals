/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'package:eliud_pkg_fundamentals/model/fader_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum FaderAnimation {
  None, Fade, Scale, Slide, Unknown
}


FaderAnimation toFaderAnimation(int index) {
  switch (index) {
    case 0: return FaderAnimation.None;
    case 1: return FaderAnimation.Fade;
    case 2: return FaderAnimation.Scale;
    case 3: return FaderAnimation.Slide;
  }
  return FaderAnimation.Unknown;
}


class FaderModel {
  String documentID;
  String appId;
  String name;

  // The animation to switch images.
  FaderAnimation animation;

  // The duration of the transition between the images
  int animationMilliseconds;

  // The time to display 1 image
  int imageSeconds;
  List<ListedItemModel> items;

  FaderModel({this.documentID, this.appId, this.name, this.animation, this.animationMilliseconds, this.imageSeconds, this.items, })  {
    assert(documentID != null);
  }

  FaderModel copyWith({String documentID, String appId, String name, FaderAnimation animation, int animationMilliseconds, int imageSeconds, List<ListedItemModel> items, }) {
    return FaderModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, animation: animation ?? this.animation, animationMilliseconds: animationMilliseconds ?? this.animationMilliseconds, imageSeconds: imageSeconds ?? this.imageSeconds, items: items ?? this.items, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ animation.hashCode ^ animationMilliseconds.hashCode ^ imageSeconds.hashCode ^ items.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is FaderModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          animation == other.animation &&
          animationMilliseconds == other.animationMilliseconds &&
          imageSeconds == other.imageSeconds &&
          ListEquality().equals(items, other.items);

  @override
  String toString() {
    String itemsCsv = (items == null) ? '' : items.join(', ');

    return 'FaderModel{documentID: $documentID, appId: $appId, name: $name, animation: $animation, animationMilliseconds: $animationMilliseconds, imageSeconds: $imageSeconds, items: ListedItem[] { $itemsCsv }}';
  }

  FaderEntity toEntity(String appId) {
    return FaderEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          animation: (animation != null) ? animation.index : null, 
          animationMilliseconds: (animationMilliseconds != null) ? animationMilliseconds : null, 
          imageSeconds: (imageSeconds != null) ? imageSeconds : null, 
          items: (items != null) ? items
            .map((item) => item.toEntity(appId))
            .toList() : null, 
    );
  }

  static FaderModel fromEntity(String documentID, FaderEntity entity) {
    if (entity == null) return null;
    return FaderModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          animation: toFaderAnimation(entity.animation), 
          animationMilliseconds: entity.animationMilliseconds, 
          imageSeconds: entity.imageSeconds, 
          items: 
            entity. items
            .map((item) => ListedItemModel.fromEntity(newRandomKey(), item))
            .toList(), 
    );
  }

  static Future<FaderModel> fromEntityPlus(String documentID, FaderEntity entity) async {
    if (entity == null) return null;

    return FaderModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          animation: toFaderAnimation(entity.animation), 
          animationMilliseconds: entity.animationMilliseconds, 
          imageSeconds: entity.imageSeconds, 
          items: 
            new List<ListedItemModel>.from(await Future.wait(entity. items
            .map((item) => ListedItemModel.fromEntityPlus(newRandomKey(), item))
            .toList())), 
    );
  }

}

