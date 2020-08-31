/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/play_store_repository.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_list_state.dart';


class PlayStoreListBloc extends Bloc<PlayStoreListEvent, PlayStoreListState> {
  final PlayStoreRepository _playStoreRepository;
  StreamSubscription _playStoresListSubscription;

  PlayStoreListBloc({ @required PlayStoreRepository playStoreRepository })
      : assert(playStoreRepository != null),
      _playStoreRepository = playStoreRepository,
      super(PlayStoreListLoading());

  Stream<PlayStoreListState> _mapLoadPlayStoreListToState() async* {
    _playStoresListSubscription?.cancel();
    _playStoresListSubscription = _playStoreRepository.listen((list) => add(PlayStoreListUpdated(value: list)));
  }

  Stream<PlayStoreListState> _mapLoadPlayStoreListWithDetailsToState() async* {
    _playStoresListSubscription?.cancel();
    _playStoresListSubscription = _playStoreRepository.listenWithDetails((list) => add(PlayStoreListUpdated(value: list)));
  }

  Stream<PlayStoreListState> _mapAddPlayStoreListToState(AddPlayStoreList event) async* {
    _playStoreRepository.add(event.value);
  }

  Stream<PlayStoreListState> _mapUpdatePlayStoreListToState(UpdatePlayStoreList event) async* {
    _playStoreRepository.update(event.value);
  }

  Stream<PlayStoreListState> _mapDeletePlayStoreListToState(DeletePlayStoreList event) async* {
    _playStoreRepository.delete(event.value);
  }

  Stream<PlayStoreListState> _mapPlayStoreListUpdatedToState(PlayStoreListUpdated event) async* {
    yield PlayStoreListLoaded(values: event.value);
  }


  @override
  Stream<PlayStoreListState> mapEventToState(PlayStoreListEvent event) async* {
    final currentState = state;
    if (event is LoadPlayStoreList) {
      yield* _mapLoadPlayStoreListToState();
    } if (event is LoadPlayStoreListWithDetails) {
      yield* _mapLoadPlayStoreListWithDetailsToState();
    } else if (event is AddPlayStoreList) {
      yield* _mapAddPlayStoreListToState(event);
    } else if (event is UpdatePlayStoreList) {
      yield* _mapUpdatePlayStoreListToState(event);
    } else if (event is DeletePlayStoreList) {
      yield* _mapDeletePlayStoreListToState(event);
    } else if (event is PlayStoreListUpdated) {
      yield* _mapPlayStoreListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _playStoresListSubscription?.cancel();
    return super.close();
  }

}


