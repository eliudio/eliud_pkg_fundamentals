/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';

abstract class FaderComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFaderComponent extends FaderComponentEvent {
  final String? id;

  FetchFaderComponent({this.id});
}

class FaderComponentUpdated extends FaderComponentEvent {
  final FaderModel value;

  FaderComponentUpdated({required this.value});
}
