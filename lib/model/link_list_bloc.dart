/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'link_repository.dart';
import 'link_list_event.dart';
import 'link_list_state.dart';


class LinkListBloc extends Bloc<LinkListEvent, LinkListState> {
  final LinkRepository _linkRepository;
  StreamSubscription _linksListSubscription;

  LinkListBloc({ @required LinkRepository linkRepository })
      : assert(linkRepository != null),
      _linkRepository = linkRepository,
      super(LinkListLoading());

  Stream<LinkListState> _mapLoadLinkListToState() async* {
    _linksListSubscription?.cancel();
    _linksListSubscription = _linkRepository.listen((list) => add(LinkListUpdated(value: list)));
  }

  Stream<LinkListState> _mapLoadLinkListWithDetailsToState() async* {
    _linksListSubscription?.cancel();
    _linksListSubscription = _linkRepository.listenWithDetails((list) => add(LinkListUpdated(value: list)));
  }

  Stream<LinkListState> _mapAddLinkListToState(AddLinkList event) async* {
    _linkRepository.add(event.value);
  }

  Stream<LinkListState> _mapUpdateLinkListToState(UpdateLinkList event) async* {
    _linkRepository.update(event.value);
  }

  Stream<LinkListState> _mapDeleteLinkListToState(DeleteLinkList event) async* {
    _linkRepository.delete(event.value);
  }

  Stream<LinkListState> _mapLinkListUpdatedToState(LinkListUpdated event) async* {
    yield LinkListLoaded(values: event.value);
  }


  @override
  Stream<LinkListState> mapEventToState(LinkListEvent event) async* {
    final currentState = state;
    if (event is LoadLinkList) {
      yield* _mapLoadLinkListToState();
    } if (event is LoadLinkListWithDetails) {
      yield* _mapLoadLinkListWithDetailsToState();
    } else if (event is AddLinkList) {
      yield* _mapAddLinkListToState(event);
    } else if (event is UpdateLinkList) {
      yield* _mapUpdateLinkListToState(event);
    } else if (event is DeleteLinkList) {
      yield* _mapDeleteLinkListToState(event);
    } else if (event is LinkListUpdated) {
      yield* _mapLinkListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _linksListSubscription?.cancel();
    return super.close();
  }

}


