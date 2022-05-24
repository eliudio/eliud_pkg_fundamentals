/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/tutorial_entry_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_repository.dart';

class TutorialEntryFormBloc extends Bloc<TutorialEntryFormEvent, TutorialEntryFormState> {
  final String? appId;

  TutorialEntryFormBloc(this.appId, ): super(TutorialEntryFormUninitialized());
  @override
  Stream<TutorialEntryFormState> mapEventToState(TutorialEntryFormEvent event) async* {
    final currentState = state;
    if (currentState is TutorialEntryFormUninitialized) {
      on <InitialiseNewTutorialEntryFormEvent> ((event, emit) {
        TutorialEntryFormLoaded loaded = TutorialEntryFormLoaded(value: TutorialEntryModel(
                                               documentID: "IDENTIFIED", 
                                 description: "",
                                 code: "",

        ));
        emit(loaded);
      });


      if (event is InitialiseTutorialEntryFormEvent) {
        TutorialEntryFormLoaded loaded = TutorialEntryFormLoaded(value: event.value);
        emit(loaded);
      } else if (event is InitialiseTutorialEntryFormNoLoadEvent) {
        TutorialEntryFormLoaded loaded = TutorialEntryFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is TutorialEntryFormInitialized) {
      TutorialEntryModel? newValue = null;
      on <ChangedTutorialEntryDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableTutorialEntryForm(value: newValue));

      });
      on <ChangedTutorialEntryImage> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(image: await platformMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableTutorialEntryForm(value: newValue));

      });
      on <ChangedTutorialEntryCode> ((event, emit) async {
        newValue = currentState.value!.copyWith(code: event.value);
        emit(SubmittableTutorialEntryForm(value: newValue));

      });
    }
  }


}

