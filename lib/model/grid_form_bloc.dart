/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/grid_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/grid_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';

class GridFormBloc extends Bloc<GridFormEvent, GridFormState> {
  final FormAction? formAction;
  final String? appId;

  GridFormBloc(this.appId, { this.formAction }): super(GridFormUninitialized());
  @override
  Stream<GridFormState> mapEventToState(GridFormEvent event) async* {
    final currentState = state;
    if (currentState is GridFormUninitialized) {
      if (event is InitialiseNewGridFormEvent) {
        GridFormLoaded loaded = GridFormLoaded(value: GridModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",
                                 bodyComponents: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseGridFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        GridFormLoaded loaded = GridFormLoaded(value: await gridRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseGridFormNoLoadEvent) {
        GridFormLoaded loaded = GridFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is GridFormInitialized) {
      GridModel? newValue = null;
      if (event is ChangedGridDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableGridForm(value: newValue);
        }

        return;
      }
      if (event is ChangedGridTitle) {
        newValue = currentState.value!.copyWith(title: event.value);
        yield SubmittableGridForm(value: newValue);

        return;
      }
      if (event is ChangedGridBodyComponents) {
        newValue = currentState.value!.copyWith(bodyComponents: event.value);
        yield SubmittableGridForm(value: newValue);

        return;
      }
      if (event is ChangedGridGridView) {
        if (event.value != null)
          newValue = currentState.value!.copyWith(gridView: await gridViewRepository(appId: appId)!.get(event.value));
        else
          newValue = new GridModel(
                                 documentID: currentState.value!.documentID,
                                 appId: currentState.value!.appId,
                                 title: currentState.value!.title,
                                 bodyComponents: currentState.value!.bodyComponents,
                                 gridView: null,
                                 conditions: currentState.value!.conditions,
          );
        yield SubmittableGridForm(value: newValue);

        return;
      }
      if (event is ChangedGridConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittableGridForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDGridFormError error(String message, GridModel newValue) => DocumentIDGridFormError(message: message, value: newValue);

  Future<GridFormState> _isDocumentIDValid(String? value, GridModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<GridModel?> findDocument = gridRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableGridForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

