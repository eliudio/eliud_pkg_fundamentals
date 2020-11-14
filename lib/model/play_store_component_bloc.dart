/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/play_store_model.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_repository.dart';

class PlayStoreComponentBloc extends Bloc<PlayStoreComponentEvent, PlayStoreComponentState> {
  final PlayStoreRepository playStoreRepository;

  PlayStoreComponentBloc({ this.playStoreRepository }): super(PlayStoreComponentUninitialized());
  @override
  Stream<PlayStoreComponentState> mapEventToState(PlayStoreComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPlayStoreComponent) {
      try {
        if (currentState is PlayStoreComponentUninitialized) {
          final PlayStoreModel model = await _fetchPlayStore(event.id);

          if (model != null) {
            yield PlayStoreComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield PlayStoreComponentError(message: "PlayStore with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield PlayStoreComponentError(message: "Unknown error whilst retrieving PlayStore");
      }
    }
  }

  Future<PlayStoreModel> _fetchPlayStore(String id) async {
    return playStoreRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


