/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/simple_text_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_repository.dart';

class SimpleTextFormBloc extends Bloc<SimpleTextFormEvent, SimpleTextFormState> {
  final FormAction? formAction;
  final String? appId;

  SimpleTextFormBloc(this.appId, { this.formAction }): super(SimpleTextFormUninitialized());
  @override
  Stream<SimpleTextFormState> mapEventToState(SimpleTextFormEvent event) async* {
    final currentState = state;
    if (currentState is SimpleTextFormUninitialized) {
      if (event is InitialiseNewSimpleTextFormEvent) {
        SimpleTextFormLoaded loaded = SimpleTextFormLoaded(value: SimpleTextModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 title: "",
                                 text: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseSimpleTextFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        SimpleTextFormLoaded loaded = SimpleTextFormLoaded(value: await simpleTextRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseSimpleTextFormNoLoadEvent) {
        SimpleTextFormLoaded loaded = SimpleTextFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is SimpleTextFormInitialized) {
      SimpleTextModel? newValue = null;
      if (event is ChangedSimpleTextDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableSimpleTextForm(value: newValue);
        }

        return;
      }
      if (event is ChangedSimpleTextDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableSimpleTextForm(value: newValue);

        return;
      }
      if (event is ChangedSimpleTextTitle) {
        newValue = currentState.value!.copyWith(title: event.value);
        yield SubmittableSimpleTextForm(value: newValue);

        return;
      }
      if (event is ChangedSimpleTextText) {
        newValue = currentState.value!.copyWith(text: event.value);
        yield SubmittableSimpleTextForm(value: newValue);

        return;
      }
      if (event is ChangedSimpleTextConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittableSimpleTextForm(value: newValue);

        return;
      }
      if (event is ChangedSimpleTextTextAlign) {
        newValue = currentState.value!.copyWith(textAlign: event.value);
        yield SubmittableSimpleTextForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDSimpleTextFormError error(String message, SimpleTextModel newValue) => DocumentIDSimpleTextFormError(message: message, value: newValue);

  Future<SimpleTextFormState> _isDocumentIDValid(String? value, SimpleTextModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<SimpleTextModel?> findDocument = simpleTextRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableSimpleTextForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

