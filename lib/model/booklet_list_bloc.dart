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
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _bookletLimit = 5;

class BookletListBloc extends Bloc<BookletListEvent, BookletListState> {
  final BookletRepository _bookletRepository;
  StreamSubscription _bookletsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  BookletListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required BookletRepository bookletRepository})
      : assert(bookletRepository != null),
        _bookletRepository = bookletRepository,
        super(BookletListLoading());

  Stream<BookletListState> _mapLoadBookletListToState() async* {
    int amountNow =  (state is BookletListLoaded) ? (state as BookletListLoaded).values.length : 0;
    _bookletsListSubscription?.cancel();
    _bookletsListSubscription = _bookletRepository.listen(
          (list) => add(BookletListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _bookletLimit : null
    );
  }

  Stream<BookletListState> _mapLoadBookletListWithDetailsToState() async* {
    int amountNow =  (state is BookletListLoaded) ? (state as BookletListLoaded).values.length : 0;
    _bookletsListSubscription?.cancel();
    _bookletsListSubscription = _bookletRepository.listenWithDetails(
            (list) => add(BookletListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _bookletLimit : null
    );
  }

  Stream<BookletListState> _mapAddBookletListToState(AddBookletList event) async* {
    _bookletRepository.add(event.value);
  }

  Stream<BookletListState> _mapUpdateBookletListToState(UpdateBookletList event) async* {
    _bookletRepository.update(event.value);
  }

  Stream<BookletListState> _mapDeleteBookletListToState(DeleteBookletList event) async* {
    _bookletRepository.delete(event.value);
  }

  Stream<BookletListState> _mapBookletListUpdatedToState(
      BookletListUpdated event) async* {
    yield BookletListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<BookletListState> mapEventToState(BookletListEvent event) async* {
    if (event is LoadBookletList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadBookletListToState();
      } else {
        yield* _mapLoadBookletListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadBookletListWithDetailsToState();
    } else if (event is AddBookletList) {
      yield* _mapAddBookletListToState(event);
    } else if (event is UpdateBookletList) {
      yield* _mapUpdateBookletListToState(event);
    } else if (event is DeleteBookletList) {
      yield* _mapDeleteBookletListToState(event);
    } else if (event is BookletListUpdated) {
      yield* _mapBookletListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _bookletsListSubscription?.cancel();
    return super.close();
  }
}


