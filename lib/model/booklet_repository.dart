/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';

typedef BookletModelTrigger(List<BookletModel> list);

abstract class BookletRepository {
  Future<BookletModel> add(BookletModel value);
  Future<void> delete(BookletModel value);
  Future<BookletModel> get(String id);
  Future<BookletModel> update(BookletModel value);
  Stream<List<BookletModel>> values();
  Stream<List<BookletModel>> valuesWithDetails();
  StreamSubscription<List<BookletModel>> listen(BookletModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<BookletModel>> listenWithDetails(BookletModelTrigger trigger);
  void flush();
  Future<List<BookletModel>> valuesList();
  Future<List<BookletModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


