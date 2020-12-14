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
  Stream<List<GridModel>> values({String orderBy, bool descending });
  Stream<List<GridModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<GridModel>> valuesList({String orderBy, bool descending });
  Future<List<GridModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<GridModel>> listen(GridModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<GridModel>> listenWithDetails(GridModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


