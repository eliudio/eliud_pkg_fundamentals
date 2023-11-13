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

/*
 * DynamicWidgetComponentEvent is the base class for events to be used with constructing a DynamicWidgetComponentBloc 
 */
abstract class DynamicWidgetComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchDynamicWidgetComponent is the event to instruct the bloc to fetch the component
 */
class FetchDynamicWidgetComponent extends DynamicWidgetComponentEvent {
  final String? id;

  /*
   * Construct the FetchDynamicWidgetComponent
   */
  FetchDynamicWidgetComponent({this.id});
}

/*
 * DynamicWidgetComponentUpdated is the event to inform the bloc that a component has been updated
 */
class DynamicWidgetComponentUpdated extends DynamicWidgetComponentEvent {
  final DynamicWidgetModel value;

  /*
   * Construct the DynamicWidgetComponentUpdated
   */
  DynamicWidgetComponentUpdated({required this.value});
}
