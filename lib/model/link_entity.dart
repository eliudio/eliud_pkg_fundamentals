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
import 'package:eliud_core/core/base/entity_base.dart';
import '../tools/bespoke_entities.dart';

class LinkEntity implements EntityBase {
  final String? linkText;
  final ActionEntity? action;

  LinkEntity({
    this.linkText,
    this.action,
  });

  LinkEntity copyWith({
    String? documentID,
    String? linkText,
    ActionEntity? action,
  }) {
    return LinkEntity(
      linkText: linkText ?? this.linkText,
      action: action ?? this.action,
    );
  }

  List<Object?> get props => [
        linkText,
        action,
      ];

  @override
  String toString() {
    return 'LinkEntity{linkText: $linkText, action: $action}';
  }

  static LinkEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var actionFromMap = map['action'];
    if (actionFromMap != null) {
      actionFromMap =
          ActionEntity.fromMap(actionFromMap, newDocumentIds: newDocumentIds);
    }

    return LinkEntity(
      linkText: map['linkText'],
      action: actionFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? actionMap =
        action != null ? action!.toDocument() : null;

    Map<String, Object?> theDocument = HashMap();
    if (linkText != null) {
      theDocument["linkText"] = linkText;
    } else {
      theDocument["linkText"] = null;
    }
    if (action != null) {
      theDocument["action"] = actionMap;
    } else {
      theDocument["action"] = null;
    }
    return theDocument;
  }

  @override
  LinkEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static LinkEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
