/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

typedef DocumentItemModelTrigger(List<DocumentItemModel?> list);
typedef DocumentItemChanged(DocumentItemModel? value);

abstract class DocumentItemRepository {
  Future<DocumentItemModel> add(DocumentItemModel value);
  Future<void> delete(DocumentItemModel value);
  Future<DocumentItemModel?> get(String? id, { Function(Exception)? onError });
  Future<DocumentItemModel> update(DocumentItemModel value);

  Stream<List<DocumentItemModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<DocumentItemModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<DocumentItemModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<DocumentItemModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<DocumentItemModel?>> listen(DocumentItemModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<DocumentItemModel?>> listenWithDetails(DocumentItemModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<DocumentItemModel?> listenTo(String documentId, DocumentItemChanged changed);
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<DocumentItemModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


