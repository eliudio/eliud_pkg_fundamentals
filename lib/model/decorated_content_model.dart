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

import 'package:eliud_core/core/base/model_base.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'package:eliud_pkg_fundamentals/model/decorated_content_entity.dart';


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


class DecoratedContentModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals';
  static const String id = 'decoratedContents';

  String documentID;
  String appId;
  String? description;

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
  StorageConditionsModel? conditions;

  DecoratedContentModel({required this.documentID, required this.appId, this.description, this.decoratingComponentName, this.decoratingComponentId, this.contentComponentName, this.contentComponentId, this.decorationComponentPosition, this.percentageDecorationVisible, this.conditions, })  {
  }

  DecoratedContentModel copyWith({String? documentID, String? appId, String? description, String? decoratingComponentName, String? decoratingComponentId, String? contentComponentName, String? contentComponentId, DecorationComponentPosition? decorationComponentPosition, double? percentageDecorationVisible, StorageConditionsModel? conditions, }) {
    return DecoratedContentModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, decoratingComponentName: decoratingComponentName ?? this.decoratingComponentName, decoratingComponentId: decoratingComponentId ?? this.decoratingComponentId, contentComponentName: contentComponentName ?? this.contentComponentName, contentComponentId: contentComponentId ?? this.contentComponentId, decorationComponentPosition: decorationComponentPosition ?? this.decorationComponentPosition, percentageDecorationVisible: percentageDecorationVisible ?? this.percentageDecorationVisible, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ decoratingComponentName.hashCode ^ decoratingComponentId.hashCode ^ contentComponentName.hashCode ^ contentComponentId.hashCode ^ decorationComponentPosition.hashCode ^ percentageDecorationVisible.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is DecoratedContentModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          decoratingComponentName == other.decoratingComponentName &&
          decoratingComponentId == other.decoratingComponentId &&
          contentComponentName == other.contentComponentName &&
          contentComponentId == other.contentComponentId &&
          decorationComponentPosition == other.decorationComponentPosition &&
          percentageDecorationVisible == other.percentageDecorationVisible &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'DecoratedContentModel{documentID: $documentID, appId: $appId, description: $description, decoratingComponentName: $decoratingComponentName, decoratingComponentId: $decoratingComponentId, contentComponentName: $contentComponentName, contentComponentId: $contentComponentId, decorationComponentPosition: $decorationComponentPosition, percentageDecorationVisible: $percentageDecorationVisible, conditions: $conditions}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (conditions != null) referencesCollector.addAll(await conditions!.collectReferences(appId: appId));
    return referencesCollector;
  }

  DecoratedContentEntity toEntity({String? appId}) {
    return DecoratedContentEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          decoratingComponentName: (decoratingComponentName != null) ? decoratingComponentName : null, 
          decoratingComponentId: (decoratingComponentId != null) ? decoratingComponentId : null, 
          contentComponentName: (contentComponentName != null) ? contentComponentName : null, 
          contentComponentId: (contentComponentId != null) ? contentComponentId : null, 
          decorationComponentPosition: (decorationComponentPosition != null) ? decorationComponentPosition!.index : null, 
          percentageDecorationVisible: (percentageDecorationVisible != null) ? percentageDecorationVisible : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<DecoratedContentModel?> fromEntity(String documentID, DecoratedContentEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return DecoratedContentModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          decoratingComponentName: entity.decoratingComponentName, 
          decoratingComponentId: entity.decoratingComponentId, 
          contentComponentName: entity.contentComponentName, 
          contentComponentId: entity.contentComponentId, 
          decorationComponentPosition: toDecorationComponentPosition(entity.decorationComponentPosition), 
          percentageDecorationVisible: entity.percentageDecorationVisible, 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<DecoratedContentModel?> fromEntityPlus(String documentID, DecoratedContentEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return DecoratedContentModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          decoratingComponentName: entity.decoratingComponentName, 
          decoratingComponentId: entity.decoratingComponentId, 
          contentComponentName: entity.contentComponentName, 
          contentComponentId: entity.contentComponentId, 
          decorationComponentPosition: toDecorationComponentPosition(entity.decorationComponentPosition), 
          percentageDecorationVisible: entity.percentageDecorationVisible, 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

