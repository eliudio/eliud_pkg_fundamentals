/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/decorated_content_repository.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _decoratedContentLimit = 5;

class DecoratedContentListBloc extends Bloc<DecoratedContentListEvent, DecoratedContentListState> {
  final DecoratedContentRepository _decoratedContentRepository;
  StreamSubscription _decoratedContentsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  DecoratedContentListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required DecoratedContentRepository decoratedContentRepository})
      : assert(decoratedContentRepository != null),
        _decoratedContentRepository = decoratedContentRepository,
        super(DecoratedContentListLoading());

  Stream<DecoratedContentListState> _mapLoadDecoratedContentListToState() async* {
    int amountNow =  (state is DecoratedContentListLoaded) ? (state as DecoratedContentListLoaded).values.length : 0;
    _decoratedContentsListSubscription?.cancel();
    _decoratedContentsListSubscription = _decoratedContentRepository.listen(
          (list) => add(DecoratedContentListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _decoratedContentLimit : null
    );
  }

  Stream<DecoratedContentListState> _mapLoadDecoratedContentListWithDetailsToState() async* {
    int amountNow =  (state is DecoratedContentListLoaded) ? (state as DecoratedContentListLoaded).values.length : 0;
    _decoratedContentsListSubscription?.cancel();
    _decoratedContentsListSubscription = _decoratedContentRepository.listenWithDetails(
            (list) => add(DecoratedContentListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _decoratedContentLimit : null
    );
  }

  Stream<DecoratedContentListState> _mapAddDecoratedContentListToState(AddDecoratedContentList event) async* {
    _decoratedContentRepository.add(event.value);
  }

  Stream<DecoratedContentListState> _mapUpdateDecoratedContentListToState(UpdateDecoratedContentList event) async* {
    _decoratedContentRepository.update(event.value);
  }

  Stream<DecoratedContentListState> _mapDeleteDecoratedContentListToState(DeleteDecoratedContentList event) async* {
    _decoratedContentRepository.delete(event.value);
  }

  Stream<DecoratedContentListState> _mapDecoratedContentListUpdatedToState(
      DecoratedContentListUpdated event) async* {
    yield DecoratedContentListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<DecoratedContentListState> mapEventToState(DecoratedContentListEvent event) async* {
    if (event is LoadDecoratedContentList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadDecoratedContentListToState();
      } else {
        yield* _mapLoadDecoratedContentListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadDecoratedContentListWithDetailsToState();
    } else if (event is AddDecoratedContentList) {
      yield* _mapAddDecoratedContentListToState(event);
    } else if (event is UpdateDecoratedContentList) {
      yield* _mapUpdateDecoratedContentListToState(event);
    } else if (event is DeleteDecoratedContentList) {
      yield* _mapDeleteDecoratedContentListToState(event);
    } else if (event is DecoratedContentListUpdated) {
      yield* _mapDecoratedContentListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _decoratedContentsListSubscription?.cancel();
    return super.close();
  }
}


