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

import 'package:eliud_pkg_fundamentals/model/document_item_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_repository.dart';

class DocumentItemFormBloc extends Bloc<DocumentItemFormEvent, DocumentItemFormState> {
  final String appId;

  DocumentItemFormBloc(this.appId, ): super(DocumentItemFormUninitialized());
  @override
  Stream<DocumentItemFormState> mapEventToState(DocumentItemFormEvent event) async* {
    final currentState = state;
    if (currentState is DocumentItemFormUninitialized) {
      if (event is InitialiseNewDocumentItemFormEvent) {
        DocumentItemFormLoaded loaded = DocumentItemFormLoaded(value: DocumentItemModel(
                                               documentID: "IDENTIFIER", 
                                 reference: "REFERENCE", 

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseDocumentItemFormEvent) {
        DocumentItemFormLoaded loaded = DocumentItemFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseDocumentItemFormNoLoadEvent) {
        DocumentItemFormLoaded loaded = DocumentItemFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is DocumentItemFormInitialized) {
      DocumentItemModel newValue = null;
      if (event is ChangedDocumentItemReference) {
        newValue = currentState.value.copyWith(reference: event.value);
        yield SubmittableDocumentItemForm(value: newValue);

        return;
      }
      if (event is ChangedDocumentItemImage) {
        if (event.value != null)
          newValue = currentState.value.copyWith(image: await imageRepository(appId: appId).get(event.value));
        else
          newValue = new DocumentItemModel(
                                 documentID: currentState.value.documentID,
                                 reference: currentState.value.reference,
                                 image: null,
          );
        yield SubmittableDocumentItemForm(value: newValue);

        return;
      }
    }
  }


}

