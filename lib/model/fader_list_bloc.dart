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

import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';
import 'package:eliud_pkg_fundamentals/model/fader_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/fader_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'fader_model.dart';

typedef List<FaderModel?> FilterFaderModels(List<FaderModel?> values);



class FaderListBloc extends Bloc<FaderListEvent, FaderListState> {
  final FilterFaderModels? filter;
  final FaderRepository _faderRepository;
  StreamSubscription? _fadersListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int faderLimit;

  FaderListBloc({this.filter, this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required FaderRepository faderRepository, this.faderLimit = 5})
      : _faderRepository = faderRepository,
        super(FaderListLoading()) {
    on <LoadFaderList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFaderListToState();
      } else {
        _mapLoadFaderListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadFaderListWithDetailsToState();
    });
    
    on <FaderChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFaderListToState();
      } else {
        _mapLoadFaderListWithDetailsToState();
      }
    });
      
    on <AddFaderList> ((event, emit) async {
      await _mapAddFaderListToState(event);
    });
    
    on <UpdateFaderList> ((event, emit) async {
      await _mapUpdateFaderListToState(event);
    });
    
    on <DeleteFaderList> ((event, emit) async {
      await _mapDeleteFaderListToState(event);
    });
    
    on <FaderListUpdated> ((event, emit) {
      emit(_mapFaderListUpdatedToState(event));
    });
  }

  List<FaderModel?> _filter(List<FaderModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadFaderListToState() async {
    int amountNow =  (state is FaderListLoaded) ? (state as FaderListLoaded).values!.length : 0;
    _fadersListSubscription?.cancel();
    _fadersListSubscription = _faderRepository.listen(
          (list) => add(FaderListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * faderLimit : null
    );
  }

  Future<void> _mapLoadFaderListWithDetailsToState() async {
    int amountNow =  (state is FaderListLoaded) ? (state as FaderListLoaded).values!.length : 0;
    _fadersListSubscription?.cancel();
    _fadersListSubscription = _faderRepository.listenWithDetails(
            (list) => add(FaderListUpdated(value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * faderLimit : null
    );
  }

  Future<void> _mapAddFaderListToState(AddFaderList event) async {
    var value = event.value;
    if (value != null) {
      await _faderRepository.add(value);
    }
  }

  Future<void> _mapUpdateFaderListToState(UpdateFaderList event) async {
    var value = event.value;
    if (value != null) {
      await _faderRepository.update(value);
    }
  }

  Future<void> _mapDeleteFaderListToState(DeleteFaderList event) async {
    var value = event.value;
    if (value != null) {
      await _faderRepository.delete(value);
    }
  }

  FaderListLoaded _mapFaderListUpdatedToState(
      FaderListUpdated event) => FaderListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _fadersListSubscription?.cancel();
    return super.close();
  }
}


