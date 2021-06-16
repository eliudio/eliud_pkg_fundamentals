/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_model.dart
                       
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


import 'package:eliud_pkg_fundamentals/model/divider_entity.dart';

import 'package:eliud_core/tools/random.dart';



class DividerModel {
  String? documentID;
  String? appId;
  String? name;
  RgbModel? color;

  // The divider's height extent. The divider itself is always drawn as a horizontal line that is centered within the height specified by this value.
  double? height;

  // The thickness of the line drawn within the divider. A divider with a thickness of 0.0 is always drawn as a line with a height of exactly one device pixel.
  double? thickness;

  // The amount of empty space to the leading edge of the divider.
  double? indent;

  // The amount of empty space to the trailing edge of the divider.
  double? endIndent;
  ConditionsSimpleModel? conditions;

  DividerModel({this.documentID, this.appId, this.name, this.color, this.height, this.thickness, this.indent, this.endIndent, this.conditions, })  {
    assert(documentID != null);
  }

  DividerModel copyWith({String? documentID, String? appId, String? name, RgbModel? color, double? height, double? thickness, double? indent, double? endIndent, ConditionsSimpleModel? conditions, }) {
    return DividerModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, color: color ?? this.color, height: height ?? this.height, thickness: thickness ?? this.thickness, indent: indent ?? this.indent, endIndent: endIndent ?? this.endIndent, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ color.hashCode ^ height.hashCode ^ thickness.hashCode ^ indent.hashCode ^ endIndent.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DividerModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          color == other.color &&
          height == other.height &&
          thickness == other.thickness &&
          indent == other.indent &&
          endIndent == other.endIndent &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'DividerModel{documentID: $documentID, appId: $appId, name: $name, color: $color, height: $height, thickness: $thickness, indent: $indent, endIndent: $endIndent, conditions: $conditions}';
  }

  DividerEntity toEntity({String? appId}) {
    return DividerEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          color: (color != null) ? color!.toEntity(appId: appId) : null, 
          height: (height != null) ? height : null, 
          thickness: (thickness != null) ? thickness : null, 
          indent: (indent != null) ? indent : null, 
          endIndent: (endIndent != null) ? endIndent : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static DividerModel? fromEntity(String documentID, DividerEntity? entity) {
    if (entity == null) return null;
    return DividerModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          color: 
            RgbModel.fromEntity(entity.color), 
          height: entity.height, 
          thickness: entity.thickness, 
          indent: entity.indent, 
          endIndent: entity.endIndent, 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<DividerModel?> fromEntityPlus(String documentID, DividerEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    return DividerModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          color: 
            await RgbModel.fromEntityPlus(entity.color, appId: appId), 
          height: entity.height, 
          thickness: entity.thickness, 
          indent: entity.indent, 
          endIndent: entity.endIndent, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

