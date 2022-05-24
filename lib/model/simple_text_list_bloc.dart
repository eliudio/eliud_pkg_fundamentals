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



class SimpleTextListBloc extends Bloc<SimpleTextListEvent, SimpleTextListState> {
  final SimpleTextRepository _simpleTextRepository;
  StreamSubscription? _simpleTextsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int simpleTextLimit;

  SimpleTextListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required SimpleTextRepository simpleTextRepository, this.simpleTextLimit = 5})
      : assert(simpleTextRepository != null),
        _simpleTextRepository = simpleTextRepository,
        super(SimpleTextListLoading()) {
    on <LoadSimpleTextList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadSimpleTextListToState();
      } else {
        _mapLoadSimpleTextListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadSimpleTextListWithDetailsToState();
    });
    
    on <SimpleTextChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadSimpleTextListToState();
      } else {
        _mapLoadSimpleTextListWithDetailsToState();
      }
    });
      
    on <AddSimpleTextList> ((event, emit) async {
      await _mapAddSimpleTextListToState(event);
    });
    
    on <UpdateSimpleTextList> ((event, emit) async {
      await _mapUpdateSimpleTextListToState(event);
    });
    
    on <DeleteSimpleTextList> ((event, emit) async {
      await _mapDeleteSimpleTextListToState(event);
    });
    
    on <SimpleTextListUpdated> ((event, emit) {
      emit(_mapSimpleTextListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadSimpleTextListToState() async {
    int amountNow =  (state is SimpleTextListLoaded) ? (state as SimpleTextListLoaded).values!.length : 0;
    _simpleTextsListSubscription?.cancel();
    _simpleTextsListSubscription = _simpleTextRepository.listen(
          (list) => add(SimpleTextListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * simpleTextLimit : null
    );
  }

  Future<void> _mapLoadSimpleTextListWithDetailsToState() async {
    int amountNow =  (state is SimpleTextListLoaded) ? (state as SimpleTextListLoaded).values!.length : 0;
    _simpleTextsListSubscription?.cancel();
    _simpleTextsListSubscription = _simpleTextRepository.listenWithDetails(
            (list) => add(SimpleTextListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * simpleTextLimit : null
    );
  }

  Future<void> _mapAddSimpleTextListToState(AddSimpleTextList event) async {
    var value = event.value;
    if (value != null) {
      await _simpleTextRepository.add(value);
    }
  }

  Future<void> _mapUpdateSimpleTextListToState(UpdateSimpleTextList event) async {
    var value = event.value;
    if (value != null) {
      await _simpleTextRepository.update(value);
    }
  }

  Future<void> _mapDeleteSimpleTextListToState(DeleteSimpleTextList event) async {
    var value = event.value;
    if (value != null) {
      await _simpleTextRepository.delete(value);
    }
  }

  SimpleTextListLoaded _mapSimpleTextListUpdatedToState(
      SimpleTextListUpdated event) => SimpleTextListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _simpleTextsListSubscription?.cancel();
    return super.close();
  }
}


