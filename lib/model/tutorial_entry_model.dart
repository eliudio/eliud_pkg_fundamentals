/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'package:eliud_pkg_fundamentals/model/tutorial_entry_entity.dart';

import 'package:eliud_core/tools/random.dart';



class TutorialEntryModel {
  String documentID;
  String description;
  ImageModel image;
  String code;

  TutorialEntryModel({this.documentID, this.description, this.image, this.code, })  {
    assert(documentID != null);
  }

  TutorialEntryModel copyWith({String documentID, String description, ImageModel image, String code, }) {
    return TutorialEntryModel(documentID: documentID ?? this.documentID, description: description ?? this.description, image: image ?? this.image, code: code ?? this.code, );
  }

  @override
  int get hashCode => documentID.hashCode ^ description.hashCode ^ image.hashCode ^ code.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is TutorialEntryModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          description == other.description &&
          image == other.image &&
          code == other.code;

  @override
  String toString() {
    return 'TutorialEntryModel{documentID: $documentID, description: $description, image: $image, code: $code}';
  }

  TutorialEntryEntity toEntity() {
    return TutorialEntryEntity(
          description: (description != null) ? description : null, 
          imageId: (image != null) ? image.documentID : null, 
          code: (code != null) ? code : null, 
    );
  }

  static TutorialEntryModel fromEntity(String documentID, TutorialEntryEntity entity) {
    if (entity == null) return null;
    return TutorialEntryModel(
          documentID: documentID, 
          description: entity.description, 
          code: entity.code, 
    );
  }

  static Future<TutorialEntryModel> fromEntityPlus(String documentID, TutorialEntryEntity entity) async {
    if (entity == null) return null;

    ImageModel imageHolder;
    if (entity.imageId != null) {
      try {
        await imageRepository().get(entity.imageId).then((val) {
          imageHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return TutorialEntryModel(
          documentID: documentID, 
          description: entity.description, 
          image: imageHolder, 
          code: entity.code, 
    );
  }

}

