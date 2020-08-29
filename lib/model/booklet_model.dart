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


import 'booklet_entity.dart';
import 'package:eliud_core/tools/random.dart';



class BookletModel {
  String documentID;
  String appId;
  String name;
  List<SectionModel> sections;

  BookletModel({this.documentID, this.appId, this.name, this.sections, })  {
    assert(documentID != null);
  }

  BookletModel copyWith({String documentID, String appId, String name, List<SectionModel> sections, }) {
    return BookletModel(documentID: documentID ?? this.documentID, appId: appId ?? this.appId, name: name ?? this.name, sections: sections ?? this.sections, );
  }

  @override
  int get hashCode => documentID.hashCode ^ appId.hashCode ^ name.hashCode ^ sections.hashCode;

  @override
  bool operator ==(Object other) =>
          identical(this, other) ||
          other is BookletModel &&
          runtimeType == other.runtimeType && 
          documentID == other.documentID &&
          appId == other.appId &&
          name == other.name &&
          ListEquality().equals(sections, other.sections);

  @override
  String toString() {
    String sectionsCsv = (sections == null) ? '' : sections.join(', ');

    return 'BookletModel{documentID: $documentID, appId: $appId, name: $name, sections: Section[] { $sectionsCsv }}';
  }

  BookletEntity toEntity() {
    appId = GlobalData.app().documentID;
    return BookletEntity(
          appId: (appId != null) ? appId : null, 
          name: (name != null) ? name : null, 
          sections: (sections != null) ? sections
            .map((item) => item.toEntity())
            .toList() : null, 
    );
  }

  static BookletModel fromEntity(String documentID, BookletEntity entity) {
    if (entity == null) return null;
    return BookletModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          sections: 
            entity. sections
            .map((item) => SectionModel.fromEntity(newRandomKey(), item))
            .toList(), 
    );
  }

  static Future<BookletModel> fromEntityPlus(String documentID, BookletEntity entity) async {
    if (entity == null) return null;

    return BookletModel(
          documentID: documentID, 
          appId: entity.appId, 
          name: entity.name, 
          sections: 
            new List<SectionModel>.from(await Future.wait(entity. sections
            .map((item) => SectionModel.fromEntityPlus(newRandomKey(), item))
            .toList())), 
    );
  }

}

