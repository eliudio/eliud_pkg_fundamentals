/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';

/*
 * SimpleImageComponentEvent is the base class for events to be used with constructing a SimpleImageComponentBloc 
 */
abstract class SimpleImageComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchSimpleImageComponent is the event to instruct the bloc to fetch the component
 */
class FetchSimpleImageComponent extends SimpleImageComponentEvent {
  final String? id;

  /*
   * Construct the FetchSimpleImageComponent
   */
  FetchSimpleImageComponent({this.id});
}

/*
 * SimpleImageComponentUpdated is the event to inform the bloc that a component has been updated
 */
class SimpleImageComponentUpdated extends SimpleImageComponentEvent {
  final SimpleImageModel value;

  /*
   * Construct the SimpleImageComponentUpdated
   */
  SimpleImageComponentUpdated({required this.value});
}
