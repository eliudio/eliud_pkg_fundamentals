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

/*
 * SimpleTextComponentEvent is the base class for events to be used with constructing a SimpleTextComponentBloc 
 */
abstract class SimpleTextComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchSimpleTextComponent is the event to instruct the bloc to fetch the component
 */
class FetchSimpleTextComponent extends SimpleTextComponentEvent {
  final String? id;

  /*
   * Construct the FetchSimpleTextComponent
   */
  FetchSimpleTextComponent({this.id});
}

/*
 * SimpleTextComponentUpdated is the event to inform the bloc that a component has been updated
 */
class SimpleTextComponentUpdated extends SimpleTextComponentEvent {
  final SimpleTextModel value;

  /*
   * Construct the SimpleTextComponentUpdated
   */
  SimpleTextComponentUpdated({required this.value});
}
