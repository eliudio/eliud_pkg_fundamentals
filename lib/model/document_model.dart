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

enum DocumentRenderer {
  flutter_markdown, dynamic_widget, Unknown
}


DocumentRenderer toDocumentRenderer(int? index) {
  switch (index) {
    case 0: return DocumentRenderer.flutter_markdown;
    case 1: return DocumentRenderer.dynamic_widget;
  }
  return DocumentRenderer.Unknown;
}


class DocumentModel {
  String? documentID;
  String? appId;
  String? name;

  // Document renderer. Different renderers offer different functionality
  DocumentRenderer? documentRenderer;

  // Document content
  String? content;

  // Left, right, top and bottom padding.
  double? padding;
  List<DocumentItemModel>? images;
  BackgroundModel? background;
  ConditionsSimpleModel? conditions;

  DocumentModel({this.documentID, this.appId, this.name, this.documentRenderer, this.content, this.padding, this.images, this.background, this.conditions, })  {
    assert(documentID != null);
  }

  DocumentModel copyWith({String? documentID, String? appId, String? name, DocumentRenderer? documentRenderer, String? content, double? padding, List<DocumentItemModel>? images, BackgroundModel? background, ConditionsSimpleModel? conditions, }) {
    return DocumentModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, documentRenderer: documentRenderer ?? this.documentRenderer, content: content ?? this.content, padding: padding ?? this.padding, images: images ?? this.images, background: background ?? this.background, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ documentRenderer.hashCode ^ content.hashCode ^ padding.hashCode ^ images.hashCode ^ background.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DocumentModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          documentRenderer == other.documentRenderer &&
          content == other.content &&
          padding == other.padding &&
          ListEquality().equals(images, other.images) &&
          background == other.background &&
          conditions == other.conditions;

  @override
  String toString() {
    String imagesCsv = (images == null) ? '' : images!.join(', ');

    return 'DocumentModel{documentID: $documentID, appId: $appId, name: $name, documentRenderer: $documentRenderer, content: $content, padding: $padding, images: DocumentItem[] { $imagesCsv }, background: $background, conditions: $conditions}';
  }

  DocumentEntity toEntity({String? appId}) {
    return DocumentEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          documentRenderer: (documentRenderer != null) ? documentRenderer!.index : null, 
          content: (content != null) ? content : null, 
          padding: (padding != null) ? padding : null, 
          images: (images != null) ? images
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          backgroundId: (background != null) ? background!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static DocumentModel? fromEntity(String documentID, DocumentEntity? entity) {
    if (entity == null) return null;
    return DocumentModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          documentRenderer: toDocumentRenderer(entity.documentRenderer), 
          content: entity.content, 
          padding: entity.padding, 
          images: 
            entity.images == null ? null :
            entity.images
            !.map((item) => DocumentItemModel.fromEntity(newRandomKey(), item)!)
            .toList(), 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<DocumentModel?> fromEntityPlus(String documentID, DocumentEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    BackgroundModel? backgroundHolder;
    if (entity.backgroundId != null) {
      try {
          backgroundHolder = await backgroundRepository(appId: appId)!.get(entity.backgroundId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise background');
        print('Error whilst retrieving background with id ${entity.backgroundId}');
        print('Exception: $e');
      }
    }

    return DocumentModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          documentRenderer: toDocumentRenderer(entity.documentRenderer), 
          content: entity.content, 
          padding: entity.padding, 
          images: 
            entity. images == null ? null : new List<DocumentItemModel>.from(await Future.wait(entity. images
            !.map((item) => DocumentItemModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          background: backgroundHolder, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

