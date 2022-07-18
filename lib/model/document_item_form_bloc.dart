/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/document_item_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_repository.dart';

class DocumentItemFormBloc extends Bloc<DocumentItemFormEvent, DocumentItemFormState> {
  final String? appId;

  DocumentItemFormBloc(this.appId, ): super(DocumentItemFormUninitialized()) {
      on <InitialiseNewDocumentItemFormEvent> ((event, emit) {
        DocumentItemFormLoaded loaded = DocumentItemFormLoaded(value: DocumentItemModel(
                                               documentID: "IDENTIFIER", 
                                 reference: "REFERENCE", 

        ));
        emit(loaded);
      });


      on <InitialiseDocumentItemFormEvent> ((event, emit) async {
        DocumentItemFormLoaded loaded = DocumentItemFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseDocumentItemFormNoLoadEvent> ((event, emit) async {
        DocumentItemFormLoaded loaded = DocumentItemFormLoaded(value: event.value);
        emit(loaded);
      });
      DocumentItemModel? newValue = null;
      on <ChangedDocumentItemReference> ((event, emit) async {
      if (state is DocumentItemFormInitialized) {
        final currentState = state as DocumentItemFormInitialized;
        newValue = currentState.value!.copyWith(reference: event.value);
        emit(SubmittableDocumentItemForm(value: newValue));

      }
      });
      on <ChangedDocumentItemImage> ((event, emit) async {
      if (state is DocumentItemFormInitialized) {
        final currentState = state as DocumentItemFormInitialized;
        if (event.value != null)
          newValue = currentState.value!.copyWith(image: await platformMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableDocumentItemForm(value: newValue));

      }
      });
  }


}

