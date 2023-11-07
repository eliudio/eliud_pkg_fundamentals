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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/divider_entity.dart';

class DividerModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals';
  static const String id = 'dividers';

  @override
  String documentID;
  @override
  String appId;
  String? description;
  RgbModel? color;

  // The divider's height extent. The divider itself is always drawn as a horizontal line that is centered within the height specified by this value.
  double? height;

  // The thickness of the line drawn within the divider. A divider with a thickness of 0.0 is always drawn as a line with a height of exactly one device pixel.
  double? thickness;

  // The amount of empty space to the leading edge of the divider.
  double? indent;

  // The amount of empty space to the trailing edge of the divider.
  double? endIndent;
  StorageConditionsModel? conditions;

  DividerModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.color,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.conditions,
  });

  @override
  DividerModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    RgbModel? color,
    double? height,
    double? thickness,
    double? indent,
    double? endIndent,
    StorageConditionsModel? conditions,
  }) {
    return DividerModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      color: color ?? this.color,
      height: height ?? this.height,
      thickness: thickness ?? this.thickness,
      indent: indent ?? this.indent,
      endIndent: endIndent ?? this.endIndent,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      color.hashCode ^
      height.hashCode ^
      thickness.hashCode ^
      indent.hashCode ^
      endIndent.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DividerModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          color == other.color &&
          height == other.height &&
          thickness == other.thickness &&
          indent == other.indent &&
          endIndent == other.endIndent &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'DividerModel{documentID: $documentID, appId: $appId, description: $description, color: $color, height: $height, thickness: $thickness, indent: $indent, endIndent: $endIndent, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (color != null) {
      referencesCollector.addAll(await color!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  DividerEntity toEntity({String? appId}) {
    return DividerEntity(
      appId: appId,
      description: (description != null) ? description : null,
      color: (color != null) ? color!.toEntity(appId: appId) : null,
      height: (height != null) ? height : null,
      thickness: (thickness != null) ? thickness : null,
      indent: (indent != null) ? indent : null,
      endIndent: (endIndent != null) ? endIndent : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<DividerModel?> fromEntity(
      String documentID, DividerEntity? entity) async {
    if (entity == null) return null;
    return DividerModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      color: await RgbModel.fromEntity(entity.color),
      height: entity.height,
      thickness: entity.thickness,
      indent: entity.indent,
      endIndent: entity.endIndent,
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<DividerModel?> fromEntityPlus(
      String documentID, DividerEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return DividerModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      color: await RgbModel.fromEntityPlus(entity.color, appId: appId),
      height: entity.height,
      thickness: entity.thickness,
      indent: entity.indent,
      endIndent: entity.endIndent,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
