/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';

/*
 * TutorialComponentEvent is the base class for events to be used with constructing a TutorialComponentBloc 
 */
abstract class TutorialComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchTutorialComponent is the event to instruct the bloc to fetch the component
 */
class FetchTutorialComponent extends TutorialComponentEvent {
  final String? id;

  /*
   * Construct the FetchTutorialComponent
   */
  FetchTutorialComponent({this.id});
}

/*
 * TutorialComponentUpdated is the event to inform the bloc that a component has been updated
 */
class TutorialComponentUpdated extends TutorialComponentEvent {
  final TutorialModel value;

  /*
   * Construct the TutorialComponentUpdated
   */
  TutorialComponentUpdated({required this.value});
}
