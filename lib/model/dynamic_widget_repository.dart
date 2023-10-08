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

import 'package:eliud_pkg_fundamentals/model/dynamic_widget_repository.dart';


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
import 'package:eliud_core/core/base/repository_base.dart';

typedef DynamicWidgetModelTrigger(List<DynamicWidgetModel?> list);
typedef DynamicWidgetChanged(DynamicWidgetModel? value);
typedef DynamicWidgetErrorHandler(o, e);

abstract class DynamicWidgetRepository extends RepositoryBase<DynamicWidgetModel, DynamicWidgetEntity> {
  Future<DynamicWidgetEntity> addEntity(String documentID, DynamicWidgetEntity value);
  Future<DynamicWidgetEntity> updateEntity(String documentID, DynamicWidgetEntity value);
  Future<DynamicWidgetModel> add(DynamicWidgetModel value);
  Future<void> delete(DynamicWidgetModel value);
  Future<DynamicWidgetModel?> get(String? id, { Function(Exception)? onError });
  Future<DynamicWidgetModel> update(DynamicWidgetModel value);

  Stream<List<DynamicWidgetModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<DynamicWidgetModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<DynamicWidgetModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<DynamicWidgetModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<DynamicWidgetModel?>> listen(DynamicWidgetModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<DynamicWidgetModel?>> listenWithDetails(DynamicWidgetModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<DynamicWidgetModel?> listenTo(String documentId, DynamicWidgetChanged changed, {DynamicWidgetErrorHandler? errorHandler});
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<DynamicWidgetModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


