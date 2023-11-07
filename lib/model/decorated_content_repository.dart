/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef DecoratedContentModelTrigger = Function(
    List<DecoratedContentModel?> list);
typedef DecoratedContentChanged = Function(DecoratedContentModel? value);
typedef DecoratedContentErrorHandler = Function(dynamic o, dynamic e);

abstract class DecoratedContentRepository
    extends RepositoryBase<DecoratedContentModel, DecoratedContentEntity> {
  @override
  Future<DecoratedContentEntity> addEntity(
      String documentID, DecoratedContentEntity value);
  @override
  Future<DecoratedContentEntity> updateEntity(
      String documentID, DecoratedContentEntity value);
  @override
  Future<DecoratedContentModel> add(DecoratedContentModel value);
  @override
  Future<void> delete(DecoratedContentModel value);
  @override
  Future<DecoratedContentModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<DecoratedContentModel> update(DecoratedContentModel value);

  @override
  Stream<List<DecoratedContentModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<DecoratedContentModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<DecoratedContentModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<DecoratedContentModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<DecoratedContentModel?>> listen(
      DecoratedContentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<DecoratedContentModel?>> listenWithDetails(
      DecoratedContentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<DecoratedContentModel?> listenTo(
      String documentId, DecoratedContentChanged changed,
      {DecoratedContentErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<DecoratedContentModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
