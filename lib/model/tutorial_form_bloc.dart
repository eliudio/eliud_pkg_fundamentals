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

import 'package:eliud_pkg_fundamentals/model/tutorial_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_repository.dart';

class TutorialFormBloc extends Bloc<TutorialFormEvent, TutorialFormState> {
  final FormAction? formAction;
  final String? appId;

  TutorialFormBloc(this.appId, { this.formAction }): super(TutorialFormUninitialized());
  @override
  Stream<TutorialFormState> mapEventToState(TutorialFormEvent event) async* {
    final currentState = state;
    if (currentState is TutorialFormUninitialized) {
      on <InitialiseNewTutorialFormEvent> ((event, emit) {
        TutorialFormLoaded loaded = TutorialFormLoaded(value: TutorialModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 title: "",
                                 description: "",
                                 tutorialEntries: [],

        ));
        emit(loaded);
      });


      if (event is InitialiseTutorialFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        TutorialFormLoaded loaded = TutorialFormLoaded(value: await tutorialRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseTutorialFormNoLoadEvent) {
        TutorialFormLoaded loaded = TutorialFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is TutorialFormInitialized) {
      TutorialModel? newValue = null;
      on <ChangedTutorialDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableTutorialForm(value: newValue));
        }

      });
      on <ChangedTutorialName> ((event, emit) async {
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableTutorialForm(value: newValue));

      });
      on <ChangedTutorialTitle> ((event, emit) async {
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableTutorialForm(value: newValue));

      });
      on <ChangedTutorialDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableTutorialForm(value: newValue));

      });
      on <ChangedTutorialTutorialEntries> ((event, emit) async {
        newValue = currentState.value!.copyWith(tutorialEntries: event.value);
        emit(SubmittableTutorialForm(value: newValue));

      });
      on <ChangedTutorialConditions> ((event, emit) async {
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableTutorialForm(value: newValue));

      });
    }
  }


  DocumentIDTutorialFormError error(String message, TutorialModel newValue) => DocumentIDTutorialFormError(message: message, value: newValue);

  Future<TutorialFormState> _isDocumentIDValid(String? value, TutorialModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<TutorialModel?> findDocument = tutorialRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableTutorialForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

