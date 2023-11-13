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

/*
 * FaderComponentEvent is the base class for events to be used with constructing a FaderComponentBloc 
 */
abstract class FaderComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchFaderComponent is the event to instruct the bloc to fetch the component
 */
class FetchFaderComponent extends FaderComponentEvent {
  final String? id;

  /*
   * Construct the FetchFaderComponent
   */
  FetchFaderComponent({this.id});
}

/*
 * FaderComponentUpdated is the event to inform the bloc that a component has been updated
 */
class FaderComponentUpdated extends FaderComponentEvent {
  final FaderModel value;

  /*
   * Construct the FaderComponentUpdated
   */
  FaderComponentUpdated({required this.value});
}
