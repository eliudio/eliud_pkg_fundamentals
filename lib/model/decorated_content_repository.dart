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

typedef DecoratedContentModelTrigger(List<DecoratedContentModel?> list);
typedef DecoratedContentChanged(DecoratedContentModel? value);
typedef DecoratedContentErrorHandler(o, e);

abstract class DecoratedContentRepository extends RepositoryBase<DecoratedContentModel, DecoratedContentEntity> {
  Future<DecoratedContentEntity> addEntity(String documentID, DecoratedContentEntity value);
  Future<DecoratedContentEntity> updateEntity(String documentID, DecoratedContentEntity value);
  Future<DecoratedContentModel> add(DecoratedContentModel value);
  Future<void> delete(DecoratedContentModel value);
  Future<DecoratedContentModel?> get(String? id, { Function(Exception)? onError });
  Future<DecoratedContentModel> update(DecoratedContentModel value);

  Stream<List<DecoratedContentModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<DecoratedContentModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<DecoratedContentModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<DecoratedContentModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<DecoratedContentModel?>> listen(DecoratedContentModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<DecoratedContentModel?>> listenWithDetails(DecoratedContentModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<DecoratedContentModel?> listenTo(String documentId, DecoratedContentChanged changed, {DecoratedContentErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<DecoratedContentModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


