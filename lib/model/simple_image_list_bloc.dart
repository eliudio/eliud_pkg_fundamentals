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


const _simpleImageLimit = 5;

class SimpleImageListBloc extends Bloc<SimpleImageListEvent, SimpleImageListState> {
  final SimpleImageRepository _simpleImageRepository;
  StreamSubscription? _simpleImagesListSubscription;
  final EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;

  SimpleImageListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, required SimpleImageRepository simpleImageRepository})
      : assert(simpleImageRepository != null),
        _simpleImageRepository = simpleImageRepository,
        super(SimpleImageListLoading());

  Stream<SimpleImageListState> _mapLoadSimpleImageListToState() async* {
    int amountNow =  (state is SimpleImageListLoaded) ? (state as SimpleImageListLoaded).values!.length : 0;
    _simpleImagesListSubscription?.cancel();
    _simpleImagesListSubscription = _simpleImageRepository.listen(
          (list) => add(SimpleImageListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && paged!) ? pages * _simpleImageLimit : null
    );
  }

  Stream<SimpleImageListState> _mapLoadSimpleImageListWithDetailsToState() async* {
    int amountNow =  (state is SimpleImageListLoaded) ? (state as SimpleImageListLoaded).values!.length : 0;
    _simpleImagesListSubscription?.cancel();
    _simpleImagesListSubscription = _simpleImageRepository.listenWithDetails(
            (list) => add(SimpleImageListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * _simpleImageLimit : null
    );
  }

  Stream<SimpleImageListState> _mapAddSimpleImageListToState(AddSimpleImageList event) async* {
    var value = event.value;
    if (value != null) 
      _simpleImageRepository.add(value);
  }

  Stream<SimpleImageListState> _mapUpdateSimpleImageListToState(UpdateSimpleImageList event) async* {
    var value = event.value;
    if (value != null) 
      _simpleImageRepository.update(value);
  }

  Stream<SimpleImageListState> _mapDeleteSimpleImageListToState(DeleteSimpleImageList event) async* {
    var value = event.value;
    if (value != null) 
      _simpleImageRepository.delete(value);
  }

  Stream<SimpleImageListState> _mapSimpleImageListUpdatedToState(
      SimpleImageListUpdated event) async* {
    yield SimpleImageListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<SimpleImageListState> mapEventToState(SimpleImageListEvent event) async* {
    if (event is LoadSimpleImageList) {
      if ((detailed == null) || (!detailed!)) {
        yield* _mapLoadSimpleImageListToState();
      } else {
        yield* _mapLoadSimpleImageListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadSimpleImageListWithDetailsToState();
    } else if (event is AddSimpleImageList) {
      yield* _mapAddSimpleImageListToState(event);
    } else if (event is UpdateSimpleImageList) {
      yield* _mapUpdateSimpleImageListToState(event);
    } else if (event is DeleteSimpleImageList) {
      yield* _mapDeleteSimpleImageListToState(event);
    } else if (event is SimpleImageListUpdated) {
      yield* _mapSimpleImageListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _simpleImagesListSubscription?.cancel();
    return super.close();
  }
}


