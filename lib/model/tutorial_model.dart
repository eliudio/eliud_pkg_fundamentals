/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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


import 'package:eliud_pkg_fundamentals/model/tutorial_entity.dart';

import 'package:eliud_core/tools/random.dart';



class TutorialModel implements ModelBase, WithAppId {
  String documentID;
  String appId;
  String? name;
  String? title;
  String? description;
  List<TutorialEntryModel>? tutorialEntries;
  StorageConditionsModel? conditions;

  TutorialModel({required this.documentID, required this.appId, this.name, this.title, this.description, this.tutorialEntries, this.conditions, })  {
    assert(documentID != null);
  }

  TutorialModel copyWith({String? documentID, String? appId, String? name, String? title, String? description, List<TutorialEntryModel>? tutorialEntries, StorageConditionsModel? conditions, }) {
    return TutorialModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, title: title ?? this.title, description: description ?? this.description, tutorialEntries: tutorialEntries ?? this.tutorialEntries, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ title.hashCode ^ description.hashCode ^ tutorialEntries.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is TutorialModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          title == other.title &&
          description == other.description &&
          ListEquality().equals(tutorialEntries, other.tutorialEntries) &&
          conditions == other.conditions;

  @override
  Future<String> toRichJsonString({String? appId}) async {
    var document = toEntity(appId: appId).toDocument();
    document['documentID'] = documentID;
    return jsonEncode(document);
  }

  @override
  String toString() {
    String tutorialEntriesCsv = (tutorialEntries == null) ? '' : tutorialEntries!.join(', ');

    return 'TutorialModel{documentID: $documentID, appId: $appId, name: $name, title: $title, description: $description, tutorialEntries: TutorialEntry[] { $tutorialEntriesCsv }, conditions: $conditions}';
  }

  TutorialEntity toEntity({String? appId}) {
    return TutorialEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          title: (title != null) ? title : null, 
          description: (description != null) ? description : null, 
          tutorialEntries: (tutorialEntries != null) ? tutorialEntries
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<TutorialModel?> fromEntity(String documentID, TutorialEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return TutorialModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          title: entity.title, 
          description: entity.description, 
          tutorialEntries: 
            entity.tutorialEntries == null ? null : List<TutorialEntryModel>.from(await Future.wait(entity. tutorialEntries
            !.map((item) {
            counter++;
              return TutorialEntryModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<TutorialModel?> fromEntityPlus(String documentID, TutorialEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return TutorialModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          name: entity.name, 
          title: entity.title, 
          description: entity.description, 
          tutorialEntries: 
            entity. tutorialEntries == null ? null : List<TutorialEntryModel>.from(await Future.wait(entity. tutorialEntries
            !.map((item) {
            counter++;
            return TutorialEntryModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

