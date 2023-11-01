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

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/divider_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/divider_form_state.dart';

class DividerFormBloc extends Bloc<DividerFormEvent, DividerFormState> {
  final FormAction? formAction;
  final String? appId;

  DividerFormBloc(this.appId, { this.formAction }): super(DividerFormUninitialized()) {
      on <InitialiseNewDividerFormEvent> ((event, emit) {
        DividerFormLoaded loaded = DividerFormLoaded(value: DividerModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 color: RgbModel(r: 255, g: 0, b: 0, opacity: 1.00), 
                                 height: 0.0,
                                 thickness: 0.0,
                                 indent: 0.0,
                                 endIndent: 0.0,

        ));
        emit(loaded);
      });


      on <InitialiseDividerFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        DividerFormLoaded loaded = DividerFormLoaded(value: await dividerRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseDividerFormNoLoadEvent> ((event, emit) async {
        DividerFormLoaded loaded = DividerFormLoaded(value: event.value);
        emit(loaded);
      });
      DividerModel? newValue = null;
      on <ChangedDividerDocumentID> ((event, emit) async {
      if (state is DividerFormInitialized) {
        final currentState = state as DividerFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableDividerForm(value: newValue));
        }

      }
      });
      on <ChangedDividerDescription> ((event, emit) async {
      if (state is DividerFormInitialized) {
        final currentState = state as DividerFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableDividerForm(value: newValue));

      }
      });
      on <ChangedDividerColor> ((event, emit) async {
      if (state is DividerFormInitialized) {
        final currentState = state as DividerFormInitialized;
        newValue = currentState.value!.copyWith(color: event.value);
        emit(SubmittableDividerForm(value: newValue));

      }
      });
      on <ChangedDividerHeight> ((event, emit) async {
      if (state is DividerFormInitialized) {
        final currentState = state as DividerFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(height: double.parse(event.value!));
          emit(SubmittableDividerForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(height: 0.0);
          emit(HeightDividerFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedDividerThickness> ((event, emit) async {
      if (state is DividerFormInitialized) {
        final currentState = state as DividerFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(thickness: double.parse(event.value!));
          emit(SubmittableDividerForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(thickness: 0.0);
          emit(ThicknessDividerFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedDividerIndent> ((event, emit) async {
      if (state is DividerFormInitialized) {
        final currentState = state as DividerFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(indent: double.parse(event.value!));
          emit(SubmittableDividerForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(indent: 0.0);
          emit(IndentDividerFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedDividerEndIndent> ((event, emit) async {
      if (state is DividerFormInitialized) {
        final currentState = state as DividerFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(endIndent: double.parse(event.value!));
          emit(SubmittableDividerForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(endIndent: 0.0);
          emit(EndIndentDividerFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      }
      });
      on <ChangedDividerConditions> ((event, emit) async {
      if (state is DividerFormInitialized) {
        final currentState = state as DividerFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableDividerForm(value: newValue));

      }
      });
  }


  DocumentIDDividerFormError error(String message, DividerModel newValue) => DocumentIDDividerFormError(message: message, value: newValue);

  Future<DividerFormState> _isDocumentIDValid(String? value, DividerModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<DividerModel?> findDocument = dividerRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDividerForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

