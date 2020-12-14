/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';

typedef FaderModelTrigger(List<FaderModel> list);

abstract class FaderRepository {
  Future<FaderModel> add(FaderModel value);
  Future<void> delete(FaderModel value);
  Future<FaderModel> get(String id);
  Future<FaderModel> update(FaderModel value);
  Stream<List<FaderModel>> values({String orderBy, bool descending });
  Stream<List<FaderModel>> valuesWithDetails({String orderBy, bool descending });  Future<List<FaderModel>> valuesList({String orderBy, bool descending });
  Future<List<FaderModel>> valuesListWithDetails({String orderBy, bool descending });
  StreamSubscription<List<FaderModel>> listen(FaderModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<FaderModel>> listenWithDetails(FaderModelTrigger trigger, { String orderBy, bool descending });
  void flush();

  Future<void> deleteAll();
}


