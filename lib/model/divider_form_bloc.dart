/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_form_bloc.dart
                       
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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/divider_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/divider_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/divider_repository.dart';

class DividerFormBloc extends Bloc<DividerFormEvent, DividerFormState> {
  final FormAction formAction;
  final String appId;

  DividerFormBloc(this.appId, { this.formAction }): super(DividerFormUninitialized());
  @override
  Stream<DividerFormState> mapEventToState(DividerFormEvent event) async* {
    final currentState = state;
    if (currentState is DividerFormUninitialized) {
      if (event is InitialiseNewDividerFormEvent) {
        DividerFormLoaded loaded = DividerFormLoaded(value: DividerModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 color: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 height: 0.0,
                                 thickness: 0.0,
                                 indent: 0.0,
                                 endIndent: 0.0,

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseDividerFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        DividerFormLoaded loaded = DividerFormLoaded(value: await dividerRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseDividerFormNoLoadEvent) {
        DividerFormLoaded loaded = DividerFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is DividerFormInitialized) {
      DividerModel newValue = null;
      if (event is ChangedDividerDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableDividerForm(value: newValue);
        }

        return;
      }
      if (event is ChangedDividerName) {
        newValue = currentState.value.copyWith(name: event.value);
        yield SubmittableDividerForm(value: newValue);

        return;
      }
      if (event is ChangedDividerColor) {
        newValue = currentState.value.copyWith(color: event.value);
        yield SubmittableDividerForm(value: newValue);

        return;
      }
      if (event is ChangedDividerHeight) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(height: double.parse(event.value));
          yield SubmittableDividerForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(height: 0.0);
          yield HeightDividerFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedDividerThickness) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(thickness: double.parse(event.value));
          yield SubmittableDividerForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(thickness: 0.0);
          yield ThicknessDividerFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedDividerIndent) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(indent: double.parse(event.value));
          yield SubmittableDividerForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(indent: 0.0);
          yield IndentDividerFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedDividerEndIndent) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(endIndent: double.parse(event.value));
          yield SubmittableDividerForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(endIndent: 0.0);
          yield EndIndentDividerFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
    }
  }


  DocumentIDDividerFormError error(String message, DividerModel newValue) => DocumentIDDividerFormError(message: message, value: newValue);

  Future<DividerFormState> _isDocumentIDValid(String value, DividerModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<DividerModel> findDocument = dividerRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDividerForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

