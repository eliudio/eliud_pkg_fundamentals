/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/photo_and_text_repository.dart';


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
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef PhotoAndTextModelTrigger(List<PhotoAndTextModel> list);
typedef PhotoAndTextChanged(PhotoAndTextModel value);

abstract class PhotoAndTextRepository {
  Future<PhotoAndTextModel> add(PhotoAndTextModel value);
  Future<void> delete(PhotoAndTextModel value);
  Future<PhotoAndTextModel> get(String id, { Function(Exception) onError });
  Future<PhotoAndTextModel> update(PhotoAndTextModel value);

  Stream<List<PhotoAndTextModel>> values({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Stream<List<PhotoAndTextModel>> valuesWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Future<List<PhotoAndTextModel>> valuesList({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });
  Future<List<PhotoAndTextModel>> valuesListWithDetails({String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel, EliudQuery eliudQuery });

  StreamSubscription<List<PhotoAndTextModel>> listen(PhotoAndTextModelTrigger trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery });
  StreamSubscription<List<PhotoAndTextModel>> listenWithDetails(PhotoAndTextModelTrigger trigger, {String orderBy, bool descending, Object startAfter, int limit, int privilegeLevel, EliudQuery eliudQuery });
  StreamSubscription<PhotoAndTextModel> listenTo(String documentId, PhotoAndTextChanged changed);
  void flush();
  
  String timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<PhotoAndTextModel> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


