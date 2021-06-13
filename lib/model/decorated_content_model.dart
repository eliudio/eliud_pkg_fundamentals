/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

enum DecorationComponentPosition {
  LeftIfSpaceAvailableOtherwiseTop, LeftIfSpaceAvailableOtherwiseDrop, LeftIfSpaceAvailableOtherwiseBottom, RightIfSpaceAvailableOtherwiseTop, RightIfSpaceAvailableOtherwiseDrop, RightIfSpaceAvailableOtherwiseBottom, Unknown
}


DecorationComponentPosition toDecorationComponentPosition(int? index) {
  switch (index) {
    case 0: return DecorationComponentPosition.LeftIfSpaceAvailableOtherwiseTop;
    case 1: return DecorationComponentPosition.LeftIfSpaceAvailableOtherwiseDrop;
    case 2: return DecorationComponentPosition.LeftIfSpaceAvailableOtherwiseBottom;
    case 3: return DecorationComponentPosition.RightIfSpaceAvailableOtherwiseTop;
    case 4: return DecorationComponentPosition.RightIfSpaceAvailableOtherwiseDrop;
    case 5: return DecorationComponentPosition.RightIfSpaceAvailableOtherwiseBottom;
  }
  return DecorationComponentPosition.Unknown;
}


class DecoratedContentModel {
  String? documentID;
  String? appId;
  String? name;

  // The component name of the decoration
  String? decoratingComponentName;

  // For that specific component, e.g. 'carousel', which Component ID, i.e. which carousel to include in the page
  String? decoratingComponentId;

  // The component name of the content
  String? contentComponentName;

  // For that specific component, e.g. 'carousel', which Component ID, i.e. which carousel to include in the page
  String? contentComponentId;
  DecorationComponentPosition? decorationComponentPosition;
  double? percentageDecorationVisible;
  ConditionsSimpleModel? conditions;

  DecoratedContentModel({this.documentID, this.appId, this.name, this.decoratingComponentName, this.decoratingComponentId, this.contentComponentName, this.contentComponentId, this.decorationComponentPosition, this.percentageDecorationVisible, this.conditions, })  {
    assert(documentID != null);
  }

  DecoratedContentModel copyWith({String? documentID, String? appId, String? name, String? decoratingComponentName, String? decoratingComponentId, String? contentComponentName, String? contentComponentId, DecorationComponentPosition? decorationComponentPosition, double? percentageDecorationVisible, ConditionsSimpleModel? conditions, }) {
    return DecoratedContentModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, decoratingComponentName: decoratingComponentName ?? this.decoratingComponentName, decoratingComponentId: decoratingComponentId ?? this.decoratingComponentId, contentComponentName: contentComponentName ?? this.contentComponentName, contentComponentId: contentComponentId ?? this.contentComponentId, decorationComponentPosition: decorationComponentPosition ?? this.decorationComponentPosition, percentageDecorationVisible: percentageDecorationVisible ?? this.percentageDecorationVisible, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ decoratingComponentName.hashCode ^ decoratingComponentId.hashCode ^ contentComponentName.hashCode ^ contentComponentId.hashCode ^ decorationComponentPosition.hashCode ^ percentageDecorationVisible.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DecoratedContentModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          decoratingComponentName == other.decoratingComponentName &&
          decoratingComponentId == other.decoratingComponentId &&
          contentComponentName == other.contentComponentName &&
          contentComponentId == other.contentComponentId &&
          decorationComponentPosition == other.decorationComponentPosition &&
          percentageDecorationVisible == other.percentageDecorationVisible &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'DecoratedContentModel{documentID: $documentID, appId: $appId, name: $name, decoratingComponentName: $decoratingComponentName, decoratingComponentId: $decoratingComponentId, contentComponentName: $contentComponentName, contentComponentId: $contentComponentId, decorationComponentPosition: $decorationComponentPosition, percentageDecorationVisible: $percentageDecorationVisible, conditions: $conditions}';
  }

  DecoratedContentEntity toEntity({String? appId}) {
    return DecoratedContentEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          decoratingComponentName: (decoratingComponentName != null) ? decoratingComponentName : null, 
          decoratingComponentId: (decoratingComponentId != null) ? decoratingComponentId : null, 
          contentComponentName: (contentComponentName != null) ? contentComponentName : null, 
          contentComponentId: (contentComponentId != null) ? contentComponentId : null, 
          decorationComponentPosition: (decorationComponentPosition != null) ? decorationComponentPosition!.index : null, 
          percentageDecorationVisible: (percentageDecorationVisible != null) ? percentageDecorationVisible : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static DecoratedContentModel? fromEntity(String documentID, DecoratedContentEntity? entity) {
    if (entity == null) return null;
    return DecoratedContentModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          decoratingComponentName: entity.decoratingComponentName, 
          decoratingComponentId: entity.decoratingComponentId, 
          contentComponentName: entity.contentComponentName, 
          contentComponentId: entity.contentComponentId, 
          decorationComponentPosition: toDecorationComponentPosition(entity.decorationComponentPosition), 
          percentageDecorationVisible: entity.percentageDecorationVisible, 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<DecoratedContentModel?> fromEntityPlus(String documentID, DecoratedContentEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    return DecoratedContentModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          decoratingComponentName: entity.decoratingComponentName, 
          decoratingComponentId: entity.decoratingComponentId, 
          contentComponentName: entity.contentComponentName, 
          contentComponentId: entity.contentComponentId, 
          decorationComponentPosition: toDecorationComponentPosition(entity.decorationComponentPosition), 
          percentageDecorationVisible: entity.percentageDecorationVisible, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

