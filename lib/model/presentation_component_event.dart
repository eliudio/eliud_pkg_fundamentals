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

/*
 * PresentationComponentEvent is the base class for events to be used with constructing a PresentationComponentBloc 
 */
abstract class PresentationComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchPresentationComponent is the event to instruct the bloc to fetch the component
 */
class FetchPresentationComponent extends PresentationComponentEvent {
  final String? id;

  /*
   * Construct the FetchPresentationComponent
   */
  FetchPresentationComponent({this.id});
}

/*
 * PresentationComponentUpdated is the event to inform the bloc that a component has been updated
 */
class PresentationComponentUpdated extends PresentationComponentEvent {
  final PresentationModel value;

  /*
   * Construct the PresentationComponentUpdated
   */
  PresentationComponentUpdated({required this.value});
}
