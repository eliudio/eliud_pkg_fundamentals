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
import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'package:eliud_pkg_fundamentals/model/tutorial_entity.dart';

import 'package:eliud_core/tools/random.dart';



class TutorialModel {
  String documentID;
  String appId;
  String name;
  String title;
  String description;
  List<TutorialEntryModel> tutorialEntries;

  TutorialModel({this.documentID, this.appId, this.name, this.title, this.description, this.tutorialEntries, })  {
    assert(documentID != null);
  }

  TutorialModel copyWith({String documentID, String appId, String name, String title, String description, List<TutorialEntryModel> tutorialEntries, }) {
    return TutorialModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, title: title ?? this.title, description: description ?? this.description, tutorialEntries: tutorialEntries ?? this.tutorialEntries, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ title.hashCode ^ description.hashCode ^ tutorialEntries.hashCode;

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
          ListEquality().equals(tutorialEntries, other.tutorialEntries);

  @override
  String toString() {
    String tutorialEntriesCsv = (tutorialEntries == null) ? '' : tutorialEntries.join(', ');

    return 'TutorialModel{documentID: $documentID, appId: $appId, name: $name, title: $title, description: $description, tutorialEntries: TutorialEntry[] { $tutorialEntriesCsv }}';
  }

  TutorialEntity toEntity({String appId}) {
    return TutorialEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          title: (title != null) ? title : null, 
          description: (description != null) ? description : null, 
          tutorialEntries: (tutorialEntries != null) ? tutorialEntries
            .map((item) => item.toEntity(appId: appId))
            .toList() : null, 
    );
  }

  static TutorialModel fromEntity(String documentID, TutorialEntity entity) {
    if (entity == null) return null;
    return TutorialModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          title: entity.title, 
          description: entity.description, 
          tutorialEntries: 
            entity. tutorialEntries
            .map((item) => TutorialEntryModel.fromEntity(newRandomKey(), item))
            .toList(), 
    );
  }

  static Future<TutorialModel> fromEntityPlus(String documentID, TutorialEntity entity) async {
    if (entity == null) return null;

    return TutorialModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          title: entity.title, 
          description: entity.description, 
          tutorialEntries: 
            new List<TutorialEntryModel>.from(await Future.wait(entity. tutorialEntries
            .map((item) => TutorialEntryModel.fromEntityPlus(newRandomKey(), item))
            .toList())), 
    );
  }

}

