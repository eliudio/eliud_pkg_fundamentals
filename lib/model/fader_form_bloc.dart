/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/fader_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/fader_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';

class FaderFormBloc extends Bloc<FaderFormEvent, FaderFormState> {
  final FormAction formAction;
  final String appId;

  FaderFormBloc(this.appId, { this.formAction }): super(FaderFormUninitialized());
  @override
  Stream<FaderFormState> mapEventToState(FaderFormEvent event) async* {
    final currentState = state;
    if (currentState is FaderFormUninitialized) {
      if (event is InitialiseNewFaderFormEvent) {
        FaderFormLoaded loaded = FaderFormLoaded(value: FaderModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 animationMilliseconds: 0,
                                 imageSeconds: 0,
                                 items: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseFaderFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        FaderFormLoaded loaded = FaderFormLoaded(value: await faderRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseFaderFormNoLoadEvent) {
        FaderFormLoaded loaded = FaderFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is FaderFormInitialized) {
      FaderModel newValue = null;
      if (event is ChangedFaderDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableFaderForm(value: newValue);
        }

        return;
      }
      if (event is ChangedFaderName) {
        newValue = currentState.value.copyWith(name: event.value);
        yield SubmittableFaderForm(value: newValue);

        return;
      }
      if (event is ChangedFaderAnimationMilliseconds) {
        if (isInt(event.value)) {
          newValue = currentState.value.copyWith(animationMilliseconds: int.parse(event.value));
          yield SubmittableFaderForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(animationMilliseconds: 0);
          yield AnimationMillisecondsFaderFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedFaderImageSeconds) {
        if (isInt(event.value)) {
          newValue = currentState.value.copyWith(imageSeconds: int.parse(event.value));
          yield SubmittableFaderForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(imageSeconds: 0);
          yield ImageSecondsFaderFormError(message: "Value should be a number", value: newValue);
        }
        return;
      }
      if (event is ChangedFaderItems) {
        newValue = currentState.value.copyWith(items: event.value);
        yield SubmittableFaderForm(value: newValue);

        return;
      }
      if (event is ChangedFaderConditions) {
        newValue = currentState.value.copyWith(conditions: event.value);
        yield SubmittableFaderForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDFaderFormError error(String message, FaderModel newValue) => DocumentIDFaderFormError(message: message, value: newValue);

  Future<FaderFormState> _isDocumentIDValid(String value, FaderModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<FaderModel> findDocument = faderRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableFaderForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

