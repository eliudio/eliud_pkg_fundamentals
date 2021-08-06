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
      if (event is InitialiseNewTutorialEntryFormEvent) {
        TutorialEntryFormLoaded loaded = TutorialEntryFormLoaded(value: TutorialEntryModel(
                                               documentID: "IDENTIFIED", 
                                 description: "",
                                 code: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseTutorialEntryFormEvent) {
        TutorialEntryFormLoaded loaded = TutorialEntryFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseTutorialEntryFormNoLoadEvent) {
        TutorialEntryFormLoaded loaded = TutorialEntryFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is TutorialEntryFormInitialized) {
      TutorialEntryModel? newValue = null;
      if (event is ChangedTutorialEntryDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableTutorialEntryForm(value: newValue);

        return;
      }
      if (event is ChangedTutorialEntryImage) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(image: await memberMediumRepository(appId: appId)!.get(event.value));
        else
          newValue = new TutorialEntryModel(
                                 documentID: currentState.value!.documentID,
                                 description: currentState.value!.description,
                                 image: null,
                                 code: currentState.value!.code,
          );
        yield SubmittableTutorialEntryForm(value: newValue);

        return;
      }
      if (event is ChangedTutorialEntryCode) {
        newValue = currentState.value!.copyWith(code: event.value);
        yield SubmittableTutorialEntryForm(value: newValue);

        return;
      }
    }
  }


}

