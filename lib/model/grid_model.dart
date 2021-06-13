/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';
import 'package:eliud_pkg_fundamentals/model/grid_entity.dart';



class GridModel {
  String? documentID;
  String? appId;
  String? title;
  List<BodyComponentModel>? bodyComponents;

  // Specific gridview
  GridViewModel? gridView;
  ConditionsSimpleModel? conditions;

  GridModel({this.documentID, this.appId, this.title, this.bodyComponents, this.gridView, this.conditions, })  {
    assert(documentID != null);
  }

  GridModel copyWith({String? documentID, String? appId, String? title, List<BodyComponentModel>? bodyComponents, GridViewModel? gridView, ConditionsSimpleModel? conditions, }) {
    return GridModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, bodyComponents: bodyComponents ?? this.bodyComponents, gridView: gridView ?? this.gridView, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ bodyComponents.hashCode ^ gridView.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is GridModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          ListEquality().equals(bodyComponents, other.bodyComponents) &&
          gridView == other.gridView &&
          conditions == other.conditions;

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents!.join(', ');

    return 'GridModel{documentID: $documentID, appId: $appId, title: $title, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, gridView: $gridView, conditions: $conditions}';
  }

  GridEntity toEntity({String? appId}) {
    return GridEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          bodyComponents: (bodyComponents != null) ? bodyComponents
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          gridViewId: (gridView != null) ? gridView!.documentID : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static GridModel? fromEntity(String documentID, GridEntity? entity) {
    if (entity == null) return null;
    return GridModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity.bodyComponents == null ? null :
            entity.bodyComponents
            !.map((item) => BodyComponentModel.fromEntity(newRandomKey(), item)!)
            .toList(), 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<GridModel?> fromEntityPlus(String documentID, GridEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    GridViewModel? gridViewHolder;
    if (entity.gridViewId != null) {
      try {
          gridViewHolder = await gridViewRepository(appId: appId)!.get(entity.gridViewId);
      } on Exception catch(e) {
        print('Error whilst trying to initialise gridView');
        print('Error whilst retrieving gridView with id ${entity.gridViewId}');
        print('Exception: $e');
      }
    }

    return GridModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity. bodyComponents == null ? null : new List<BodyComponentModel>.from(await Future.wait(entity. bodyComponents
            !.map((item) => BodyComponentModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          gridView: gridViewHolder, 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

