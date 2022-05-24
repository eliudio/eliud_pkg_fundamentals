/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/simple_image_repository.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';



class SimpleImageListBloc extends Bloc<SimpleImageListEvent, SimpleImageListState> {
  final SimpleImageRepository _simpleImageRepository;
  StreamSubscription? _simpleImagesListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int simpleImageLimit;

  SimpleImageListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required SimpleImageRepository simpleImageRepository, this.simpleImageLimit = 5})
      : assert(simpleImageRepository != null),
        _simpleImageRepository = simpleImageRepository,
        super(SimpleImageListLoading()) {
    on <LoadSimpleImageList> ((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadSimpleImageListToState();
      } else {
        _mapLoadSimpleImageListWithDetailsToState();
      }
    });
    
    on <NewPage> ((event, emit) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadSimpleImageListWithDetailsToState();
    });
    
    on <SimpleImageChangeQuery> ((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadSimpleImageListToState();
      } else {
        _mapLoadSimpleImageListWithDetailsToState();
      }
    });
      
    on <AddSimpleImageList> ((event, emit) async {
      await _mapAddSimpleImageListToState(event);
    });
    
    on <UpdateSimpleImageList> ((event, emit) async {
      await _mapUpdateSimpleImageListToState(event);
    });
    
    on <DeleteSimpleImageList> ((event, emit) async {
      await _mapDeleteSimpleImageListToState(event);
    });
    
    on <SimpleImageListUpdated> ((event, emit) {
      emit(_mapSimpleImageListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadSimpleImageListToState() async {
    int amountNow =  (state is SimpleImageListLoaded) ? (state as SimpleImageListLoaded).values!.length : 0;
    _simpleImagesListSubscription?.cancel();
    _simpleImagesListSubscription = _simpleImageRepository.listen(
          (list) => add(SimpleImageListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * simpleImageLimit : null
    );
  }

  Future<void> _mapLoadSimpleImageListWithDetailsToState() async {
    int amountNow =  (state is SimpleImageListLoaded) ? (state as SimpleImageListLoaded).values!.length : 0;
    _simpleImagesListSubscription?.cancel();
    _simpleImagesListSubscription = _simpleImageRepository.listenWithDetails(
            (list) => add(SimpleImageListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * simpleImageLimit : null
    );
  }

  Future<void> _mapAddSimpleImageListToState(AddSimpleImageList event) async {
    var value = event.value;
    if (value != null) {
      await _simpleImageRepository.add(value);
    }
  }

  Future<void> _mapUpdateSimpleImageListToState(UpdateSimpleImageList event) async {
    var value = event.value;
    if (value != null) {
      await _simpleImageRepository.update(value);
    }
  }

  Future<void> _mapDeleteSimpleImageListToState(DeleteSimpleImageList event) async {
    var value = event.value;
    if (value != null) {
      await _simpleImageRepository.delete(value);
    }
  }

  SimpleImageListLoaded _mapSimpleImageListUpdatedToState(
      SimpleImageListUpdated event) => SimpleImageListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _simpleImagesListSubscription?.cancel();
    return super.close();
  }
}


