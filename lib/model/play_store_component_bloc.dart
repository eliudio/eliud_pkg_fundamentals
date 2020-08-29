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

import 'play_store_model.dart';
import 'play_store_component_event.dart';
import 'play_store_component_state.dart';
import 'play_store_repository.dart';

class PlayStoreBloc extends Bloc<PlayStoreEvent, PlayStoreState> {
  final PlayStoreRepository playStoreRepository;

  PlayStoreBloc({ this.playStoreRepository }): super(PlayStoreUninitialized());
  @override
  Stream<PlayStoreState> mapEventToState(PlayStoreEvent event) async* {
    final currentState = state;
    if (event is FetchPlayStore) {
      try {
        if (currentState is PlayStoreUninitialized) {
          final PlayStoreModel model = await _fetchPlayStore(event.id);

          if (model != null) {
            yield PlayStoreLoaded(value: model);
          } else {
            String id = event.id;
            yield PlayStoreError(message: "PlayStore with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield PlayStoreError(message: "Unknown error whilst retrieving PlayStore");
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


