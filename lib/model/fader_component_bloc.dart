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
class FaderBloc extends Bloc<FaderEvent, FaderState> {
  final FaderRepository faderRepository;

  FaderBloc({ this.faderRepository }): super(FaderUninitialized());
  @override
  Stream<FaderState> mapEventToState(FaderEvent event) async* {
    final currentState = state;
    if (event is FetchFader) {
      try {
        if (currentState is FaderUninitialized) {
          final FaderModel model = await _fetchFader(event.id);

          if (model != null) {
            yield FaderLoaded(value: model);
          } else {
            String id = event.id;
            yield FaderError(message: "Fader with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield FaderError(message: "Unknown error whilst retrieving Fader");
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


