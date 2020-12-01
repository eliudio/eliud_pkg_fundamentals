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


class SimpleImageListBloc extends Bloc<SimpleImageListEvent, SimpleImageListState> {
  final SimpleImageRepository _simpleImageRepository;
  StreamSubscription _simpleImagesListSubscription;

  SimpleImageListBloc({ @required SimpleImageRepository simpleImageRepository })
      : assert(simpleImageRepository != null),
      _simpleImageRepository = simpleImageRepository,
      super(SimpleImageListLoading());

  Stream<SimpleImageListState> _mapLoadSimpleImageListToState() async* {
    _simpleImagesListSubscription?.cancel();
    _simpleImagesListSubscription = _simpleImageRepository.listen( (list) => add(SimpleImageListUpdated(value: list)));
  }

  Stream<SimpleImageListState> _mapLoadSimpleImageListWithDetailsToState() async* {
    _simpleImagesListSubscription?.cancel();
    _simpleImagesListSubscription = _simpleImageRepository.listenWithDetails( (list) => add(SimpleImageListUpdated(value: list)));
  }

  Stream<SimpleImageListState> _mapAddSimpleImageListToState(AddSimpleImageList event) async* {
    _simpleImageRepository.add(event.value);
  }

  Stream<SimpleImageListState> _mapUpdateSimpleImageListToState(UpdateSimpleImageList event) async* {
    _simpleImageRepository.update(event.value);
  }

  Stream<SimpleImageListState> _mapDeleteSimpleImageListToState(DeleteSimpleImageList event) async* {
    _simpleImageRepository.delete(event.value);
  }

  Stream<SimpleImageListState> _mapSimpleImageListUpdatedToState(SimpleImageListUpdated event) async* {
    yield SimpleImageListLoaded(values: event.value);
  }


  @override
  Stream<SimpleImageListState> mapEventToState(SimpleImageListEvent event) async* {
    final currentState = state;
    if (event is LoadSimpleImageList) {
      yield* _mapLoadSimpleImageListToState();
    } if (event is LoadSimpleImageListWithDetails) {
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


