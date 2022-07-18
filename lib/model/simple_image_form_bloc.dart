/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/simple_image_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_repository.dart';

class SimpleImageFormBloc extends Bloc<SimpleImageFormEvent, SimpleImageFormState> {
  final FormAction? formAction;
  final String? appId;

  SimpleImageFormBloc(this.appId, { this.formAction }): super(SimpleImageFormUninitialized()) {
      on <InitialiseNewSimpleImageFormEvent> ((event, emit) {
        SimpleImageFormLoaded loaded = SimpleImageFormLoaded(value: SimpleImageModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",

        ));
        emit(loaded);
      });


      on <InitialiseSimpleImageFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        SimpleImageFormLoaded loaded = SimpleImageFormLoaded(value: await simpleImageRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseSimpleImageFormNoLoadEvent> ((event, emit) async {
        SimpleImageFormLoaded loaded = SimpleImageFormLoaded(value: event.value);
        emit(loaded);
      });
      SimpleImageModel? newValue = null;
      on <ChangedSimpleImageDocumentID> ((event, emit) async {
      if (state is SimpleImageFormInitialized) {
        final currentState = state as SimpleImageFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableSimpleImageForm(value: newValue));
        }

      }
      });
      on <ChangedSimpleImageDescription> ((event, emit) async {
      if (state is SimpleImageFormInitialized) {
        final currentState = state as SimpleImageFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableSimpleImageForm(value: newValue));

      }
      });
      on <ChangedSimpleImageImage> ((event, emit) async {
      if (state is SimpleImageFormInitialized) {
        final currentState = state as SimpleImageFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(image: await platformMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableSimpleImageForm(value: newValue));

      }
      });
      on <ChangedSimpleImageConditions> ((event, emit) async {
      if (state is SimpleImageFormInitialized) {
        final currentState = state as SimpleImageFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableSimpleImageForm(value: newValue));

      }
      });
  }


  DocumentIDSimpleImageFormError error(String message, SimpleImageModel newValue) => DocumentIDSimpleImageFormError(message: message, value: newValue);

  Future<SimpleImageFormState> _isDocumentIDValid(String? value, SimpleImageModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<SimpleImageModel?> findDocument = simpleImageRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableSimpleImageForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

