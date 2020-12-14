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
  Stream<List<TutorialEntryModel>> values({String orderBy, bool descending });
  Stream<List<TutorialEntryModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<TutorialEntryModel>> valuesList({String orderBy, bool descending });
  Future<List<TutorialEntryModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<TutorialEntryModel>> listen(TutorialEntryModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<TutorialEntryModel>> listenWithDetails(TutorialEntryModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


