/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_model.dart';

typedef TutorialEntryModelTrigger(List<TutorialEntryModel> list);

abstract class TutorialEntryRepository {
  Future<TutorialEntryModel> add(TutorialEntryModel value);
  Future<void> delete(TutorialEntryModel value);
  Future<TutorialEntryModel> get(String id);
  Future<TutorialEntryModel> update(TutorialEntryModel value);
  Stream<List<TutorialEntryModel>> values();
  Stream<List<TutorialEntryModel>> valuesWithDetails();  Future<List<TutorialEntryModel>> valuesList();
  Future<List<TutorialEntryModel>> valuesListWithDetails();
  StreamSubscription<List<TutorialEntryModel>> listen(TutorialEntryModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<TutorialEntryModel>> listenWithDetails(TutorialEntryModelTrigger trigger);
  void flush();

  Future<void> deleteAll();
}


