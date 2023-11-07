/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/decorated_content_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_repository.dart';

class DecoratedContentComponentBloc extends Bloc<DecoratedContentComponentEvent,
    DecoratedContentComponentState> {
  final DecoratedContentRepository? decoratedContentRepository;
  StreamSubscription? _decoratedContentSubscription;

  void _mapLoadDecoratedContentComponentUpdateToState(String documentId) {
    _decoratedContentSubscription?.cancel();
    _decoratedContentSubscription =
        decoratedContentRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(DecoratedContentComponentUpdated(value: value));
      }
    });
  }

  DecoratedContentComponentBloc({this.decoratedContentRepository})
      : super(DecoratedContentComponentUninitialized()) {
    on<FetchDecoratedContentComponent>((event, emit) {
      _mapLoadDecoratedContentComponentUpdateToState(event.id!);
    });
    on<DecoratedContentComponentUpdated>((event, emit) {
      emit(DecoratedContentComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _decoratedContentSubscription?.cancel();
    return super.close();
  }
}
