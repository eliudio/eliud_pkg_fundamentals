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
  final FormAction formAction;
  final String appId;

  DecoratedContentFormBloc(this.appId, { this.formAction }): super(DecoratedContentFormUninitialized());
  @override
  Stream<DecoratedContentFormState> mapEventToState(DecoratedContentFormEvent event) async* {
    final currentState = state;
    if (currentState is DecoratedContentFormUninitialized) {
      if (event is InitialiseNewDecoratedContentFormEvent) {
        DecoratedContentFormLoaded loaded = DecoratedContentFormLoaded(value: DecoratedContentModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 decoratingComponentName: "",
                                 decoratingComponentId: "",
                                 contentComponentName: "",
                                 contentComponentId: "",
                                 percentageDecorationVisible: 0.0,

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseDecoratedContentFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        DecoratedContentFormLoaded loaded = DecoratedContentFormLoaded(value: await decoratedContentRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseDecoratedContentFormNoLoadEvent) {
        DecoratedContentFormLoaded loaded = DecoratedContentFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is DecoratedContentFormInitialized) {
      DecoratedContentModel newValue = null;
      if (event is ChangedDecoratedContentDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableDecoratedContentForm(value: newValue);
        }

        return;
      }
      if (event is ChangedDecoratedContentName) {
        newValue = currentState.value.copyWith(name: event.value);
        yield SubmittableDecoratedContentForm(value: newValue);

        return;
      }
      if (event is ChangedDecoratedContentDecoratingComponentName) {
        newValue = currentState.value.copyWith(decoratingComponentName: event.value);
        yield SubmittableDecoratedContentForm(value: newValue);

        return;
      }
      if (event is ChangedDecoratedContentDecoratingComponentId) {
        newValue = currentState.value.copyWith(decoratingComponentId: event.value);
        yield SubmittableDecoratedContentForm(value: newValue);

        return;
      }
      if (event is ChangedDecoratedContentContentComponentName) {
        newValue = currentState.value.copyWith(contentComponentName: event.value);
        yield SubmittableDecoratedContentForm(value: newValue);

        return;
      }
      if (event is ChangedDecoratedContentContentComponentId) {
        newValue = currentState.value.copyWith(contentComponentId: event.value);
        yield SubmittableDecoratedContentForm(value: newValue);

        return;
      }
      if (event is ChangedDecoratedContentDecorationComponentPosition) {
        newValue = currentState.value.copyWith(decorationComponentPosition: event.value);
        yield SubmittableDecoratedContentForm(value: newValue);

        return;
      }
      if (event is ChangedDecoratedContentPercentageDecorationVisible) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(percentageDecorationVisible: double.parse(event.value));
          yield SubmittableDecoratedContentForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(percentageDecorationVisible: 0.0);
          yield PercentageDecorationVisibleDecoratedContentFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedDecoratedContentConditions) {
        newValue = currentState.value.copyWith(conditions: event.value);
        yield SubmittableDecoratedContentForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDDecoratedContentFormError error(String message, DecoratedContentModel newValue) => DocumentIDDecoratedContentFormError(message: message, value: newValue);

  Future<DecoratedContentFormState> _isDocumentIDValid(String value, DecoratedContentModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<DecoratedContentModel> findDocument = decoratedContentRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDecoratedContentForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

