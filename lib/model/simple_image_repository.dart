/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'simple_image_model.dart';

typedef SimpleImageModelTrigger(List<SimpleImageModel> list);

abstract class SimpleImageRepository {
  Future<SimpleImageModel> add(SimpleImageModel value);
  Future<void> delete(SimpleImageModel value);
  Future<SimpleImageModel> get(String id);
  Future<SimpleImageModel> update(SimpleImageModel value);
  Stream<List<SimpleImageModel>> values();
  Stream<List<SimpleImageModel>> valuesWithDetails();
  StreamSubscription<List<SimpleImageModel>> listen(SimpleImageModelTrigger trigger);
StreamSubscription<List<SimpleImageModel>> listenWithDetails(SimpleImageModelTrigger trigger);
  void flush();
  Future<List<SimpleImageModel>> valuesList();
  Future<List<SimpleImageModel>> valuesListWithDetails();

  Future<void> deleteAll();
}


