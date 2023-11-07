/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/simple_text_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_repository.dart';

class SimpleTextComponentBloc
    extends Bloc<SimpleTextComponentEvent, SimpleTextComponentState> {
  final SimpleTextRepository? simpleTextRepository;
  StreamSubscription? _simpleTextSubscription;

  void _mapLoadSimpleTextComponentUpdateToState(String documentId) {
    _simpleTextSubscription?.cancel();
    _simpleTextSubscription =
        simpleTextRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(SimpleTextComponentUpdated(value: value));
      }
    });
  }

  SimpleTextComponentBloc({this.simpleTextRepository})
      : super(SimpleTextComponentUninitialized()) {
    on<FetchSimpleTextComponent>((event, emit) {
      _mapLoadSimpleTextComponentUpdateToState(event.id!);
    });
    on<SimpleTextComponentUpdated>((event, emit) {
      emit(SimpleTextComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _simpleTextSubscription?.cancel();
    return super.close();
  }
}
