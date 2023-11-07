/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';

abstract class SimpleImageComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSimpleImageComponent extends SimpleImageComponentEvent {
  final String? id;

  FetchSimpleImageComponent({this.id});
}

class SimpleImageComponentUpdated extends SimpleImageComponentEvent {
  final SimpleImageModel value;

  SimpleImageComponentUpdated({required this.value});
}
