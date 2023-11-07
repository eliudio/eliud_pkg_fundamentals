/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef ListedItemModelTrigger = Function(List<ListedItemModel?> list);
typedef ListedItemChanged = Function(ListedItemModel? value);
typedef ListedItemErrorHandler = Function(dynamic o, dynamic e);

abstract class ListedItemRepository
    extends RepositoryBase<ListedItemModel, ListedItemEntity> {
  @override
  Future<ListedItemEntity> addEntity(String documentID, ListedItemEntity value);
  @override
  Future<ListedItemEntity> updateEntity(
      String documentID, ListedItemEntity value);
  @override
  Future<ListedItemModel> add(ListedItemModel value);
  @override
  Future<void> delete(ListedItemModel value);
  @override
  Future<ListedItemModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<ListedItemModel> update(ListedItemModel value);

  @override
  Stream<List<ListedItemModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<ListedItemModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<ListedItemModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<ListedItemModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<ListedItemModel?>> listen(
      ListedItemModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<ListedItemModel?>> listenWithDetails(
      ListedItemModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<ListedItemModel?> listenTo(
      String documentId, ListedItemChanged changed,
      {ListedItemErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<ListedItemModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
