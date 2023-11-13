/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';

/*
 * DocumentComponentEvent is the base class for events to be used with constructing a DocumentComponentBloc 
 */
abstract class DocumentComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchDocumentComponent is the event to instruct the bloc to fetch the component
 */
class FetchDocumentComponent extends DocumentComponentEvent {
  final String? id;

  /*
   * Construct the FetchDocumentComponent
   */
  FetchDocumentComponent({this.id});
}

/*
 * DocumentComponentUpdated is the event to inform the bloc that a component has been updated
 */
class DocumentComponentUpdated extends DocumentComponentEvent {
  final DocumentModel value;

  /*
   * Construct the DocumentComponentUpdated
   */
  DocumentComponentUpdated({required this.value});
}
