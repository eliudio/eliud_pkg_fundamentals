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

import 'package:eliud_core/core/global_data.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';


import 'link_entity.dart';
import 'package:eliud_core/tools/random.dart';



class LinkModel {
  String documentID;
  String linkText;
  ActionModel action;

  LinkModel({this.documentID, this.linkText, this.action, })  {
    assert(documentID != null);
  }

  LinkModel copyWith({String documentID, String linkText, ActionModel action, }) {
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

  LinkEntity toEntity() {
    return LinkEntity(
          linkText: (linkText != null) ? linkText : null, 
          action: (action != null) ? action.toEntity() : null, 
    );
  }

  static LinkModel fromEntity(String documentID, LinkEntity entity) {
    if (entity == null) return null;
    return LinkModel(
          documentID: documentID, 
          linkText: entity.linkText, 
          action: 
            ActionModel.fromEntity(entity.action), 
    );
  }

  static Future<LinkModel> fromEntityPlus(String documentID, LinkEntity entity) async {
    if (entity == null) return null;

    return LinkModel(
          documentID: documentID, 
          linkText: entity.linkText, 
          action: 
            await ActionModel.fromEntityPlus(entity.action), 
    );
  }

}

