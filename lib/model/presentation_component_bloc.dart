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

import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';

class PresentationBloc extends Bloc<PresentationEvent, PresentationState> {
  final PresentationRepository presentationRepository;

  PresentationBloc({ this.presentationRepository }): super(PresentationUninitialized());
  @override
  Stream<PresentationState> mapEventToState(PresentationEvent event) async* {
    final currentState = state;
    if (event is FetchPresentation) {
      try {
        if (currentState is PresentationUninitialized) {
          final PresentationModel model = await _fetchPresentation(event.id);

          if (model != null) {
            yield PresentationLoaded(value: model);
          } else {
            String id = event.id;
            yield PresentationError(message: "Presentation with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield PresentationError(message: "Unknown error whilst retrieving Presentation");
      }
    }
  }

  Future<PresentationModel> _fetchPresentation(String id) async {
    return presentationRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


