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


import 'package:eliud_pkg_fundamentals/model/grid_entity.dart';

import 'package:eliud_core/tools/random.dart';



class GridModel {
  String documentID;
  String appId;
  String title;
  List<BodyComponentModel> bodyComponents;

  // Specific gridview
  GridViewModel gridView;

  GridModel({this.documentID, this.appId, this.title, this.bodyComponents, this.gridView, })  {
    assert(documentID != null);
  }

  GridModel copyWith({String documentID, String appId, String title, List<BodyComponentModel> bodyComponents, GridViewModel gridView, }) {
    return GridModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, title: title ?? this.title, bodyComponents: bodyComponents ?? this.bodyComponents, gridView: gridView ?? this.gridView, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ title.hashCode ^ bodyComponents.hashCode ^ gridView.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is GridModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          title == other.title &&
          ListEquality().equals(bodyComponents, other.bodyComponents) &&
          gridView == other.gridView;

  @override
  String toString() {
    String bodyComponentsCsv = (bodyComponents == null) ? '' : bodyComponents.join(', ');

    return 'GridModel{documentID: $documentID, appId: $appId, title: $title, bodyComponents: BodyComponent[] { $bodyComponentsCsv }, gridView: $gridView}';
  }

  GridEntity toEntity() {
    appId = GlobalData.app().documentID;
    return GridEntity(
          appId: (appId != null) ? appId : null, 
          title: (title != null) ? title : null, 
          bodyComponents: (bodyComponents != null) ? bodyComponents
            .map((item) => item.toEntity())
            .toList() : null, 
          gridViewId: (gridView != null) ? gridView.documentID : null, 
    );
  }

  static GridModel fromEntity(String documentID, GridEntity entity) {
    if (entity == null) return null;
    return GridModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            entity. bodyComponents
            .map((item) => BodyComponentModel.fromEntity(newRandomKey(), item))
            .toList(), 
    );
  }

  static Future<GridModel> fromEntityPlus(String documentID, GridEntity entity) async {
    if (entity == null) return null;

    GridViewModel gridViewHolder;
    if (entity.gridViewId != null) {
      try {
        await gridViewRepository().get(entity.gridViewId).then((val) {
          gridViewHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return GridModel(
          documentID: documentID, 
          appId: entity.appId, 
          title: entity.title, 
          bodyComponents: 
            new List<BodyComponentModel>.from(await Future.wait(entity. bodyComponents
            .map((item) => BodyComponentModel.fromEntityPlus(newRandomKey(), item))
            .toList())), 
          gridView: gridViewHolder, 
    );
  }

}

