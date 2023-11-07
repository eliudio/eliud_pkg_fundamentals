/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef PresentationModelTrigger = Function(List<PresentationModel?> list);
typedef PresentationChanged = Function(PresentationModel? value);
typedef PresentationErrorHandler = Function(dynamic o, dynamic e);

abstract class PresentationRepository
    extends RepositoryBase<PresentationModel, PresentationEntity> {
  @override
  Future<PresentationEntity> addEntity(
      String documentID, PresentationEntity value);
  @override
  Future<PresentationEntity> updateEntity(
      String documentID, PresentationEntity value);
  @override
  Future<PresentationModel> add(PresentationModel value);
  @override
  Future<void> delete(PresentationModel value);
  @override
  Future<PresentationModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<PresentationModel> update(PresentationModel value);

  @override
  Stream<List<PresentationModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<PresentationModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PresentationModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PresentationModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<PresentationModel?>> listen(
      PresentationModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<PresentationModel?>> listenWithDetails(
      PresentationModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<PresentationModel?> listenTo(
      String documentId, PresentationChanged changed,
      {PresentationErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<PresentationModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
