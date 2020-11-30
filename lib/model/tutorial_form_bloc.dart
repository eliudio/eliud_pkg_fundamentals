/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/types.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/tutorial_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';

class TutorialFormBloc extends Bloc<TutorialFormEvent, TutorialFormState> {
  final FormAction formAction;
  final String appId;

  TutorialFormBloc(this.appId, { this.formAction }): super(TutorialFormUninitialized());
  @override
  Stream<TutorialFormState> mapEventToState(TutorialFormEvent event) async* {
    final currentState = state;
    if (currentState is TutorialFormUninitialized) {
      if (event is InitialiseNewTutorialFormEvent) {
        TutorialFormLoaded loaded = TutorialFormLoaded(value: TutorialModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 title: "",
                                 description: "",
                                 tutorialEntries: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseTutorialFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        TutorialFormLoaded loaded = TutorialFormLoaded(value: await tutorialRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseTutorialFormNoLoadEvent) {
        TutorialFormLoaded loaded = TutorialFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is TutorialFormInitialized) {
      TutorialModel newValue = null;
      if (event is ChangedTutorialDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableTutorialForm(value: newValue);
        }

        return;
      }
      if (event is ChangedTutorialName) {
        newValue = currentState.value.copyWith(name: event.value);
        yield SubmittableTutorialForm(value: newValue);

        return;
      }
      if (event is ChangedTutorialTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittableTutorialForm(value: newValue);

        return;
      }
      if (event is ChangedTutorialDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittableTutorialForm(value: newValue);

        return;
      }
      if (event is ChangedTutorialTutorialEntries) {
        newValue = currentState.value.copyWith(tutorialEntries: event.value);
        yield SubmittableTutorialForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDTutorialFormError error(String message, TutorialModel newValue) => DocumentIDTutorialFormError(message: message, value: newValue);

  Future<TutorialFormState> _isDocumentIDValid(String value, TutorialModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<TutorialModel> findDocument = tutorialRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableTutorialForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

