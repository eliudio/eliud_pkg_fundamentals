/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_form_bloc.dart
                       
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

import 'play_store_form_event.dart';
import 'play_store_form_state.dart';

class PlayStoreFormBloc extends Bloc<PlayStoreFormEvent, PlayStoreFormState> {
  final PlayStoreRepository _playStoreRepository = playStoreRepository();
  final FormAction formAction;
  final BackgroundRepository _backgroundRepository = backgroundRepository();

  PlayStoreFormBloc({ this.formAction }): super(PlayStoreFormUninitialized());
  @override
  Stream<PlayStoreFormState> mapEventToState(PlayStoreFormEvent event) async* {
    final currentState = state;
    if (currentState is PlayStoreFormUninitialized) {
      if (event is InitialiseNewPlayStoreFormEvent) {
        PlayStoreFormLoaded loaded = PlayStoreFormLoaded(value: PlayStoreModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialisePlayStoreFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        PlayStoreFormLoaded loaded = PlayStoreFormLoaded(value: await _playStoreRepository.get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialisePlayStoreFormNoLoadEvent) {
        PlayStoreFormLoaded loaded = PlayStoreFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is PlayStoreFormInitialized) {
      PlayStoreModel newValue = null;
      if (event is ChangedPlayStoreDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittablePlayStoreForm(value: newValue);
        }

        return;
      }
      if (event is ChangedPlayStoreDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittablePlayStoreForm(value: newValue);

        return;
      }
      if (event is ChangedPlayStoreItemBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(itemBackground: await _backgroundRepository.get(event.value));
        else
          newValue = new PlayStoreModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 description: currentState.value.description,
                                 itemBackground: null,
          );
        yield SubmittablePlayStoreForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDPlayStoreFormError error(String message, PlayStoreModel newValue) => DocumentIDPlayStoreFormError(message: message, value: newValue);

  Future<PlayStoreFormState> _isDocumentIDValid(String value, PlayStoreModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<PlayStoreModel> findDocument = _playStoreRepository.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePlayStoreForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

