/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_model.dart';

abstract class DynamicWidgetComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDynamicWidgetComponent extends DynamicWidgetComponentEvent {
  final String? id;

  FetchDynamicWidgetComponent({ this.id });
}

class DynamicWidgetComponentUpdated extends DynamicWidgetComponentEvent {
  final DynamicWidgetModel value;

  DynamicWidgetComponentUpdated({ required this.value });
}


