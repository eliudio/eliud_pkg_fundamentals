/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef SimpleImageModelTrigger = Function(List<SimpleImageModel?> list);
typedef SimpleImageChanged = Function(SimpleImageModel? value);
typedef SimpleImageErrorHandler = Function(dynamic o, dynamic e);

abstract class SimpleImageRepository
    extends RepositoryBase<SimpleImageModel, SimpleImageEntity> {
  @override
  Future<SimpleImageEntity> addEntity(
      String documentID, SimpleImageEntity value);
  @override
  Future<SimpleImageEntity> updateEntity(
      String documentID, SimpleImageEntity value);
  @override
  Future<SimpleImageModel> add(SimpleImageModel value);
  @override
  Future<void> delete(SimpleImageModel value);
  @override
  Future<SimpleImageModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<SimpleImageModel> update(SimpleImageModel value);

  @override
  Stream<List<SimpleImageModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<SimpleImageModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<SimpleImageModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<SimpleImageModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<SimpleImageModel?>> listen(
      SimpleImageModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<SimpleImageModel?>> listenWithDetails(
      SimpleImageModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<SimpleImageModel?> listenTo(
      String documentId, SimpleImageChanged changed,
      {SimpleImageErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<SimpleImageModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
