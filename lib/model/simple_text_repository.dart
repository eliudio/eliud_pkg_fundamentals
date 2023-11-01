/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/



import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef SimpleTextModelTrigger(List<SimpleTextModel?> list);
typedef SimpleTextChanged(SimpleTextModel? value);
typedef SimpleTextErrorHandler(o, e);

abstract class SimpleTextRepository extends RepositoryBase<SimpleTextModel, SimpleTextEntity> {
  Future<SimpleTextEntity> addEntity(String documentID, SimpleTextEntity value);
  Future<SimpleTextEntity> updateEntity(String documentID, SimpleTextEntity value);
  Future<SimpleTextModel> add(SimpleTextModel value);
  Future<void> delete(SimpleTextModel value);
  Future<SimpleTextModel?> get(String? id, { Function(Exception)? onError });
  Future<SimpleTextModel> update(SimpleTextModel value);

  Stream<List<SimpleTextModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<SimpleTextModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<SimpleTextModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<SimpleTextModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<SimpleTextModel?>> listen(SimpleTextModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<SimpleTextModel?>> listenWithDetails(SimpleTextModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<SimpleTextModel?> listenTo(String documentId, SimpleTextChanged changed, {SimpleTextErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<SimpleTextModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


