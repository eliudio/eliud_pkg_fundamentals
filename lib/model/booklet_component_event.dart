/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';

/*
 * BookletComponentEvent is the base class for events to be used with constructing a BookletComponentBloc 
 */
abstract class BookletComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchBookletComponent is the event to instruct the bloc to fetch the component
 */
class FetchBookletComponent extends BookletComponentEvent {
  final String? id;

  /*
   * Construct the FetchBookletComponent
   */
  FetchBookletComponent({this.id});
}

/*
 * BookletComponentUpdated is the event to inform the bloc that a component has been updated
 */
class BookletComponentUpdated extends BookletComponentEvent {
  final BookletModel value;

  /*
   * Construct the BookletComponentUpdated
   */
  BookletComponentUpdated({required this.value});
}
