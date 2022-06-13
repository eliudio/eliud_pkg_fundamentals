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

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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


import 'package:eliud_pkg_fundamentals/model/tutorial_entry_entity.dart';

import 'package:eliud_core/tools/random.dart';



class TutorialEntryModel implements ModelBase {
  String documentID;
  String? description;
  PlatformMediumModel? image;
  String? code;

  TutorialEntryModel({required this.documentID, this.description, this.image, this.code, })  {
    assert(documentID != null);
  }

  TutorialEntryModel copyWith({String? documentID, String? description, PlatformMediumModel? image, String? code, }) {
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
  Future<String> toRichJsonString({String? appId}) async {
    var document = toEntity(appId: appId).toDocument();
    document['documentID'] = documentID;
    if ((image != null) && (image!.url != null)) {
      var url = image!.url!;
      var uriurl = Uri.parse(url);
      final response = await http.get(uriurl);
      var bytes = response.bodyBytes.toList();
      document['image-extract'] = bytes.toList();
    }

    return jsonEncode(document);
  }

  @override
  String toString() {
    return 'TutorialEntryModel{documentID: $documentID, description: $description, image: $image, code: $code}';
  }

  TutorialEntryEntity toEntity({String? appId}) {
    return TutorialEntryEntity(
          description: (description != null) ? description : null, 
          imageId: (image != null) ? image!.documentID : null, 
          code: (code != null) ? code : null, 
    );
  }

  static Future<TutorialEntryModel?> fromEntity(String documentID, TutorialEntryEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return TutorialEntryModel(
          documentID: documentID, 
          description: entity.description, 
          code: entity.code, 
    );
  }

  static Future<TutorialEntryModel?> fromEntityPlus(String documentID, TutorialEntryEntity? entity, { String? appId}) async {
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
    return TutorialEntryModel(
          documentID: documentID, 
          description: entity.description, 
          image: imageHolder, 
          code: entity.code, 
    );
  }

}

