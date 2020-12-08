/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';

typedef TutorialModelTrigger(List<TutorialModel> list);

abstract class TutorialRepository {
  Future<TutorialModel> add(TutorialModel value);
  Future<void> delete(TutorialModel value);
  Future<TutorialModel> get(String id);
  Future<TutorialModel> update(TutorialModel value);
  Stream<List<TutorialModel>> values();
  Stream<List<TutorialModel>> valuesWithDetails();
  StreamSubscription<List<TutorialModel>> listen(TutorialModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<TutorialModel>> listenWithDetails(TutorialModelTrigger trigger);
  void flush();
  Future<List<TutorialModel>> valuesList();
  Future<List<TutorialModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


