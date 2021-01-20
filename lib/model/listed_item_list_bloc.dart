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
import 'package:eliud_core/tools/query/query_tools.dart';


const _listedItemLimit = 5;

class ListedItemListBloc extends Bloc<ListedItemListEvent, ListedItemListState> {
  final ListedItemRepository _listedItemRepository;
  StreamSubscription _listedItemsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  ListedItemListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required ListedItemRepository listedItemRepository})
      : assert(listedItemRepository != null),
        _listedItemRepository = listedItemRepository,
        super(ListedItemListLoading());

  Stream<ListedItemListState> _mapLoadListedItemListToState() async* {
    int amountNow =  (state is ListedItemListLoaded) ? (state as ListedItemListLoaded).values.length : 0;
    _listedItemsListSubscription?.cancel();
    _listedItemsListSubscription = _listedItemRepository.listen(
          (list) => add(ListedItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _listedItemLimit : null
    );
  }

  Stream<ListedItemListState> _mapLoadListedItemListWithDetailsToState() async* {
    int amountNow =  (state is ListedItemListLoaded) ? (state as ListedItemListLoaded).values.length : 0;
    _listedItemsListSubscription?.cancel();
    _listedItemsListSubscription = _listedItemRepository.listenWithDetails(
            (list) => add(ListedItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _listedItemLimit : null
    );
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

  Stream<ListedItemListState> _mapListedItemListUpdatedToState(
      ListedItemListUpdated event) async* {
    yield ListedItemListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<ListedItemListState> mapEventToState(ListedItemListEvent event) async* {
    if (event is LoadListedItemList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadListedItemListToState();
      } else {
        yield* _mapLoadListedItemListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
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


