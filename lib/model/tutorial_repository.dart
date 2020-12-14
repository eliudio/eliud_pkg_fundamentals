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
  Stream<List<TutorialModel>> values({String orderBy, bool descending });
  Stream<List<TutorialModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<TutorialModel>> valuesList({String orderBy, bool descending });
  Future<List<TutorialModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<TutorialModel>> listen(TutorialModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<TutorialModel>> listenWithDetails(TutorialModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


