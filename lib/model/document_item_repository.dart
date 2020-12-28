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

import 'package:eliud_pkg_fundamentals/model/document_item_repository.dart';


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

typedef DocumentItemModelTrigger(List<DocumentItemModel> list);
typedef DocumentItemChanged(DocumentItemModel value);

abstract class DocumentItemRepository {
  Future<DocumentItemModel> add(DocumentItemModel value);
  Future<void> delete(DocumentItemModel value);
  Future<DocumentItemModel> get(String id);
  Future<DocumentItemModel> update(DocumentItemModel value);

  Stream<List<DocumentItemModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Stream<List<DocumentItemModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Future<List<DocumentItemModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});
  Future<List<DocumentItemModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, int privilegeLevel});

  StreamSubscription<List<DocumentItemModel>> listen(DocumentItemModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel});
  StreamSubscription<List<DocumentItemModel>> listenWithDetails(DocumentItemModelTrigger trigger, {String currentMember, String orderBy, bool descending, int privilegeLevel});
  StreamSubscription<DocumentItemModel> listenTo(String documentId, DocumentItemChanged changed);
  void flush();
  
  String timeStampToString(dynamic timeStamp);

  dynamic getSubCollection(String documentId, String name);

  Future<void> deleteAll();
}


