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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class BookletListBloc extends Bloc<BookletListEvent, BookletListState> {
  final BookletRepository _bookletRepository;
  StreamSubscription _bookletsListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  BookletListBloc(this.accessBloc,{ this.eliudQuery, @required BookletRepository bookletRepository })
      : assert(bookletRepository != null),
      _bookletRepository = bookletRepository,
      super(BookletListLoading());

  Stream<BookletListState> _mapLoadBookletListToState({ String orderBy, bool descending }) async* {
    _bookletsListSubscription?.cancel();
    _bookletsListSubscription = _bookletRepository.listen((list) => add(BookletListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery, );
  }

  Stream<BookletListState> _mapLoadBookletListWithDetailsToState() async* {
    _bookletsListSubscription?.cancel();
    _bookletsListSubscription = _bookletRepository.listenWithDetails((list) => add(BookletListUpdated(value: list)), );
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

  Stream<BookletListState> _mapBookletListUpdatedToState(BookletListUpdated event) async* {
    yield BookletListLoaded(values: event.value);
  }


  @override
  Stream<BookletListState> mapEventToState(BookletListEvent event) async* {
    final currentState = state;
    if (event is LoadBookletList) {
      yield* _mapLoadBookletListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadBookletListWithDetails) {
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


