/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/listed_item_repository.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_list_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class ListedItemListBloc extends Bloc<ListedItemListEvent, ListedItemListState> {
  final ListedItemRepository _listedItemRepository;
  StreamSubscription _listedItemsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  ListedItemListBloc(this.accessBloc,{ this.eliudQuery, @required ListedItemRepository listedItemRepository })
      : assert(listedItemRepository != null),
      _listedItemRepository = listedItemRepository,
      super(ListedItemListLoading());

  Stream<ListedItemListState> _mapLoadListedItemListToState({ String orderBy, bool descending }) async* {
    _listedItemsListSubscription?.cancel();
    _listedItemsListSubscription = _listedItemRepository.listen((list) => add(ListedItemListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<ListedItemListState> _mapLoadListedItemListWithDetailsToState({ String orderBy, bool descending }) async* {
    _listedItemsListSubscription?.cancel();
    _listedItemsListSubscription = _listedItemRepository.listenWithDetails((list) => add(ListedItemListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<ListedItemListState> _mapAddListedItemListToState(AddListedItemList event) async* {
    _listedItemRepository.add(event.value);
  }

  Stream<ListedItemListState> _mapUpdateListedItemListToState(UpdateListedItemList event) async* {
    _listedItemRepository.update(event.value);
  }

  Stream<ListedItemListState> _mapDeleteListedItemListToState(DeleteListedItemList event) async* {
    _listedItemRepository.delete(event.value);
  }

  Stream<ListedItemListState> _mapListedItemListUpdatedToState(ListedItemListUpdated event) async* {
    yield ListedItemListLoaded(values: event.value);
  }


  @override
  Stream<ListedItemListState> mapEventToState(ListedItemListEvent event) async* {
    final currentState = state;
    if (event is LoadListedItemList) {
      yield* _mapLoadListedItemListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadListedItemListWithDetails) {
      yield* _mapLoadListedItemListWithDetailsToState();
    } else if (event is AddListedItemList) {
      yield* _mapAddListedItemListToState(event);
    } else if (event is UpdateListedItemList) {
      yield* _mapUpdateListedItemListToState(event);
    } else if (event is DeleteListedItemList) {
      yield* _mapDeleteListedItemListToState(event);
    } else if (event is ListedItemListUpdated) {
      yield* _mapListedItemListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _listedItemsListSubscription?.cancel();
    return super.close();
  }

}


