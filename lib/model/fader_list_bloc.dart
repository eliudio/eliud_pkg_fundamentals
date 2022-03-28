/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';
import 'package:eliud_pkg_fundamentals/model/fader_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/fader_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class FaderListBloc extends Bloc<FaderListEvent, FaderListState> {
  final FaderRepository _faderRepository;
  StreamSubscription? _fadersListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int faderLimit;

  FaderListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required FaderRepository faderRepository, this.faderLimit = 5})
      : assert(faderRepository != null),
        _faderRepository = faderRepository,
        super(FaderListLoading());

  Stream<FaderListState> _mapLoadFaderListToState() async* {
    int amountNow =  (state is FaderListLoaded) ? (state as FaderListLoaded).values!.length : 0;
    _fadersListSubscription?.cancel();
    _fadersListSubscription = _faderRepository.listen(
          (list) => add(FaderListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * faderLimit : null
    );
  }

  Stream<FaderListState> _mapLoadFaderListWithDetailsToState() async* {
    int amountNow =  (state is FaderListLoaded) ? (state as FaderListLoaded).values!.length : 0;
    _fadersListSubscription?.cancel();
    _fadersListSubscription = _faderRepository.listenWithDetails(
            (list) => add(FaderListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * faderLimit : null
    );
  }

  Stream<FaderListState> _mapAddFaderListToState(AddFaderList event) async* {
    var value = event.value;
    if (value != null) 
      _faderRepository.add(value);
  }

  Stream<FaderListState> _mapUpdateFaderListToState(UpdateFaderList event) async* {
    var value = event.value;
    if (value != null) 
      _faderRepository.update(value);
  }

  Stream<FaderListState> _mapDeleteFaderListToState(DeleteFaderList event) async* {
    var value = event.value;
    if (value != null) 
      _faderRepository.delete(value);
  }

  Stream<FaderListState> _mapFaderListUpdatedToState(
      FaderListUpdated event) async* {
    yield FaderListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<FaderListState> mapEventToState(FaderListEvent event) async* {
    if (event is LoadFaderList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadFaderListToState();
      } else {
        yield* _mapLoadFaderListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadFaderListWithDetailsToState();
    } else if (event is FaderChangeQuery) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadFaderListToState();
      } else {
        yield* _mapLoadFaderListWithDetailsToState();
      }
    } else if (event is AddFaderList) {
      yield* _mapAddFaderListToState(event);
    } else if (event is UpdateFaderList) {
      yield* _mapUpdateFaderListToState(event);
    } else if (event is DeleteFaderList) {
      yield* _mapDeleteFaderListToState(event);
    } else if (event is FaderListUpdated) {
      yield* _mapFaderListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _fadersListSubscription?.cancel();
    return super.close();
  }
}


