/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef DynamicWidgetModelTrigger = Function(List<DynamicWidgetModel?> list);
typedef DynamicWidgetChanged = Function(DynamicWidgetModel? value);
typedef DynamicWidgetErrorHandler = Function(dynamic o, dynamic e);

abstract class DynamicWidgetRepository
    extends RepositoryBase<DynamicWidgetModel, DynamicWidgetEntity> {
  @override
  Future<DynamicWidgetEntity> addEntity(
      String documentID, DynamicWidgetEntity value);
  @override
  Future<DynamicWidgetEntity> updateEntity(
      String documentID, DynamicWidgetEntity value);
  @override
  Future<DynamicWidgetModel> add(DynamicWidgetModel value);
  @override
  Future<void> delete(DynamicWidgetModel value);
  @override
  Future<DynamicWidgetModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<DynamicWidgetModel> update(DynamicWidgetModel value);

  @override
  Stream<List<DynamicWidgetModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<DynamicWidgetModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<DynamicWidgetModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<DynamicWidgetModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<DynamicWidgetModel?>> listen(
      DynamicWidgetModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<DynamicWidgetModel?>> listenWithDetails(
      DynamicWidgetModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<DynamicWidgetModel?> listenTo(
      String documentId, DynamicWidgetChanged changed,
      {DynamicWidgetErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<DynamicWidgetModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
