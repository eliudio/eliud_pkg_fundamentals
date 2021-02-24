/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/simple_text_repository.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _simpleTextLimit = 5;

class SimpleTextListBloc extends Bloc<SimpleTextListEvent, SimpleTextListState> {
  final SimpleTextRepository _simpleTextRepository;
  StreamSubscription _simpleTextsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  SimpleTextListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required SimpleTextRepository simpleTextRepository})
      : assert(simpleTextRepository != null),
        _simpleTextRepository = simpleTextRepository,
        super(SimpleTextListLoading());

  Stream<SimpleTextListState> _mapLoadSimpleTextListToState() async* {
    int amountNow =  (state is SimpleTextListLoaded) ? (state as SimpleTextListLoaded).values.length : 0;
    _simpleTextsListSubscription?.cancel();
    _simpleTextsListSubscription = _simpleTextRepository.listen(
          (list) => add(SimpleTextListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _simpleTextLimit : null
    );
  }

  Stream<SimpleTextListState> _mapLoadSimpleTextListWithDetailsToState() async* {
    int amountNow =  (state is SimpleTextListLoaded) ? (state as SimpleTextListLoaded).values.length : 0;
    _simpleTextsListSubscription?.cancel();
    _simpleTextsListSubscription = _simpleTextRepository.listenWithDetails(
            (list) => add(SimpleTextListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _simpleTextLimit : null
    );
  }

  Stream<SimpleTextListState> _mapAddSimpleTextListToState(AddSimpleTextList event) async* {
    _simpleTextRepository.add(event.value);
  }

  Stream<SimpleTextListState> _mapUpdateSimpleTextListToState(UpdateSimpleTextList event) async* {
    _simpleTextRepository.update(event.value);
  }

  Stream<SimpleTextListState> _mapDeleteSimpleTextListToState(DeleteSimpleTextList event) async* {
    _simpleTextRepository.delete(event.value);
  }

  Stream<SimpleTextListState> _mapSimpleTextListUpdatedToState(
      SimpleTextListUpdated event) async* {
    yield SimpleTextListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<SimpleTextListState> mapEventToState(SimpleTextListEvent event) async* {
    if (event is LoadSimpleTextList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadSimpleTextListToState();
      } else {
        yield* _mapLoadSimpleTextListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadSimpleTextListWithDetailsToState();
    } else if (event is AddSimpleTextList) {
      yield* _mapAddSimpleTextListToState(event);
    } else if (event is UpdateSimpleTextList) {
      yield* _mapUpdateSimpleTextListToState(event);
    } else if (event is DeleteSimpleTextList) {
      yield* _mapDeleteSimpleTextListToState(event);
    } else if (event is SimpleTextListUpdated) {
      yield* _mapSimpleTextListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _simpleTextsListSubscription?.cancel();
    return super.close();
  }
}


