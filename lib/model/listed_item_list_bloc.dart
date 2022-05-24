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



class ListedItemListBloc extends Bloc<ListedItemListEvent, ListedItemListState> {
  final ListedItemRepository _listedItemRepository;
  StreamSubscription? _listedItemsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int listedItemLimit;

  ListedItemListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required ListedItemRepository listedItemRepository, this.listedItemLimit = 5})
      : assert(listedItemRepository != null),
        _listedItemRepository = listedItemRepository,
        super(ListedItemListLoading()) {
    on <LoadListedItemList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadListedItemListToState();
      } else {
        _mapLoadListedItemListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadListedItemListWithDetailsToState();
    });
    
    on <ListedItemChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadListedItemListToState();
      } else {
        _mapLoadListedItemListWithDetailsToState();
      }
    });
      
    on <AddListedItemList> ((event, emit) async {
      await _mapAddListedItemListToState(event);
    });
    
    on <UpdateListedItemList> ((event, emit) async {
      await _mapUpdateListedItemListToState(event);
    });
    
    on <DeleteListedItemList> ((event, emit) async {
      await _mapDeleteListedItemListToState(event);
    });
    
    on <ListedItemListUpdated> ((event, emit) {
      emit(_mapListedItemListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadListedItemListToState() async {
    int amountNow =  (state is ListedItemListLoaded) ? (state as ListedItemListLoaded).values!.length : 0;
    _listedItemsListSubscription?.cancel();
    _listedItemsListSubscription = _listedItemRepository.listen(
          (list) => add(ListedItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * listedItemLimit : null
    );
  }

  Future<void> _mapLoadListedItemListWithDetailsToState() async {
    int amountNow =  (state is ListedItemListLoaded) ? (state as ListedItemListLoaded).values!.length : 0;
    _listedItemsListSubscription?.cancel();
    _listedItemsListSubscription = _listedItemRepository.listenWithDetails(
            (list) => add(ListedItemListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * listedItemLimit : null
    );
  }

  Future<void> _mapAddListedItemListToState(AddListedItemList event) async {
    var value = event.value;
    if (value != null) {
      await _listedItemRepository.add(value);
    }
  }

  Future<void> _mapUpdateListedItemListToState(UpdateListedItemList event) async {
    var value = event.value;
    if (value != null) {
      await _listedItemRepository.update(value);
    }
  }

  Future<void> _mapDeleteListedItemListToState(DeleteListedItemList event) async {
    var value = event.value;
    if (value != null) {
      await _listedItemRepository.delete(value);
    }
  }

  ListedItemListLoaded _mapListedItemListUpdatedToState(
      ListedItemListUpdated event) => ListedItemListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _listedItemsListSubscription?.cancel();
    return super.close();
  }
}


