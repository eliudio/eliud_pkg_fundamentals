/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/core/base/model_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:eliud_core/model/app_model.dart';

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


import 'package:eliud_pkg_fundamentals/model/booklet_entity.dart';

import 'package:eliud_core/tools/random.dart';



class BookletModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_fundamentals';
  static const String id = 'booklets';

  String documentID;
  String appId;
  String? description;
  List<SectionModel>? sections;
  StorageConditionsModel? conditions;

  BookletModel({required this.documentID, required this.appId, this.description, this.sections, this.conditions, })  {
    assert(documentID != null);
  }

  BookletModel copyWith({String? documentID, String? appId, String? description, List<SectionModel>? sections, StorageConditionsModel? conditions, }) {
    return BookletModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, description: description ?? this.description, sections: sections ?? this.sections, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ description.hashCode ^ sections.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is BookletModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          ListEquality().equals(sections, other.sections) &&
          conditions == other.conditions;

  @override
  String toString() {
    String sectionsCsv = (sections == null) ? '' : sections!.join(', ');

    return 'BookletModel{documentID: $documentID, appId: $appId, description: $description, sections: Section[] { $sectionsCsv }, conditions: $conditions}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (sections != null) {
      for (var item in sections!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (conditions != null) referencesCollector.addAll(await conditions!.collectReferences(appId: appId));
    return referencesCollector;
  }

  BookletEntity toEntity({String? appId}) {
    return BookletEntity(
          appId: (appId != null) ? appId : null, 
          description: (description != null) ? description : null, 
          sections: (sections != null) ? sections
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static Future<BookletModel?> fromEntity(String documentID, BookletEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return BookletModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          sections: 
            entity.sections == null ? null : List<SectionModel>.from(await Future.wait(entity. sections
            !.map((item) {
            counter++;
              return SectionModel.fromEntity(counter.toString(), item);
            })
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntity(entity.conditions), 
    );
  }

  static Future<BookletModel?> fromEntityPlus(String documentID, BookletEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return BookletModel(
          documentID: documentID, 
          appId: entity.appId ?? '', 
          description: entity.description, 
          sections: 
            entity. sections == null ? null : List<SectionModel>.from(await Future.wait(entity. sections
            !.map((item) {
            counter++;
            return SectionModel.fromEntityPlus(counter.toString(), item, appId: appId);})
            .toList())), 
          conditions: 
            await StorageConditionsModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

