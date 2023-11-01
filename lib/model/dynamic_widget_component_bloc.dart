/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_fundamentals/model/dynamic_widget_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_component_state.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_repository.dart';

class DynamicWidgetComponentBloc extends Bloc<DynamicWidgetComponentEvent, DynamicWidgetComponentState> {
  final DynamicWidgetRepository? dynamicWidgetRepository;
  StreamSubscription? _dynamicWidgetSubscription;

  void _mapLoadDynamicWidgetComponentUpdateToState(String documentId) {
    _dynamicWidgetSubscription?.cancel();
    _dynamicWidgetSubscription = dynamicWidgetRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(DynamicWidgetComponentUpdated(value: value));
      }
    });
  }

  DynamicWidgetComponentBloc({ this.dynamicWidgetRepository }): super(DynamicWidgetComponentUninitialized()) {
    on <FetchDynamicWidgetComponent> ((event, emit) {
      _mapLoadDynamicWidgetComponentUpdateToState(event.id!);
    });
    on <DynamicWidgetComponentUpdated> ((event, emit) {
      emit(DynamicWidgetComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _dynamicWidgetSubscription?.cancel();
    return super.close();
  }

}

