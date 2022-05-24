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



class LinkListBloc extends Bloc<LinkListEvent, LinkListState> {
  final LinkRepository _linkRepository;
  StreamSubscription? _linksListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int linkLimit;

  LinkListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required LinkRepository linkRepository, this.linkLimit = 5})
      : assert(linkRepository != null),
        _linkRepository = linkRepository,
        super(LinkListLoading()) {
    on <LoadLinkList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadLinkListToState();
      } else {
        _mapLoadLinkListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadLinkListWithDetailsToState();
    });
    
    on <LinkChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadLinkListToState();
      } else {
        _mapLoadLinkListWithDetailsToState();
      }
    });
      
    on <AddLinkList> ((event, emit) async {
      await _mapAddLinkListToState(event);
    });
    
    on <UpdateLinkList> ((event, emit) async {
      await _mapUpdateLinkListToState(event);
    });
    
    on <DeleteLinkList> ((event, emit) async {
      await _mapDeleteLinkListToState(event);
    });
    
    on <LinkListUpdated> ((event, emit) {
      emit(_mapLinkListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadLinkListToState() async {
    int amountNow =  (state is LinkListLoaded) ? (state as LinkListLoaded).values!.length : 0;
    _linksListSubscription?.cancel();
    _linksListSubscription = _linkRepository.listen(
          (list) => add(LinkListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * linkLimit : null
    );
  }

  Future<void> _mapLoadLinkListWithDetailsToState() async {
    int amountNow =  (state is LinkListLoaded) ? (state as LinkListLoaded).values!.length : 0;
    _linksListSubscription?.cancel();
    _linksListSubscription = _linkRepository.listenWithDetails(
            (list) => add(LinkListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * linkLimit : null
    );
  }

  Future<void> _mapAddLinkListToState(AddLinkList event) async {
    var value = event.value;
    if (value != null) {
      await _linkRepository.add(value);
    }
  }

  Future<void> _mapUpdateLinkListToState(UpdateLinkList event) async {
    var value = event.value;
    if (value != null) {
      await _linkRepository.update(value);
    }
  }

  Future<void> _mapDeleteLinkListToState(DeleteLinkList event) async {
    var value = event.value;
    if (value != null) {
      await _linkRepository.delete(value);
    }
  }

  LinkListLoaded _mapLinkListUpdatedToState(
      LinkListUpdated event) => LinkListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _linksListSubscription?.cancel();
    return super.close();
  }
}


