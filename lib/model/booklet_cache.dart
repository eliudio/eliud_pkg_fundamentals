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
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_pkg_fundamentals/model/cache_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

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
  Stream<List<BookletModel>> values({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    return reference.values(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }

  @override
  Stream<List<BookletModel>> valuesWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) {
    return reference.valuesWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }

  @override
  Future<List<BookletModel>> valuesList({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel }) async {
    return await reference.valuesList(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }
  
  @override
  Future<List<BookletModel>> valuesListWithDetails({String currentMember, String orderBy, bool descending, Object startAfter, int limit, SetLastDoc setLastDoc, ReadCondition readCondition, int privilegeLevel}) async {
    return await reference.valuesListWithDetails(currentMember: currentMember, orderBy: orderBy, descending: descending, startAfter: startAfter, limit: limit, setLastDoc: setLastDoc, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }

  void flush() {
    fullCache.clear();
  }
  

  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<BookletModel>> listen(trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel}) {
    return reference.listen(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, readCondition: readCondition, privilegeLevel: privilegeLevel);
  }

  @override
  StreamSubscription<List<BookletModel>> listenWithDetails(trigger, {String currentMember, String orderBy, bool descending, ReadCondition readCondition, int privilegeLevel}) {
    return reference.listenWithDetails(trigger, currentMember: currentMember, orderBy: orderBy, descending: descending, readCondition: readCondition, privilegeLevel: privilegeLevel);
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

