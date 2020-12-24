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
  final FormAction formAction;
  final String appId;

  PresentationFormBloc(this.appId, { this.formAction }): super(PresentationFormUninitialized());
  @override
  Stream<PresentationFormState> mapEventToState(PresentationFormEvent event) async* {
    final currentState = state;
    if (currentState is PresentationFormUninitialized) {
      if (event is InitialiseNewPresentationFormEvent) {
        PresentationFormLoaded loaded = PresentationFormLoaded(value: PresentationModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 bodyComponents: [],
                                 imageWidth: 0.0,

        ));
        yield loaded;
        return;

      }


      if (event is InitialisePresentationFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PresentationFormLoaded loaded = PresentationFormLoaded(value: await presentationRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePresentationFormNoLoadEvent) {
        PresentationFormLoaded loaded = PresentationFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PresentationFormInitialized) {
      PresentationModel newValue = null;
      if (event is ChangedPresentationDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePresentationForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPresentationTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittablePresentationForm(value: newValue);

        return;
      }
      if (event is ChangedPresentationBodyComponents) {
        newValue = currentState.value.copyWith(bodyComponents: event.value);
        yield SubmittablePresentationForm(value: newValue);

        return;
      }
      if (event is ChangedPresentationImage) {
        if (event.value != null)
          newValue = currentState.value.copyWith(image: await imageRepository(appId: appId).get(event.value));
        else
          newValue = new PresentationModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 bodyComponents: currentState.value.bodyComponents,
                                 image: null,
                                 imagePositionRelative: currentState.value.imagePositionRelative,
                                 imageAlignment: currentState.value.imageAlignment,
                                 imageWidth: currentState.value.imageWidth,
          );
        yield SubmittablePresentationForm(value: newValue);

        return;
      }
      if (event is ChangedPresentationImagePositionRelative) {
        newValue = currentState.value.copyWith(imagePositionRelative: event.value);
        yield SubmittablePresentationForm(value: newValue);

        return;
      }
      if (event is ChangedPresentationImageAlignment) {
        newValue = currentState.value.copyWith(imageAlignment: event.value);
        yield SubmittablePresentationForm(value: newValue);

        return;
      }
      if (event is ChangedPresentationImageWidth) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(imageWidth: double.parse(event.value));
          yield SubmittablePresentationForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(imageWidth: 0.0);
          yield ImageWidthPresentationFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
    }
  }


  DocumentIDPresentationFormError error(String message, PresentationModel newValue) => DocumentIDPresentationFormError(message: message, value: newValue);

  Future<PresentationFormState> _isDocumentIDValid(String value, PresentationModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PresentationModel> findDocument = presentationRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePresentationForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

