/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

typedef DocumentModelTrigger(List<DocumentModel?> list);
typedef DocumentChanged(DocumentModel? value);

abstract class DocumentRepository {
  Future<DocumentModel> add(DocumentModel value);
  Future<void> delete(DocumentModel value);
  Future<DocumentModel?> get(String? id, { Function(Exception)? onError });
  Future<DocumentModel> update(DocumentModel value);

  Stream<List<DocumentModel?>> values({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Stream<List<DocumentModel?>> valuesWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<DocumentModel?>> valuesList({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });
  Future<List<DocumentModel?>> valuesListWithDetails({String? orderBy, bool? descending, Object? startAfter, int? limit, SetLastDoc? setLastDoc, int? privilegeLevel, EliudQuery? eliudQuery });

  StreamSubscription<List<DocumentModel?>> listen(DocumentModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<List<DocumentModel?>> listenWithDetails(DocumentModelTrigger trigger, {String? orderBy, bool? descending, Object? startAfter, int? limit, int? privilegeLevel, EliudQuery? eliudQuery });
  StreamSubscription<DocumentModel?> listenTo(String documentId, DocumentChanged changed);
  void flush();
  
  String? timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);
  Future<DocumentModel?> changeValue(String documentId, String fieldName, num changeByThisValue);

  Future<void> deleteAll();
}


