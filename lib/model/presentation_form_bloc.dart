/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/presentation_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';

class PresentationFormBloc extends Bloc<PresentationFormEvent, PresentationFormState> {
  final FormAction? formAction;
  final String? appId;

  PresentationFormBloc(this.appId, { this.formAction }): super(PresentationFormUninitialized()) {
      on <InitialiseNewPresentationFormEvent> ((event, emit) {
        PresentationFormLoaded loaded = PresentationFormLoaded(value: PresentationModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 bodyComponents: [],
                                 imageWidth: 0.0,

        ));
        emit(loaded);
      });


      on <InitialisePresentationFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PresentationFormLoaded loaded = PresentationFormLoaded(value: await presentationRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialisePresentationFormNoLoadEvent> ((event, emit) async {
        PresentationFormLoaded loaded = PresentationFormLoaded(value: event.value);
        emit(loaded);
      });
      PresentationModel? newValue = null;
      on <ChangedPresentationDocumentID> ((event, emit) async {
      if (state is PresentationFormInitialized) {
        final currentState = state as PresentationFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittablePresentationForm(value: newValue));
        }

      }
      });
      on <ChangedPresentationDescription> ((event, emit) async {
      if (state is PresentationFormInitialized) {
        final currentState = state as PresentationFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittablePresentationForm(value: newValue));

      }
      });
      on <ChangedPresentationBodyComponents> ((event, emit) async {
      if (state is PresentationFormInitialized) {
        final currentState = state as PresentationFormInitialized;
        newValue = currentState.value!.copyWith(bodyComponents: event.value);
        emit(SubmittablePresentationForm(value: newValue));

      }
      });
      on <ChangedPresentationImage> ((event, emit) async {
      if (state is PresentationFormInitialized) {
        final currentState = state as PresentationFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(image: await platformMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittablePresentationForm(value: newValue));

      }
      });
      on <ChangedPresentationImagePositionRelative> ((event, emit) async {
      if (state is PresentationFormInitialized) {
        final currentState = state as PresentationFormInitialized;
        newValue = currentState.value!.copyWith(imagePositionRelative: event.value);
        emit(SubmittablePresentationForm(value: newValue));

      }
      });
      on <ChangedPresentationImageAlignment> ((event, emit) async {
      if (state is PresentationFormInitialized) {
        final currentState = state as PresentationFormInitialized;
        newValue = currentState.value!.copyWith(imageAlignment: event.value);
        emit(SubmittablePresentationForm(value: newValue));

      }
      });
      on <ChangedPresentationImageWidth> ((event, emit) async {
      if (state is PresentationFormInitialized) {
        final currentState = state as PresentationFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(imageWidth: double.parse(event.value!));
          emit(SubmittablePresentationForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(imageWidth: 0.0);
          emit(ImageWidthPresentationFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedPresentationConditions> ((event, emit) async {
      if (state is PresentationFormInitialized) {
        final currentState = state as PresentationFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittablePresentationForm(value: newValue));

      }
      });
  }


  DocumentIDPresentationFormError error(String message, PresentationModel newValue) => DocumentIDPresentationFormError(message: message, value: newValue);

  Future<PresentationFormState> _isDocumentIDValid(String? value, PresentationModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PresentationModel?> findDocument = presentationRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePresentationForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

