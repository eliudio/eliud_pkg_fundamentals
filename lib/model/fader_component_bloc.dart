/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';
class FaderComponentBloc extends Bloc<FaderComponentEvent, FaderComponentState> {
  final FaderRepository faderRepository;

  FaderComponentBloc({ this.faderRepository }): super(FaderComponentUninitialized());
  @override
  Stream<FaderComponentState> mapEventToState(FaderComponentEvent event) async* {
    final currentState = state;
    if (event is FetchFaderComponent) {
      try {
        if (currentState is FaderComponentUninitialized) {
          final FaderModel model = await _fetchFader(event.id);

          if (model != null) {
            yield FaderComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield FaderComponentError(message: "Fader with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield FaderComponentError(message: "Unknown error whilst retrieving Fader");
      }
    }
  }

  Future<FaderModel> _fetchFader(String id) async {
    return faderRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


