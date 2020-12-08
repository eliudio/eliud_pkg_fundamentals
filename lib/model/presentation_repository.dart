/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';

typedef PresentationModelTrigger(List<PresentationModel> list);

abstract class PresentationRepository {
  Future<PresentationModel> add(PresentationModel value);
  Future<void> delete(PresentationModel value);
  Future<PresentationModel> get(String id);
  Future<PresentationModel> update(PresentationModel value);
  Stream<List<PresentationModel>> values();
  Stream<List<PresentationModel>> valuesWithDetails();  Future<List<PresentationModel>> valuesList();
  Future<List<PresentationModel>> valuesListWithDetails();
  StreamSubscription<List<PresentationModel>> listen(PresentationModelTrigger trigger, { String orderBy, bool descending });
  StreamSubscription<List<PresentationModel>> listenWithDetails(PresentationModelTrigger trigger);
  void flush();

  Future<void> deleteAll();
}


