/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';

typedef DividerModelTrigger(List<DividerModel> list);

abstract class DividerRepository {
  Future<DividerModel> add(DividerModel value);
  Future<void> delete(DividerModel value);
  Future<DividerModel> get(String id);
  Future<DividerModel> update(DividerModel value);
  Stream<List<DividerModel>> values({String orderBy, bool descending });
  Stream<List<DividerModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<DividerModel>> valuesList({String orderBy, bool descending });
  Future<List<DividerModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<DividerModel>> listen(DividerModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<DividerModel>> listenWithDetails(DividerModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


