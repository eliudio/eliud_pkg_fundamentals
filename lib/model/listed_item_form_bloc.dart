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


import 'package:bloc/bloc.dart';




import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/listed_item_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_form_state.dart';

class ListedItemFormBloc extends Bloc<ListedItemFormEvent, ListedItemFormState> {
  final String? appId;

  ListedItemFormBloc(this.appId, ): super(ListedItemFormUninitialized()) {
      on <InitialiseNewListedItemFormEvent> ((event, emit) {
        ListedItemFormLoaded loaded = ListedItemFormLoaded(value: ListedItemModel(
                                               documentID: "IDENTIFIED", 
                                 description: "",

        ));
        emit(loaded);
      });


      on <InitialiseListedItemFormEvent> ((event, emit) async {
        ListedItemFormLoaded loaded = ListedItemFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseListedItemFormNoLoadEvent> ((event, emit) async {
        ListedItemFormLoaded loaded = ListedItemFormLoaded(value: event.value);
        emit(loaded);
      });
      ListedItemModel? newValue = null;
      on <ChangedListedItemDescription> ((event, emit) async {
      if (state is ListedItemFormInitialized) {
        final currentState = state as ListedItemFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableListedItemForm(value: newValue));

      }
      });
      on <ChangedListedItemAction> ((event, emit) async {
      if (state is ListedItemFormInitialized) {
        final currentState = state as ListedItemFormInitialized;
        newValue = currentState.value!.copyWith(action: event.value);
        emit(SubmittableListedItemForm(value: newValue));

      }
      });
      on <ChangedListedItemImage> ((event, emit) async {
      if (state is ListedItemFormInitialized) {
        final currentState = state as ListedItemFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(image: await platformMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableListedItemForm(value: newValue));

      }
      });
      on <ChangedListedItemPosSize> ((event, emit) async {
      if (state is ListedItemFormInitialized) {
        final currentState = state as ListedItemFormInitialized;
        newValue = currentState.value!.copyWith(posSize: event.value);
        emit(SubmittableListedItemForm(value: newValue));

      }
      });
  }


}

