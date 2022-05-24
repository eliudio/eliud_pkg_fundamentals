/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core/tools/firestore/firestore_tools.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/listed_item_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_repository.dart';

class ListedItemFormBloc extends Bloc<ListedItemFormEvent, ListedItemFormState> {
  final String? appId;

  ListedItemFormBloc(this.appId, ): super(ListedItemFormUninitialized());
  @override
  Stream<ListedItemFormState> mapEventToState(ListedItemFormEvent event) async* {
    final currentState = state;
    if (currentState is ListedItemFormUninitialized) {
      on <InitialiseNewListedItemFormEvent> ((event, emit) {
        ListedItemFormLoaded loaded = ListedItemFormLoaded(value: ListedItemModel(
                                               documentID: "IDENTIFIED", 
                                 description: "",

        ));
        emit(loaded);
      });


      if (event is InitialiseListedItemFormEvent) {
        ListedItemFormLoaded loaded = ListedItemFormLoaded(value: event.value);
        emit(loaded);
      } else if (event is InitialiseListedItemFormNoLoadEvent) {
        ListedItemFormLoaded loaded = ListedItemFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is ListedItemFormInitialized) {
      ListedItemModel? newValue = null;
      on <ChangedListedItemDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableListedItemForm(value: newValue));

      });
      on <ChangedListedItemAction> ((event, emit) async {
        newValue = currentState.value!.copyWith(action: event.value);
        emit(SubmittableListedItemForm(value: newValue));

      });
      on <ChangedListedItemImage> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(image: await platformMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableListedItemForm(value: newValue));

      });
      on <ChangedListedItemPosSize> ((event, emit) async {
        newValue = currentState.value!.copyWith(posSize: event.value);
        emit(SubmittableListedItemForm(value: newValue));

      });
    }
  }


}

