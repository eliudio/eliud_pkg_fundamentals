/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'booklet_model.dart';

typedef List<BookletModel?> FilterBookletModels(List<BookletModel?> values);



class BookletListBloc extends Bloc<BookletListEvent, BookletListState> {
  final FilterBookletModels? filter;
  final BookletRepository _bookletRepository;
  StreamSubscription? _bookletsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int bookletLimit;

  BookletListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required BookletRepository bookletRepository, this.bookletLimit = 5})
      : _bookletRepository = bookletRepository,
        super(BookletListLoading()) {
    on <LoadBookletList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadBookletListToState();
      } else {
        _mapLoadBookletListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadBookletListWithDetailsToState();
    });
    
    on <BookletChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadBookletListToState();
      } else {
        _mapLoadBookletListWithDetailsToState();
      }
    });
      
    on <AddBookletList> ((event, emit) async {
      await _mapAddBookletListToState(event);
    });
    
    on <UpdateBookletList> ((event, emit) async {
      await _mapUpdateBookletListToState(event);
    });
    
    on <DeleteBookletList> ((event, emit) async {
      await _mapDeleteBookletListToState(event);
    });
    
    on <BookletListUpdated> ((event, emit) {
      emit(_mapBookletListUpdatedToState(event));
    });
  }

  List<BookletModel?> _filter(List<BookletModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadBookletListToState() async {
    int amountNow =  (state is BookletListLoaded) ? (state as BookletListLoaded).values!.length : 0;
    _bookletsListSubscription?.cancel();
    _bookletsListSubscription = _bookletRepository.listen(
          (list) => add(BookletListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * bookletLimit : null
    );
  }

  Future<void> _mapLoadBookletListWithDetailsToState() async {
    int amountNow =  (state is BookletListLoaded) ? (state as BookletListLoaded).values!.length : 0;
    _bookletsListSubscription?.cancel();
    _bookletsListSubscription = _bookletRepository.listenWithDetails(
            (list) => add(BookletListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * bookletLimit : null
    );
  }

  Future<void> _mapAddBookletListToState(AddBookletList event) async {
    var value = event.value;
    if (value != null) {
      await _bookletRepository.add(value);
    }
  }

  Future<void> _mapUpdateBookletListToState(UpdateBookletList event) async {
    var value = event.value;
    if (value != null) {
      await _bookletRepository.update(value);
    }
  }

  Future<void> _mapDeleteBookletListToState(DeleteBookletList event) async {
    var value = event.value;
    if (value != null) {
      await _bookletRepository.delete(value);
    }
  }

  BookletListLoaded _mapBookletListUpdatedToState(
      BookletListUpdated event) => BookletListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _bookletsListSubscription?.cancel();
    return super.close();
  }
}


