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

import 'package:eliud_core/core/global_data.dart';
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


import 'package:eliud_pkg_fundamentals/model/simple_text_entity.dart';

import 'package:eliud_core/tools/random.dart';

enum SimpleTextAlign {
  Left, Center, Right, End, Justify, Start, Unknown
}


SimpleTextAlign toSimpleTextAlign(int index) {
  switch (index) {
    case 0: return SimpleTextAlign.Left;
    case 1: return SimpleTextAlign.Center;
    case 2: return SimpleTextAlign.Right;
    case 3: return SimpleTextAlign.End;
    case 4: return SimpleTextAlign.Justify;
    case 5: return SimpleTextAlign.Start;
  }
  return SimpleTextAlign.Unknown;
}


class SimpleTextModel {
  String documentID;
  String appId;
  String title;
  String text;
  ConditionsSimpleModel conditions;
  SimpleTextAlign textAlign;

  SimpleTextModel({this.documentID, this.appId, this.title, this.text, this.conditions, this.textAlign, })  {
    assert(documentID != null);
  }

  SimpleTextModel copyWith({String documentID, String appId, String title, String text, ConditionsSimpleModel conditions, SimpleTextAlign textAlign, }) {
    return SimpleTextModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, text: text ?? this.text, conditions: conditions ?? this.conditions, textAlign: textAlign ?? this.textAlign, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ text.hashCode ^ conditions.hashCode ^ textAlign.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is SimpleTextModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          text == other.text &&
          conditions == other.conditions &&
          textAlign == other.textAlign;

  @override
  String toString() {
    return 'SimpleTextModel{documentID: $documentID, appId: $appId, title: $title, text: $text, conditions: $conditions, textAlign: $textAlign}';
  }

  SimpleTextEntity toEntity({String appId}) {
    return SimpleTextEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          text: (text != null) ? text : null, 
          conditions: (conditions != null) ? conditions.toEntity(appId: appId) : null, 
          textAlign: (textAlign != null) ? textAlign.index : null, 
    );
  }

  static SimpleTextModel fromEntity(String documentID, SimpleTextEntity entity) {
    if (entity == null) return null;
    return SimpleTextModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          text: entity.text, 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
          textAlign: toSimpleTextAlign(entity.textAlign), 
    );
  }

  static Future<SimpleTextModel> fromEntityPlus(String documentID, SimpleTextEntity entity, { String appId}) async {
    if (entity == null) return null;

    return SimpleTextModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          text: entity.text, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
          textAlign: toSimpleTextAlign(entity.textAlign), 
    );
  }

}
