/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/section_repository.dart';


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


import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef SectionModelTrigger(List<SectionModel> list);
typedef SectionChanged(SectionModel value);

abstract class SectionRepository {
  Future<SectionModel> add(SectionModel value);
  Future<void> delete(SectionModel value);
  Future<SectionModel> get(String id);
  Future<SectionModel> update(SectionModel value);

  Stream<List<SectionModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Stream<List<SectionModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Future<List<SectionModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Future<List<SectionModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});

  StreamSubscription<List<SectionModel>> listen(SectionModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel});
  StreamSubscription<List<SectionModel>> listenWithDetails(SectionModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel});
  StreamSubscription<SectionModel> listenTo(String documentId, SectionChanged changed);
  void flush();
  
  String timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);

  Future<void> deleteAll();
}


