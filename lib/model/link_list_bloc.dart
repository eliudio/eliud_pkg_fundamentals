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

import 'package:eliud_pkg_fundamentals/model/link_repository.dart';
import 'package:eliud_pkg_fundamentals/model/link_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/link_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _linkLimit = 5;

class LinkListBloc extends Bloc<LinkListEvent, LinkListState> {
  final LinkRepository _linkRepository;
  StreamSubscription _linksListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  LinkListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required LinkRepository linkRepository})
      : assert(linkRepository != null),
        _linkRepository = linkRepository,
        super(LinkListLoading());

  Stream<LinkListState> _mapLoadLinkListToState() async* {
    int amountNow =  (state is LinkListLoaded) ? (state as LinkListLoaded).values.length : 0;
    _linksListSubscription?.cancel();
    _linksListSubscription = _linkRepository.listen(
          (list) => add(LinkListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _linkLimit : null
    );
  }

  Stream<LinkListState> _mapLoadLinkListWithDetailsToState() async* {
    int amountNow =  (state is LinkListLoaded) ? (state as LinkListLoaded).values.length : 0;
    _linksListSubscription?.cancel();
    _linksListSubscription = _linkRepository.listenWithDetails(
            (list) => add(LinkListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _linkLimit : null
    );
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

  Stream<LinkListState> _mapLinkListUpdatedToState(
      LinkListUpdated event) async* {
    yield LinkListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<LinkListState> mapEventToState(LinkListEvent event) async* {
    if (event is LoadLinkList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadLinkListToState();
      } else {
        yield* _mapLoadLinkListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


