/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
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


import 'package:eliud_pkg_fundamentals/model/document_entity.dart';

import 'package:eliud_core/tools/random.dart';



class DocumentModel implements ModelBase, WithAppId {
  String documentID;
  String appId;
  String? description;

  // Document content
  String? content;

  // Left, right, top and bottom padding.
  double? padding;
  List<DocumentItemModel>? images;
  BackgroundModel? background;
  StorageConditionsModel? conditions;

  DocumentModel({required this.documentID, required this.appId, this.description, this.content, this.padding, this.images, this.background, this.conditions, })  {
    assert(documentID != null);
  }

  DocumentModel copyWith({String? documentID, String? appId, String? description, String? content, double? padding, List<DocumentItemModel>? images, BackgroundModel? background, StorageConditionsModel? conditions, }) {
    return DocumentModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, content: content ?? this.content, padding: padding ?? this.padding, images: images ?? this.images, background: background ?? this.background, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ content.hashCode ^ padding.hashCode ^ images.hashCode ^ background.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DocumentModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          content == other.content &&
          padding == other.padding &&
          ListEquality().equals(images, other.images) &&
          background == other.background &&
          conditions == other.conditions;

  @override
  Future<String> toRichJsonString({String? appId}) async {
    var document = toEntity(appId: appId).toDocument();
    document['documentID'] = documentID;
    return jsonEncode(document);
  }

  @override
  String toString() {
    String imagesCsv = (images == null) ? '' : images!.join(', ');

    return 'DocumentModel{documentID: $documentID, appId: $appId, description: $description, content: $content, padding: $padding, images: DocumentItem[] { $imagesCsv }, background: $background, conditions: $conditions}';
  }

  DocumentEntity toEntity({String? appId}) {
    return DocumentEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          content: (content != null) ? content : null, 
          padding: (padding != null) ? padding : null, 
          images: (images != null) ? images
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          background: (background != null) ? background!.toEntity(appId: appId) : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<DocumentModel?> fromEntity(String documentID, DocumentEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return DocumentModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          content: entity.content, 
          padding: entity.padding, 
          images: 
            entity.images == null ? null : List<DocumentItemModel>.from(await Future.wait(entity. images
            !.map((item) {
            counter++;
              return DocumentItemModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          background: 
            await BackgroundModel.fromEntity(entity.background), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<DocumentModel?> fromEntityPlus(String documentID, DocumentEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return DocumentModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          content: entity.content, 
          padding: entity.padding, 
          images: 
            entity. images == null ? null : List<DocumentItemModel>.from(await Future.wait(entity. images
            !.map((item) {
            counter++;
            return DocumentItemModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          background: 
            await BackgroundModel.fromEntityPlus(entity.background, appId: appId), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

