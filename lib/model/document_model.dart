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


import 'package:eliud_pkg_fundamentals/model/document_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum DocumentRenderer {
  flutter_html, flutter_widget_from_html_not_web, webview_flutter_no_list_not_web, flutter_markdown, dynamic_widget, Unknown
}


DocumentRenderer toDocumentRenderer(int index) {
  switch (index) {
    case 0: return DocumentRenderer.flutter_html;
    case 1: return DocumentRenderer.flutter_widget_from_html_not_web;
    case 2: return DocumentRenderer.webview_flutter_no_list_not_web;
    case 3: return DocumentRenderer.flutter_markdown;
    case 4: return DocumentRenderer.dynamic_widget;
  }
  return DocumentRenderer.Unknown;
}


class DocumentModel {
  String documentID;
  String appId;
  String name;

  // Document renderer. Different renderers offer different functionality
  DocumentRenderer documentRenderer;

  // Document content
  String content;

  // Left, right, top and bottom padding.
  double padding;
  List<DocumentItemModel> images;
  BackgroundModel background;

  DocumentModel({this.documentID, this.appId, this.name, this.documentRenderer, this.content, this.padding, this.images, this.background, })  {
    assert(documentID != null);
  }

  DocumentModel copyWith({String documentID, String appId, String name, DocumentRenderer documentRenderer, String content, double padding, List<DocumentItemModel> images, BackgroundModel background, }) {
    return DocumentModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, documentRenderer: documentRenderer ?? this.documentRenderer, content: content ?? this.content, padding: padding ?? this.padding, images: images ?? this.images, background: background ?? this.background, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ documentRenderer.hashCode ^ content.hashCode ^ padding.hashCode ^ images.hashCode ^ background.hashCode;

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
          background == other.background;

  @override
  String toString() {
    String imagesCsv = (images == null) ? '' : images.join(', ');

    return 'DocumentModel{documentID: $documentID, appId: $appId, name: $name, documentRenderer: $documentRenderer, content: $content, padding: $padding, images: DocumentItem[] { $imagesCsv }, background: $background}';
  }

  DocumentEntity toEntity(String appId) {
    return DocumentEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          documentRenderer: (documentRenderer != null) ? documentRenderer.index : null, 
          content: (content != null) ? content : null, 
          padding: (padding != null) ? padding : null, 
          images: (images != null) ? images
            .map((item) => item.toEntity(appId))
            .toList() : null, 
          backgroundId: (background != null) ? background.documentID : null, 
    );
  }

  static DocumentModel fromEntity(String documentID, DocumentEntity entity) {
    if (entity == null) return null;
    return DocumentModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          documentRenderer: toDocumentRenderer(entity.documentRenderer), 
          content: entity.content, 
          padding: entity.padding, 
          images: 
            entity. images
            .map((item) => DocumentItemModel.fromEntity(newRandomKey(), item))
            .toList(), 
    );
  }

  static Future<DocumentModel> fromEntityPlus(String documentID, DocumentEntity entity) async {
    if (entity == null) return null;

    BackgroundModel backgroundHolder;
    if (entity.backgroundId != null) {
      try {
        await backgroundRepository(appID: entity.appId).get(entity.backgroundId).then((val) {
          backgroundHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return DocumentModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          documentRenderer: toDocumentRenderer(entity.documentRenderer), 
          content: entity.content, 
          padding: entity.padding, 
          images: 
            new List<DocumentItemModel>.from(await Future.wait(entity. images
            .map((item) => DocumentItemModel.fromEntityPlus(newRandomKey(), item))
            .toList())), 
          background: backgroundHolder, 
    );
  }

}

