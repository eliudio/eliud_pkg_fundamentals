/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';

/*
 * DividerComponentEvent is the base class for events to be used with constructing a DividerComponentBloc 
 */
abstract class DividerComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchDividerComponent is the event to instruct the bloc to fetch the component
 */
class FetchDividerComponent extends DividerComponentEvent {
  final String? id;

  /*
   * Construct the FetchDividerComponent
   */
  FetchDividerComponent({this.id});
}

/*
 * DividerComponentUpdated is the event to inform the bloc that a component has been updated
 */
class DividerComponentUpdated extends DividerComponentEvent {
  final DividerModel value;

  /*
   * Construct the DividerComponentUpdated
   */
  DividerComponentUpdated({required this.value});
}
