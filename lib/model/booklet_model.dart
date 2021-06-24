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



class BookletModel {
  String? documentID;
  String? appId;
  String? name;
  List<SectionModel>? sections;
  ConditionsSimpleModel? conditions;

  BookletModel({this.documentID, this.appId, this.name, this.sections, this.conditions, })  {
    assert(documentID != null);
  }

  BookletModel copyWith({String? documentID, String? appId, String? name, List<SectionModel>? sections, ConditionsSimpleModel? conditions, }) {
    return BookletModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, sections: sections ?? this.sections, conditions: conditions ?? this.conditions, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ sections.hashCode ^ conditions.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is BookletModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          ListEquality().equals(sections, other.sections) &&
          conditions == other.conditions;

  @override
  String toString() {
    String sectionsCsv = (sections == null) ? '' : sections!.join(', ');

    return 'BookletModel{documentID: $documentID, appId: $appId, name: $name, sections: Section[] { $sectionsCsv }, conditions: $conditions}';
  }

  BookletEntity toEntity({String? appId}) {
    return BookletEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          sections: (sections != null) ? sections
            !.map((item) => item.toEntity(appId: appId))
            .toList() : null, 
          conditions: (conditions != null) ? conditions!.toEntity(appId: appId) : null, 
    );
  }

  static BookletModel? fromEntity(String documentID, BookletEntity? entity) {
    if (entity == null) return null;
    return BookletModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          sections: 
            entity.sections == null ? null :
            entity.sections
            !.map((item) => SectionModel.fromEntity(newRandomKey(), item)!)
            .toList(), 
          conditions: 
            ConditionsSimpleModel.fromEntity(entity.conditions), 
    );
  }

  static Future<BookletModel?> fromEntityPlus(String documentID, BookletEntity? entity, { String? appId}) async {
    if (entity == null) return null;

    return BookletModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          sections: 
            entity. sections == null ? null : new List<SectionModel>.from(await Future.wait(entity. sections
            !.map((item) => SectionModel.fromEntityPlus(newRandomKey(), item, appId: appId))
            .toList())), 
          conditions: 
            await ConditionsSimpleModel.fromEntityPlus(entity.conditions, appId: appId), 
    );
  }

}

