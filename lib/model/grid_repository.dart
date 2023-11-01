/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/



import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';


import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef GridModelTrigger(List<GridModel?> list);
typedef GridChanged(GridModel? value);
typedef GridErrorHandler(o, e);

abstract class GridRepository extends RepositoryBase<GridModel, GridEntity> {
  Future<GridEntity> addEntity(String documentID, GridEntity value);
  Future<GridEntity> updateEntity(String documentID, GridEntity value);
  Future<GridModel> add(GridModel value);
  Future<void> delete(GridModel value);
  Future<GridModel?> get(String? id, { Function(Exception)? onError });
  Future<GridModel> update(GridModel value);

  Stream<List<GridModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<GridModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<GridModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<GridModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<GridModel?>> listen(GridModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<GridModel?>> listenWithDetails(GridModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<GridModel?> listenTo(String documentId, GridChanged changed, {GridErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<GridModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


