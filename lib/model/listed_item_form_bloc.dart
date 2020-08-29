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
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/types.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'listed_item_form_event.dart';
import 'listed_item_form_state.dart';

class ListedItemFormBloc extends Bloc<ListedItemFormEvent, ListedItemFormState> {
  final ImageRepository _imageRepository = imageRepository();
  final PosSizeRepository _posSizeRepository = posSizeRepository();

  ListedItemFormBloc(): super(ListedItemFormUninitialized());
  @override
  Stream<ListedItemFormState> mapEventToState(ListedItemFormEvent event) async* {
    final currentState = state;
    if (currentState is ListedItemFormUninitialized) {
      if (event is InitialiseNewListedItemFormEvent) {
        ListedItemFormLoaded loaded = ListedItemFormLoaded(value: ListedItemModel(
                                               documentID: "IDENTIFIED", 
                                 description: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseListedItemFormEvent) {
        ListedItemFormLoaded loaded = ListedItemFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseListedItemFormNoLoadEvent) {
        ListedItemFormLoaded loaded = ListedItemFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is ListedItemFormInitialized) {
      ListedItemModel newValue = null;
      if (event is ChangedListedItemDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittableListedItemForm(value: newValue);

        return;
      }
      if (event is ChangedListedItemAction) {
        newValue = currentState.value.copyWith(action: event.value);
        yield SubmittableListedItemForm(value: newValue);

        return;
      }
      if (event is ChangedListedItemImage) {
        if (event.value != null)
          newValue = currentState.value.copyWith(image: await _imageRepository.get(event.value));
        else
          newValue = new ListedItemModel(
                                 documentID: currentState.value.documentID,
                                 description: currentState.value.description,
                                 action: currentState.value.action,
                                 image: null,
                                 posSize: currentState.value.posSize,
          );
        yield SubmittableListedItemForm(value: newValue);

        return;
      }
      if (event is ChangedListedItemPosSize) {
        if (event.value != null)
          newValue = currentState.value.copyWith(posSize: await _posSizeRepository.get(event.value));
        else
          newValue = new ListedItemModel(
                                 documentID: currentState.value.documentID,
                                 description: currentState.value.description,
                                 action: currentState.value.action,
                                 image: currentState.value.image,
                                 posSize: null,
          );
        yield SubmittableListedItemForm(value: newValue);

        return;
      }
    }
  }


}

