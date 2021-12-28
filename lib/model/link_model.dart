/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'package:eliud_pkg_fundamentals/model/link_entity.dart';

import 'package:eliud_core/tools/random.dart';



class LinkModel {
  String? documentID;
  String? linkText;
  ActionModel? action;

  LinkModel({this.documentID, this.linkText, this.action, })  {
    assert(documentID != null);
  }

  LinkModel copyWith({String? documentID, String? linkText, ActionModel? action, }) {
    return LinkModel(documentID: documentID ?? this.documentID, linkText: linkText ?? this.linkText, action: action ?? this.action, );
  }

  @override
  int get hashCode => documentID.hashCode ^ linkText.hashCode ^ action.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is LinkModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          linkText == other.linkText &&
          action == other.action;

  @override
  String toString() {
    return 'LinkModel{documentID: $documentID, linkText: $linkText, action: $action}';
  }

  LinkEntity toEntity({String? appId}) {
    return LinkEntity(
          linkText: (linkText != null) ? linkText : null, 
          action: (action != null) ? action!.toEntity(appId: appId) : null, 
    );
  }

  static Future<LinkModel?> fromEntity(String documentID, LinkEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return LinkModel(
          documentID: documentID, 
          linkText: entity.linkText, 
          action: 
            await ActionModel.fromEntity(entity.action), 
    );
  }

  static Future<LinkModel?> fromEntityPlus(String documentID, LinkEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return LinkModel(
          documentID: documentID, 
          linkText: entity.linkText, 
          action: 
            await ActionModel.fromEntityPlus(entity.action, appId: appId), 
    );
  }

}

