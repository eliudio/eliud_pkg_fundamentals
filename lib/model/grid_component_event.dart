/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/grid_model.dart';

abstract class GridComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchGridComponent extends GridComponentEvent {
  final String? id;

  FetchGridComponent({this.id});
}

class GridComponentUpdated extends GridComponentEvent {
  final GridModel value;

  GridComponentUpdated({required this.value});
}
