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

import 'package:eliud_pkg_fundamentals/model/document_repository.dart';


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
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef DocumentModelTrigger(List<DocumentModel> list);
typedef DocumentChanged(DocumentModel value);

abstract class DocumentRepository {
  Future<DocumentModel> add(DocumentModel value);
  Future<void> delete(DocumentModel value);
  Future<DocumentModel> get(String id);
  Future<DocumentModel> update(DocumentModel value);

  Stream<List<DocumentModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Stream<List<DocumentModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Future<List<DocumentModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Future<List<DocumentModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});

  StreamSubscription<List<DocumentModel>> listen(DocumentModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel});
  StreamSubscription<List<DocumentModel>> listenWithDetails(DocumentModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel});
  StreamSubscription<DocumentModel> listenTo(String documentId, DocumentChanged changed);
  void flush();
  
  String timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);

  Future<void> deleteAll();
}


