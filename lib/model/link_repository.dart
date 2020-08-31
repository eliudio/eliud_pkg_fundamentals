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
  Stream<List<LinkModel>> values();
  Stream<List<LinkModel>> valuesWithDetails();
  StreamSubscription<List<LinkModel>> listen(LinkModelTrigger trigger);
StreamSubscription<List<LinkModel>> listenWithDetails(LinkModelTrigger trigger);
  void flush();
  Future<List<LinkModel>> valuesList();
  Future<List<LinkModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


