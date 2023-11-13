/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_model.dart';

/*
 * DecoratedContentComponentEvent is the base class for events to be used with constructing a DecoratedContentComponentBloc 
 */
abstract class DecoratedContentComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchDecoratedContentComponent is the event to instruct the bloc to fetch the component
 */
class FetchDecoratedContentComponent extends DecoratedContentComponentEvent {
  final String? id;

  /*
   * Construct the FetchDecoratedContentComponent
   */
  FetchDecoratedContentComponent({this.id});
}

/*
 * DecoratedContentComponentUpdated is the event to inform the bloc that a component has been updated
 */
class DecoratedContentComponentUpdated extends DecoratedContentComponentEvent {
  final DecoratedContentModel value;

  /*
   * Construct the DecoratedContentComponentUpdated
   */
  DecoratedContentComponentUpdated({required this.value});
}
