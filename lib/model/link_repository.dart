/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/link_model.dart';

typedef LinkModelTrigger(List<LinkModel> list);

abstract class LinkRepository {
  Future<LinkModel> add(LinkModel value);
  Future<void> delete(LinkModel value);
  Future<LinkModel> get(String id);
  Future<LinkModel> update(LinkModel value);
  Stream<List<LinkModel>> values({String orderBy, bool descending });
  Stream<List<LinkModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<LinkModel>> valuesList({String orderBy, bool descending });
  Future<List<LinkModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<LinkModel>> listen(LinkModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<LinkModel>> listenWithDetails(LinkModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


