/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/presentation_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';

class PresentationComponentBloc
    extends Bloc<PresentationComponentEvent, PresentationComponentState> {
  final PresentationRepository? presentationRepository;
  StreamSubscription? _presentationSubscription;

  void _mapLoadPresentationComponentUpdateToState(String documentId) {
    _presentationSubscription?.cancel();
    _presentationSubscription =
        presentationRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(PresentationComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct PresentationComponentBloc
   */
  PresentationComponentBloc({this.presentationRepository})
      : super(PresentationComponentUninitialized()) {
    on<FetchPresentationComponent>((event, emit) {
      _mapLoadPresentationComponentUpdateToState(event.id!);
    });
    on<PresentationComponentUpdated>((event, emit) {
      emit(PresentationComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the PresentationComponentBloc
   */
  @override
  Future<void> close() {
    _presentationSubscription?.cancel();
    return super.close();
  }
}
