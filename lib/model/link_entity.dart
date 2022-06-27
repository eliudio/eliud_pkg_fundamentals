/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'abstract_repository_singleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/entity_base.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_core/tools/common_tools.dart';
class LinkEntity implements EntityBase {
  final String? linkText;
  final ActionEntity? action;

  LinkEntity({this.linkText, this.action, });


  List<Object?> get props => [linkText, action, ];

  @override
  String toString() {
    return 'LinkEntity{linkText: $linkText, action: $action}';
  }

  static LinkEntity? fromMap(Object? o) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var actionFromMap;
    actionFromMap = map['action'];
    if (actionFromMap != null)
      actionFromMap = ActionEntity.fromMap(actionFromMap);

    return LinkEntity(
      linkText: map['linkText'], 
      action: actionFromMap, 
    );
  }

  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? actionMap = action != null 
        ? action!.toDocument()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (linkText != null) theDocument["linkText"] = linkText;
      else theDocument["linkText"] = null;
    if (action != null) theDocument["action"] = actionMap;
      else theDocument["action"] = null;
    return theDocument;
  }

  static LinkEntity? fromJsonString(String json) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument) async {
    return theDocument;
  }

}

