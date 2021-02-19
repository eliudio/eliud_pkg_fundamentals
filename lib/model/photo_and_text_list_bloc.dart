/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_pkg_fundamentals/model/photo_and_text_repository.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _photoAndTextLimit = 5;

class PhotoAndTextListBloc extends Bloc<PhotoAndTextListEvent, PhotoAndTextListState> {
  final PhotoAndTextRepository _photoAndTextRepository;
  StreamSubscription _photoAndTextsListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  PhotoAndTextListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required PhotoAndTextRepository photoAndTextRepository})
      : assert(photoAndTextRepository != null),
        _photoAndTextRepository = photoAndTextRepository,
        super(PhotoAndTextListLoading());

  Stream<PhotoAndTextListState> _mapLoadPhotoAndTextListToState() async* {
    int amountNow =  (state is PhotoAndTextListLoaded) ? (state as PhotoAndTextListLoaded).values.length : 0;
    _photoAndTextsListSubscription?.cancel();
    _photoAndTextsListSubscription = _photoAndTextRepository.listen(
          (list) => add(PhotoAndTextListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _photoAndTextLimit : null
    );
  }

  Stream<PhotoAndTextListState> _mapLoadPhotoAndTextListWithDetailsToState() async* {
    int amountNow =  (state is PhotoAndTextListLoaded) ? (state as PhotoAndTextListLoaded).values.length : 0;
    _photoAndTextsListSubscription?.cancel();
    _photoAndTextsListSubscription = _photoAndTextRepository.listenWithDetails(
            (list) => add(PhotoAndTextListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _photoAndTextLimit : null
    );
  }

  Stream<PhotoAndTextListState> _mapAddPhotoAndTextListToState(AddPhotoAndTextList event) async* {
    _photoAndTextRepository.add(event.value);
  }

  Stream<PhotoAndTextListState> _mapUpdatePhotoAndTextListToState(UpdatePhotoAndTextList event) async* {
    _photoAndTextRepository.update(event.value);
  }

  Stream<PhotoAndTextListState> _mapDeletePhotoAndTextListToState(DeletePhotoAndTextList event) async* {
    _photoAndTextRepository.delete(event.value);
  }

  Stream<PhotoAndTextListState> _mapPhotoAndTextListUpdatedToState(
      PhotoAndTextListUpdated event) async* {
    yield PhotoAndTextListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<PhotoAndTextListState> mapEventToState(PhotoAndTextListEvent event) async* {
    if (event is LoadPhotoAndTextList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadPhotoAndTextListToState();
      } else {
        yield* _mapLoadPhotoAndTextListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadPhotoAndTextListWithDetailsToState();
    } else if (event is AddPhotoAndTextList) {
      yield* _mapAddPhotoAndTextListToState(event);
    } else if (event is UpdatePhotoAndTextList) {
      yield* _mapUpdatePhotoAndTextListToState(event);
    } else if (event is DeletePhotoAndTextList) {
      yield* _mapDeletePhotoAndTextListToState(event);
    } else if (event is PhotoAndTextListUpdated) {
      yield* _mapPhotoAndTextListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _photoAndTextsListSubscription?.cancel();
    return super.close();
  }
}


