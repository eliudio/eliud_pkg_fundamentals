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
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_event.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';


class FaderListBloc extends Bloc<FaderListEvent, FaderListState> {
  final FaderRepository _faderRepository;
  StreamSubscription _fadersListSubscription;
  final AccessBloc accessBloc;
  final EliudQuery eliudQuery;


  FaderListBloc(this.accessBloc,{ this.eliudQuery, @required FaderRepository faderRepository })
      : assert(faderRepository != null),
      _faderRepository = faderRepository,
      super(FaderListLoading());

  Stream<FaderListState> _mapLoadFaderListToState({ String orderBy, bool descending }) async* {
    _fadersListSubscription?.cancel();
    _fadersListSubscription = _faderRepository.listen((list) => add(FaderListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<FaderListState> _mapLoadFaderListWithDetailsToState({ String orderBy, bool descending }) async* {
    _fadersListSubscription?.cancel();
    _fadersListSubscription = _faderRepository.listenWithDetails((list) => add(FaderListUpdated(value: list)), orderBy: orderBy, descending: descending, eliudQuery: eliudQuery,);
  }

  Stream<FaderListState> _mapAddFaderListToState(AddFaderList event) async* {
    _faderRepository.add(event.value);
  }

  Stream<FaderListState> _mapUpdateFaderListToState(UpdateFaderList event) async* {
    _faderRepository.update(event.value);
  }

  Stream<FaderListState> _mapDeleteFaderListToState(DeleteFaderList event) async* {
    _faderRepository.delete(event.value);
  }

  Stream<FaderListState> _mapFaderListUpdatedToState(FaderListUpdated event) async* {
    yield FaderListLoaded(values: event.value);
  }


  @override
  Stream<FaderListState> mapEventToState(FaderListEvent event) async* {
    final currentState = state;
    if (event is LoadFaderList) {
      yield* _mapLoadFaderListToState(orderBy: event.orderBy, descending: event.descending);
    } if (event is LoadFaderListWithDetails) {
      yield* _mapLoadFaderListWithDetailsToState();
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


