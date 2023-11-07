/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';

abstract class PresentationComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPresentationComponent extends PresentationComponentEvent {
  final String? id;

  FetchPresentationComponent({this.id});
}

class PresentationComponentUpdated extends PresentationComponentEvent {
  final PresentationModel value;

  PresentationComponentUpdated({required this.value});
}
