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

import 'package:eliud_core/tools/enums.dart';



import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/simple_text_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_form_state.dart';

class SimpleTextFormBloc extends Bloc<SimpleTextFormEvent, SimpleTextFormState> {
  final FormAction? formAction;
  final String? appId;

  SimpleTextFormBloc(this.appId, { this.formAction }): super(SimpleTextFormUninitialized()) {
      on <InitialiseNewSimpleTextFormEvent> ((event, emit) {
        SimpleTextFormLoaded loaded = SimpleTextFormLoaded(value: SimpleTextModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 title: "",
                                 text: "",

        ));
        emit(loaded);
      });


      on <InitialiseSimpleTextFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        SimpleTextFormLoaded loaded = SimpleTextFormLoaded(value: await simpleTextRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseSimpleTextFormNoLoadEvent> ((event, emit) async {
        SimpleTextFormLoaded loaded = SimpleTextFormLoaded(value: event.value);
        emit(loaded);
      });
      SimpleTextModel? newValue = null;
      on <ChangedSimpleTextDocumentID> ((event, emit) async {
      if (state is SimpleTextFormInitialized) {
        final currentState = state as SimpleTextFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableSimpleTextForm(value: newValue));
        }

      }
      });
      on <ChangedSimpleTextDescription> ((event, emit) async {
      if (state is SimpleTextFormInitialized) {
        final currentState = state as SimpleTextFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableSimpleTextForm(value: newValue));

      }
      });
      on <ChangedSimpleTextTitle> ((event, emit) async {
      if (state is SimpleTextFormInitialized) {
        final currentState = state as SimpleTextFormInitialized;
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableSimpleTextForm(value: newValue));

      }
      });
      on <ChangedSimpleTextText> ((event, emit) async {
      if (state is SimpleTextFormInitialized) {
        final currentState = state as SimpleTextFormInitialized;
        newValue = currentState.value!.copyWith(text: event.value);
        emit(SubmittableSimpleTextForm(value: newValue));

      }
      });
      on <ChangedSimpleTextConditions> ((event, emit) async {
      if (state is SimpleTextFormInitialized) {
        final currentState = state as SimpleTextFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableSimpleTextForm(value: newValue));

      }
      });
      on <ChangedSimpleTextTextAlign> ((event, emit) async {
      if (state is SimpleTextFormInitialized) {
        final currentState = state as SimpleTextFormInitialized;
        newValue = currentState.value!.copyWith(textAlign: event.value);
        emit(SubmittableSimpleTextForm(value: newValue));

      }
      });
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

