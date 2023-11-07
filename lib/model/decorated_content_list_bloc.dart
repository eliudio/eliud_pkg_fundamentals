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

import 'package:eliud_pkg_fundamentals/model/decorated_content_repository.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'decorated_content_model.dart';

typedef FilterDecoratedContentModels = List<DecoratedContentModel?> Function(
    List<DecoratedContentModel?> values);

class DecoratedContentListBloc
    extends Bloc<DecoratedContentListEvent, DecoratedContentListState> {
  final FilterDecoratedContentModels? filter;
  final DecoratedContentRepository _decoratedContentRepository;
  StreamSubscription? _decoratedContentsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int decoratedContentLimit;

  DecoratedContentListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required DecoratedContentRepository decoratedContentRepository,
      this.decoratedContentLimit = 5})
      : _decoratedContentRepository = decoratedContentRepository,
        super(DecoratedContentListLoading()) {
    on<LoadDecoratedContentList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDecoratedContentListToState();
      } else {
        _mapLoadDecoratedContentListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadDecoratedContentListWithDetailsToState();
    });

    on<DecoratedContentChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadDecoratedContentListToState();
      } else {
        _mapLoadDecoratedContentListWithDetailsToState();
      }
    });

    on<AddDecoratedContentList>((event, emit) async {
      await _mapAddDecoratedContentListToState(event);
    });

    on<UpdateDecoratedContentList>((event, emit) async {
      await _mapUpdateDecoratedContentListToState(event);
    });

    on<DeleteDecoratedContentList>((event, emit) async {
      await _mapDeleteDecoratedContentListToState(event);
    });

    on<DecoratedContentListUpdated>((event, emit) {
      emit(_mapDecoratedContentListUpdatedToState(event));
    });
  }

  List<DecoratedContentModel?> _filter(List<DecoratedContentModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadDecoratedContentListToState() async {
    int amountNow = (state is DecoratedContentListLoaded)
        ? (state as DecoratedContentListLoaded).values!.length
        : 0;
    _decoratedContentsListSubscription?.cancel();
    _decoratedContentsListSubscription = _decoratedContentRepository.listen(
        (list) => add(DecoratedContentListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit:
            ((paged != null) && paged!) ? pages * decoratedContentLimit : null);
  }

  Future<void> _mapLoadDecoratedContentListWithDetailsToState() async {
    int amountNow = (state is DecoratedContentListLoaded)
        ? (state as DecoratedContentListLoaded).values!.length
        : 0;
    _decoratedContentsListSubscription?.cancel();
    _decoratedContentsListSubscription =
        _decoratedContentRepository.listenWithDetails(
            (list) => add(DecoratedContentListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * decoratedContentLimit
                : null);
  }

  Future<void> _mapAddDecoratedContentListToState(
      AddDecoratedContentList event) async {
    var value = event.value;
    if (value != null) {
      await _decoratedContentRepository.add(value);
    }
  }

  Future<void> _mapUpdateDecoratedContentListToState(
      UpdateDecoratedContentList event) async {
    var value = event.value;
    if (value != null) {
      await _decoratedContentRepository.update(value);
    }
  }

  Future<void> _mapDeleteDecoratedContentListToState(
      DeleteDecoratedContentList event) async {
    var value = event.value;
    if (value != null) {
      await _decoratedContentRepository.delete(value);
    }
  }

  DecoratedContentListLoaded _mapDecoratedContentListUpdatedToState(
          DecoratedContentListUpdated event) =>
      DecoratedContentListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _decoratedContentsListSubscription?.cancel();
    return super.close();
  }
}
