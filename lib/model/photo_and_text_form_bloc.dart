/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/photo_and_text_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_repository.dart';

class PhotoAndTextFormBloc extends Bloc<PhotoAndTextFormEvent, PhotoAndTextFormState> {
  final FormAction formAction;
  final String appId;

  PhotoAndTextFormBloc(this.appId, { this.formAction }): super(PhotoAndTextFormUninitialized());
  @override
  Stream<PhotoAndTextFormState> mapEventToState(PhotoAndTextFormEvent event) async* {
    final currentState = state;
    if (currentState is PhotoAndTextFormUninitialized) {
      if (event is InitialiseNewPhotoAndTextFormEvent) {
        PhotoAndTextFormLoaded loaded = PhotoAndTextFormLoaded(value: PhotoAndTextModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 title: "",
                                 contents: "",
                                 percentageImageVisible: 0.0,

        ));
        yield loaded;
        return;

      }


      if (event is InitialisePhotoAndTextFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PhotoAndTextFormLoaded loaded = PhotoAndTextFormLoaded(value: await photoAndTextRepository(appId: appId).get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePhotoAndTextFormNoLoadEvent) {
        PhotoAndTextFormLoaded loaded = PhotoAndTextFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PhotoAndTextFormInitialized) {
      PhotoAndTextModel newValue = null;
      if (event is ChangedPhotoAndTextDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePhotoAndTextForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPhotoAndTextName) {
        newValue = currentState.value.copyWith(name: event.value);
        yield SubmittablePhotoAndTextForm(value: newValue);

        return;
      }
      if (event is ChangedPhotoAndTextTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittablePhotoAndTextForm(value: newValue);

        return;
      }
      if (event is ChangedPhotoAndTextContents) {
        newValue = currentState.value.copyWith(contents: event.value);
        yield SubmittablePhotoAndTextForm(value: newValue);

        return;
      }
      if (event is ChangedPhotoAndTextImage) {
        if (event.value != null)
          newValue = currentState.value.copyWith(image: await memberMediumRepository(appId: appId).get(event.value));
        else
          newValue = new PhotoAndTextModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 name: currentState.value.name,
                                 title: currentState.value.title,
                                 contents: currentState.value.contents,
                                 image: null,
                                 imagePosition: currentState.value.imagePosition,
                                 percentageImageVisible: currentState.value.percentageImageVisible,
                                 conditions: currentState.value.conditions,
          );
        yield SubmittablePhotoAndTextForm(value: newValue);

        return;
      }
      if (event is ChangedPhotoAndTextImagePosition) {
        newValue = currentState.value.copyWith(imagePosition: event.value);
        yield SubmittablePhotoAndTextForm(value: newValue);

        return;
      }
      if (event is ChangedPhotoAndTextPercentageImageVisible) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(percentageImageVisible: double.parse(event.value));
          yield SubmittablePhotoAndTextForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(percentageImageVisible: 0.0);
          yield PercentageImageVisiblePhotoAndTextFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedPhotoAndTextConditions) {
        newValue = currentState.value.copyWith(conditions: event.value);
        yield SubmittablePhotoAndTextForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDPhotoAndTextFormError error(String message, PhotoAndTextModel newValue) => DocumentIDPhotoAndTextFormError(message: message, value: newValue);

  Future<PhotoAndTextFormState> _isDocumentIDValid(String value, PhotoAndTextModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PhotoAndTextModel> findDocument = photoAndTextRepository(appId: appId).get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePhotoAndTextForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

