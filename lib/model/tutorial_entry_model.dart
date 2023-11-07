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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/tutorial_entry_entity.dart';

class TutorialEntryModel implements ModelBase {
  static const String packageName = 'eliud_pkg_fundamentals';
  static const String id = 'tutorialEntrys';

  @override
  String documentID;
  String? description;
  PlatformMediumModel? image;
  String? code;

  TutorialEntryModel({
    required this.documentID,
    this.description,
    this.image,
    this.code,
  });

  @override
  TutorialEntryModel copyWith({
    String? documentID,
    String? description,
    PlatformMediumModel? image,
    String? code,
  }) {
    return TutorialEntryModel(
      documentID: documentID ?? this.documentID,
      description: description ?? this.description,
      image: image ?? this.image,
      code: code ?? this.code,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      description.hashCode ^
      image.hashCode ^
      code.hashCode;

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

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (image != null) {
      referencesCollector.add(ModelReference(
          PlatformMediumModel.packageName, PlatformMediumModel.id, image!));
    }
    if (image != null) {
      referencesCollector.addAll(await image!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  TutorialEntryEntity toEntity({String? appId}) {
    return TutorialEntryEntity(
      description: (description != null) ? description : null,
      imageId: (image != null) ? image!.documentID : null,
      code: (code != null) ? code : null,
    );
  }

  static Future<TutorialEntryModel?> fromEntity(
      String documentID, TutorialEntryEntity? entity) async {
    if (entity == null) return null;
    return TutorialEntryModel(
      documentID: documentID,
      description: entity.description,
      code: entity.code,
    );
  }

  static Future<TutorialEntryModel?> fromEntityPlus(
      String documentID, TutorialEntryEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    PlatformMediumModel? imageHolder;
    if (entity.imageId != null) {
      try {
        imageHolder =
            await platformMediumRepository(appId: appId)!.get(entity.imageId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise image');
        print(
            'Error whilst retrieving platformMedium with id ${entity.imageId}');
        print('Exception: $e');
      }
    }

    return TutorialEntryModel(
      documentID: documentID,
      description: entity.description,
      image: imageHolder,
      code: entity.code,
    );
  }
}
