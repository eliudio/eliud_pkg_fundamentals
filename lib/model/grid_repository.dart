/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/grid_model.dart';

typedef GridModelTrigger(List<GridModel> list);

abstract class GridRepository {
  Future<GridModel> add(GridModel value);
  Future<void> delete(GridModel value);
  Future<GridModel> get(String id);
  Future<GridModel> update(GridModel value);
  Stream<List<GridModel>> values();
  Stream<List<GridModel>> valuesWithDetails();
  StreamSubscription<List<GridModel>> listen(GridModelTrigger trigger);
StreamSubscription<List<GridModel>> listenWithDetails(GridModelTrigger trigger);
  void flush();
  Future<List<GridModel>> valuesList();
  Future<List<GridModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


