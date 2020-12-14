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

import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';

import 'dart:async';
import 'package:eliud_core/tools/firestore_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

typedef SimpleImageModelTrigger(List<SimpleImageModel> list);

abstract class SimpleImageRepository {
  Future<SimpleImageModel> add(SimpleImageModel value);
  Future<void> delete(SimpleImageModel value);
  Future<SimpleImageModel> get(String id);
  Future<SimpleImageModel> update(SimpleImageModel value);

  Stream<List<SimpleImageModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Stream<List<SimpleImageModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<SimpleImageModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});
  Future<List<SimpleImageModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc});

  StreamSubscription<List<SimpleImageModel>> listen(SimpleImageModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  StreamSubscription<List<SimpleImageModel>> listenWithDetails(SimpleImageModelTrigger trigger, {String currentMember, String orderBy, bool descending});
  void flush();

  Future<void> deleteAll();
}


