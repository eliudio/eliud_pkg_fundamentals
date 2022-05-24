/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/decorated_content_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_repository.dart';

class DecoratedContentFormBloc extends Bloc<DecoratedContentFormEvent, DecoratedContentFormState> {
  final FormAction? formAction;
  final String? appId;

  DecoratedContentFormBloc(this.appId, { this.formAction }): super(DecoratedContentFormUninitialized());
  @override
  Stream<DecoratedContentFormState> mapEventToState(DecoratedContentFormEvent event) async* {
    final currentState = state;
    if (currentState is DecoratedContentFormUninitialized) {
      on <InitialiseNewDecoratedContentFormEvent> ((event, emit) {
        DecoratedContentFormLoaded loaded = DecoratedContentFormLoaded(value: DecoratedContentModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 decoratingComponentName: "",
                                 decoratingComponentId: "",
                                 contentComponentName: "",
                                 contentComponentId: "",
                                 percentageDecorationVisible: 0.0,

        ));
        emit(loaded);
      });


      if (event is InitialiseDecoratedContentFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        DecoratedContentFormLoaded loaded = DecoratedContentFormLoaded(value: await decoratedContentRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      } else if (event is InitialiseDecoratedContentFormNoLoadEvent) {
        DecoratedContentFormLoaded loaded = DecoratedContentFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is DecoratedContentFormInitialized) {
      DecoratedContentModel? newValue = null;
      on <ChangedDecoratedContentDocumentID> ((event, emit) async {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableDecoratedContentForm(value: newValue));
        }

      });
      on <ChangedDecoratedContentDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableDecoratedContentForm(value: newValue));

      });
      on <ChangedDecoratedContentDecoratingComponentName> ((event, emit) async {
        newValue = currentState.value!.copyWith(decoratingComponentName: event.value);
        emit(SubmittableDecoratedContentForm(value: newValue));

      });
      on <ChangedDecoratedContentDecoratingComponentId> ((event, emit) async {
        newValue = currentState.value!.copyWith(decoratingComponentId: event.value);
        emit(SubmittableDecoratedContentForm(value: newValue));

      });
      on <ChangedDecoratedContentContentComponentName> ((event, emit) async {
        newValue = currentState.value!.copyWith(contentComponentName: event.value);
        emit(SubmittableDecoratedContentForm(value: newValue));

      });
      on <ChangedDecoratedContentContentComponentId> ((event, emit) async {
        newValue = currentState.value!.copyWith(contentComponentId: event.value);
        emit(SubmittableDecoratedContentForm(value: newValue));

      });
      on <ChangedDecoratedContentDecorationComponentPosition> ((event, emit) async {
        newValue = currentState.value!.copyWith(decorationComponentPosition: event.value);
        emit(SubmittableDecoratedContentForm(value: newValue));

      });
      on <ChangedDecoratedContentPercentageDecorationVisible> ((event, emit) async {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(percentageDecorationVisible: double.parse(event.value!));
          emit(SubmittableDecoratedContentForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(percentageDecorationVisible: 0.0);
          emit(PercentageDecorationVisibleDecoratedContentFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      });
      on <ChangedDecoratedContentConditions> ((event, emit) async {
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableDecoratedContentForm(value: newValue));

      });
    }
  }


  DocumentIDDecoratedContentFormError error(String message, DecoratedContentModel newValue) => DocumentIDDecoratedContentFormError(message: message, value: newValue);

  Future<DecoratedContentFormState> _isDocumentIDValid(String? value, DecoratedContentModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<DecoratedContentModel?> findDocument = decoratedContentRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDecoratedContentForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

