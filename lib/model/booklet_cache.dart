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
import 'booklet_model.dart';
import 'booklet_repository.dart';
// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/cache_export.dart';
import 'package:eliud_core/model/cache_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

class BookletCache implements BookletRepository {

  final BookletRepository reference;
  final Map<String, BookletModel> fullCache = Map();

  BookletCache(this.reference);

  Future<BookletModel> add(BookletModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  Future<void> delete(BookletModel value){
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  Future<BookletModel> get(String id){
    BookletModel value = fullCache[id];
    if (value != null) return refreshRelations(value);
    return reference.get(id).then((value) {
      fullCache[id] = value;
      return value;
    });
  }

  Future<BookletModel> update(BookletModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  @override
  Stream<List<BookletModel>> values() {
    return reference.values();
  }

  @override
  Stream<List<BookletModel>> valuesWithDetails() {
    return reference.valuesWithDetails();
  }

  @override
  Future<List<BookletModel>> valuesList() async {
    return await reference.valuesList();
  }
  
  @override
  Future<List<BookletModel>> valuesListWithDetails() async {
    return await reference.valuesListWithDetails();
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<BookletModel>> listen(trigger) {
    return reference.listen(trigger);
  }

  @override
  StreamSubscription<List<BookletModel>> listenWithDetails(trigger) {
    return reference.listenWithDetails(trigger);
  }


  static Future<BookletModel> refreshRelations(BookletModel model) async {

    List<SectionModel> sectionsHolder = List<SectionModel>.from(await Future.wait(await model.sections.map((element) async {
      return await SectionCache.refreshRelations(element);
    }))).toList();

    return model.copyWith(
        sections: sectionsHolder,


    );
  }

}

