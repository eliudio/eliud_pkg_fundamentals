/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';

/* 
 * DocumentComponentState is the base class for state for DocumentComponentBloc
 */
abstract class DocumentComponentState extends Equatable {
  const DocumentComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * DocumentComponentUninitialized is the uninitialized state of the DocumentComponentBloc 
 */
class DocumentComponentUninitialized extends DocumentComponentState {}

/* 
 * DocumentComponentError is the error state of the DocumentComponentBloc 
 */
class DocumentComponentError extends DocumentComponentState {
  final String? message;
  DocumentComponentError({this.message});
}

/* 
 * DocumentComponentPermissionDenied is to indicate permission denied state of the DocumentComponentBloc 
 */
class DocumentComponentPermissionDenied extends DocumentComponentState {
  DocumentComponentPermissionDenied();
}

/* 
 * DocumentComponentLoaded is used to set the state of the DocumentComponentBloc to the loaded state
 */
class DocumentComponentLoaded extends DocumentComponentState {
  final DocumentModel value;

  /* 
   * construct DocumentComponentLoaded
   */
  const DocumentComponentLoaded({required this.value});

  /* 
   * copy method
   */
  DocumentComponentLoaded copyWith({DocumentModel? copyThis}) {
    return DocumentComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DocumentComponentLoaded { value: $value }';
}
