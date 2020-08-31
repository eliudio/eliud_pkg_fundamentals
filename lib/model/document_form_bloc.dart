/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/types.dart';

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

import 'package:eliud_pkg_fundamentals/model/document_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/document_repository.dart';

class DocumentFormBloc extends Bloc<DocumentFormEvent, DocumentFormState> {
  final DocumentRepository _documentRepository = documentRepository();
  final FormAction formAction;
  final BackgroundRepository _backgroundRepository = backgroundRepository();

  DocumentFormBloc({ this.formAction }): super(DocumentFormUninitialized());
  @override
  Stream<DocumentFormState> mapEventToState(DocumentFormEvent event) async* {
    final currentState = state;
    if (currentState is DocumentFormUninitialized) {
      if (event is InitialiseNewDocumentFormEvent) {
        DocumentFormLoaded loaded = DocumentFormLoaded(value: DocumentModel(
                                               documentID: "",
                                 appId: "",
                                 name: "",
                                 content: "",
                                 padding: 0.0,
                                 images: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseDocumentFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        DocumentFormLoaded loaded = DocumentFormLoaded(value: await _documentRepository.get(event.value.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseDocumentFormNoLoadEvent) {
        DocumentFormLoaded loaded = DocumentFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is DocumentFormInitialized) {
      DocumentModel newValue = null;
      if (event is ChangedDocumentDocumentID) {
        newValue = currentState.value.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableDocumentForm(value: newValue);
        }

        return;
      }
      if (event is ChangedDocumentName) {
        newValue = currentState.value.copyWith(name: event.value);
        yield SubmittableDocumentForm(value: newValue);

        return;
      }
      if (event is ChangedDocumentDocumentRenderer) {
        newValue = currentState.value.copyWith(documentRenderer: event.value);
        yield SubmittableDocumentForm(value: newValue);

        return;
      }
      if (event is ChangedDocumentContent) {
        newValue = currentState.value.copyWith(content: event.value);
        yield SubmittableDocumentForm(value: newValue);

        return;
      }
      if (event is ChangedDocumentPadding) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(padding: double.parse(event.value));
          yield SubmittableDocumentForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(padding: 0.0);
          yield PaddingDocumentFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedDocumentImages) {
        newValue = currentState.value.copyWith(images: event.value);
        yield SubmittableDocumentForm(value: newValue);

        return;
      }
      if (event is ChangedDocumentBackground) {
        if (event.value != null)
          newValue = currentState.value.copyWith(background: await _backgroundRepository.get(event.value));
        else
          newValue = new DocumentModel(
                                 documentID: currentState.value.documentID,
                                 appId: currentState.value.appId,
                                 name: currentState.value.name,
                                 documentRenderer: currentState.value.documentRenderer,
                                 content: currentState.value.content,
                                 padding: currentState.value.padding,
                                 images: currentState.value.images,
                                 background: null,
          );
        yield SubmittableDocumentForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDDocumentFormError error(String message, DocumentModel newValue) => DocumentIDDocumentFormError(message: message, value: newValue);

  Future<DocumentFormState> _isDocumentIDValid(String value, DocumentModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<DocumentModel> findDocument = _documentRepository.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDocumentForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

