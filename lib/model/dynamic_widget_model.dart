/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_model.dart
                       
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


import 'package:eliud_pkg_fundamentals/model/dynamic_widget_entity.dart';

import 'package:eliud_core/tools/random.dart';



class DynamicWidgetModel implements ModelBase, WithAppId {
  String documentID;
  String appId;
  String? description;

  // Document content
  String? content;
  BackgroundModel? background;
  StorageConditionsModel? conditions;

  DynamicWidgetModel({required this.documentID, required this.appId, this.description, this.content, this.background, this.conditions, })  {
    assert(documentID != null);
  }

  DynamicWidgetModel copyWith({String? documentID, String? appId, String? description, String? content, BackgroundModel? background, StorageConditionsModel? conditions, }) {
    return DynamicWidgetModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, content: content ?? this.content, background: background ?? this.background, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ content.hashCode ^ background.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DynamicWidgetModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          content == other.content &&
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
    return 'DynamicWidgetModel{documentID: $documentID, appId: $appId, description: $description, content: $content, background: $background, conditions: $conditions}';
  }

  DynamicWidgetEntity toEntity({String? appId}) {
    return DynamicWidgetEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          content: (content != null) ? content : null, 
          background: (background != null) ? background!.toEntity(appId: appId) : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<DynamicWidgetModel?> fromEntity(String documentID, DynamicWidgetEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return DynamicWidgetModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          content: entity.content, 
          background: 
            await BackgroundModel.fromEntity(entity.background), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<DynamicWidgetModel?> fromEntityPlus(String documentID, DynamicWidgetEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return DynamicWidgetModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          content: entity.content, 
          background: 
            await BackgroundModel.fromEntityPlus(entity.background, appId: appId), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

