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
  Stream<List<DividerModel>> values();
  Stream<List<DividerModel>> valuesWithDetails();
  StreamSubscription<List<DividerModel>> listen(DividerModelTrigger trigger);
StreamSubscription<List<DividerModel>> listenWithDetails(DividerModelTrigger trigger);
  void flush();
  Future<List<DividerModel>> valuesList();
  Future<List<DividerModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


