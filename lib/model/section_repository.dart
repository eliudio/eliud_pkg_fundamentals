/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';

typedef SectionModelTrigger(List<SectionModel> list);

abstract class SectionRepository {
  Future<SectionModel> add(SectionModel value);
  Future<void> delete(SectionModel value);
  Future<SectionModel> get(String id);
  Future<SectionModel> update(SectionModel value);
  Stream<List<SectionModel>> values();
  Stream<List<SectionModel>> valuesWithDetails();
  StreamSubscription<List<SectionModel>> listen(SectionModelTrigger trigger);
StreamSubscription<List<SectionModel>> listenWithDetails(SectionModelTrigger trigger);
  void flush();
  Future<List<SectionModel>> valuesList();
  Future<List<SectionModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


