/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/core/base/repository_base.dart';

typedef TutorialEntryModelTrigger = Function(List<TutorialEntryModel?> list);
typedef TutorialEntryChanged = Function(TutorialEntryModel? value);
typedef TutorialEntryErrorHandler = Function(dynamic o, dynamic e);

abstract class TutorialEntryRepository
    extends RepositoryBase<TutorialEntryModel, TutorialEntryEntity> {
  @override
  Future<TutorialEntryEntity> addEntity(
      String documentID, TutorialEntryEntity value);
  @override
  Future<TutorialEntryEntity> updateEntity(
      String documentID, TutorialEntryEntity value);
  @override
  Future<TutorialEntryModel> add(TutorialEntryModel value);
  @override
  Future<void> delete(TutorialEntryModel value);
  @override
  Future<TutorialEntryModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<TutorialEntryModel> update(TutorialEntryModel value);

  @override
  Stream<List<TutorialEntryModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<TutorialEntryModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<TutorialEntryModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<TutorialEntryModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<TutorialEntryModel?>> listen(
      TutorialEntryModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<TutorialEntryModel?>> listenWithDetails(
      TutorialEntryModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<TutorialEntryModel?> listenTo(
      String documentId, TutorialEntryChanged changed,
      {TutorialEntryErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<TutorialEntryModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
