/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/types.dart';

import 'package:eliud_core/model/rgb_model.dart';

import 'package:eliud_core/tools/string_validator.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'simple_image_form_event.dart';
import 'simple_image_form_state.dart';

class SimpleImageFormBloc extends Bloc<SimpleImageFormEvent, SimpleImageFormState> {
  final SimpleImageRepository _simpleImageRepository = simpleImageRepository();
  final FormAction formAction;
  final ImageRepository _imageRepository = imageRepository();

  SimpleImageFormBloc({ this.formAction }): super(SimpleImageFormUninitialized());
  @override
  Stream<SimpleImageFormState> mapEventToState(SimpleImageFormEvent event) async* {
    final currentState = state;
    if (currentState is SimpleImageFormUninitialized) {
      if (event is InitialiseNewSimpleImageFormEvent) {
        SimpleImageFormLoaded loaded = SimpleImageFormLoaded(value: SimpleImageModel(
                                               documentID: "",
                                 appId: "",
                                 title: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseSimpleImageFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        SimpleImageFormLoaded loaded = SimpleImageFormLoaded(value: await _simpleImageRepository.get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseSimpleImageFormNoLoadEvent) {
        SimpleImageFormLoaded loaded = SimpleImageFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is SimpleImageFormInitialized) {
      SimpleImageModel newValue = null;
      if (event is ChangedSimpleImageDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableSimpleImageForm(value: newValue);
        }

        return;
      }
      if (event is ChangedSimpleImageTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittableSimpleImageForm(value: newValue);

        return;
      }
      if (event is ChangedSimpleImageImage) {
        if (event.value != null)
          newValue = currentState.value.copyWith(image: await _imageRepository.get(event.value));
        else
          newValue = new SimpleImageModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 title: currentState.value.title,
                                 image: null,
          );
        yield SubmittableSimpleImageForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDSimpleImageFormError error(String message, SimpleImageModel newValue) => DocumentIDSimpleImageFormError(message: message, value: newValue);

  Future<SimpleImageFormState> _isDocumentIDValid(String value, SimpleImageModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<SimpleImageModel> findDocument = _simpleImageRepository.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableSimpleImageForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

