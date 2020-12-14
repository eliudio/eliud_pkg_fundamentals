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
  Stream<List<SectionModel>> values({String orderBy, bool descending });
  Stream<List<SectionModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<SectionModel>> valuesList({String orderBy, bool descending });
  Future<List<SectionModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<SectionModel>> listen(SectionModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<SectionModel>> listenWithDetails(SectionModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


