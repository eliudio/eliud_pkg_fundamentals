/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/link_repository.dart';


import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef LinkModelTrigger(List<LinkModel> list);
typedef LinkChanged(LinkModel value);

abstract class LinkRepository {
  Future<LinkModel> add(LinkModel value);
  Future<void> delete(LinkModel value);
  Future<LinkModel> get(String id);
  Future<LinkModel> update(LinkModel value);

  Stream<List<LinkModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Stream<List<LinkModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Future<List<LinkModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Future<List<LinkModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });

  StreamSubscription<List<LinkModel>> listen(LinkModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel, EliudQuery eliudQuery });
  StreamSubscription<List<LinkModel>> listenWithDetails(LinkModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel, EliudQuery eliudQuery });
  StreamSubscription<LinkModel> listenTo(String documentId, LinkChanged changed);
  void flush();
  
  String timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);

  Future<void> deleteAll();
}


