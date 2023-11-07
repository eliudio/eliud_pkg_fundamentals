/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/simple_text_entity.dart';

enum SimpleTextAlign { left, center, right, end, justify, start, unknown }

SimpleTextAlign toSimpleTextAlign(int? index) {
  switch (index) {
    case 0:
      return SimpleTextAlign.left;
    case 1:
      return SimpleTextAlign.center;
    case 2:
      return SimpleTextAlign.right;
    case 3:
      return SimpleTextAlign.end;
    case 4:
      return SimpleTextAlign.justify;
    case 5:
      return SimpleTextAlign.start;
  }
  return SimpleTextAlign.unknown;
}

class SimpleTextModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals';
  static const String id = 'simpleTexts';

  @override
  String documentID;
  @override
  String appId;
  String? description;
  String? title;
  String? text;
  StorageConditionsModel? conditions;
  SimpleTextAlign? textAlign;

  SimpleTextModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.title,
    this.text,
    this.conditions,
    this.textAlign,
  });

  @override
  SimpleTextModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? title,
    String? text,
    StorageConditionsModel? conditions,
    SimpleTextAlign? textAlign,
  }) {
    return SimpleTextModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      title: title ?? this.title,
      text: text ?? this.text,
      conditions: conditions ?? this.conditions,
      textAlign: textAlign ?? this.textAlign,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      title.hashCode ^
      text.hashCode ^
      conditions.hashCode ^
      textAlign.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SimpleTextModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          title == other.title &&
          text == other.text &&
          conditions == other.conditions &&
          textAlign == other.textAlign;

  @override
  String toString() {
    return 'SimpleTextModel{documentID: $documentID, appId: $appId, description: $description, title: $title, text: $text, conditions: $conditions, textAlign: $textAlign}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  SimpleTextEntity toEntity({String? appId}) {
    return SimpleTextEntity(
      appId: appId,
      description: (description != null) ? description : null,
      title: (title != null) ? title : null,
      text: (text != null) ? text : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
      textAlign: (textAlign != null) ? textAlign!.index : null,
    );
  }

  static Future<SimpleTextModel?> fromEntity(
      String documentID, SimpleTextEntity? entity) async {
    if (entity == null) return null;
    return SimpleTextModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      title: entity.title,
      text: entity.text,
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
      textAlign: toSimpleTextAlign(entity.textAlign),
    );
  }

  static Future<SimpleTextModel?> fromEntityPlus(
      String documentID, SimpleTextEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return SimpleTextModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      title: entity.title,
      text: entity.text,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
      textAlign: toSimpleTextAlign(entity.textAlign),
    );
  }
}
