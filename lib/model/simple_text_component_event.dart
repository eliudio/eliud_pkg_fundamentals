/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';

abstract class SimpleTextComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSimpleTextComponent extends SimpleTextComponentEvent {
  final String? id;

  FetchSimpleTextComponent({this.id});
}

class SimpleTextComponentUpdated extends SimpleTextComponentEvent {
  final SimpleTextModel value;

  SimpleTextComponentUpdated({required this.value});
}
