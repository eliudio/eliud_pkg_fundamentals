/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/dynamic_widget_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_repository.dart';

class DynamicWidgetFormBloc extends Bloc<DynamicWidgetFormEvent, DynamicWidgetFormState> {
  final FormAction? formAction;
  final String? appId;

  DynamicWidgetFormBloc(this.appId, { this.formAction }): super(DynamicWidgetFormUninitialized());
  @override
  Stream<DynamicWidgetFormState> mapEventToState(DynamicWidgetFormEvent event) async* {
    final currentState = state;
    if (currentState is DynamicWidgetFormUninitialized) {
      on <InitialiseNewDynamicWidgetFormEvent> ((event, emit) {
        DynamicWidgetFormLoaded loaded = DynamicWidgetFormLoaded(value: DynamicWidgetModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 content: "",

        ));
        emit(loaded);
      });


      if (event is InitialiseDynamicWidgetFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        DynamicWidgetFormLoaded loaded = DynamicWidgetFormLoaded(value: await dynamicWidgetRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseDynamicWidgetFormNoLoadEvent) {
        DynamicWidgetFormLoaded loaded = DynamicWidgetFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is DynamicWidgetFormInitialized) {
      DynamicWidgetModel? newValue = null;
      on <ChangedDynamicWidgetDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableDynamicWidgetForm(value: newValue));
        }

      });
      on <ChangedDynamicWidgetDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableDynamicWidgetForm(value: newValue));

      });
      on <ChangedDynamicWidgetContent> ((event, emit) async {
        newValue = currentState.value!.copyWith(content: event.value);
        emit(SubmittableDynamicWidgetForm(value: newValue));

      });
      on <ChangedDynamicWidgetBackground> ((event, emit) async {
        newValue = currentState.value!.copyWith(background: event.value);
        emit(SubmittableDynamicWidgetForm(value: newValue));

      });
      on <ChangedDynamicWidgetConditions> ((event, emit) async {
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableDynamicWidgetForm(value: newValue));

      });
    }
  }


  DocumentIDDynamicWidgetFormError error(String message, DynamicWidgetModel newValue) => DocumentIDDynamicWidgetFormError(message: message, value: newValue);

  Future<DynamicWidgetFormState> _isDocumentIDValid(String? value, DynamicWidgetModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<DynamicWidgetModel?> findDocument = dynamicWidgetRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDynamicWidgetForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}
