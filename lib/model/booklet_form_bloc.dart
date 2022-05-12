/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/booklet_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';

class BookletFormBloc extends Bloc<BookletFormEvent, BookletFormState> {
  final FormAction? formAction;
  final String? appId;

  BookletFormBloc(this.appId, { this.formAction }): super(BookletFormUninitialized());
  @override
  Stream<BookletFormState> mapEventToState(BookletFormEvent event) async* {
    final currentState = state;
    if (currentState is BookletFormUninitialized) {
      if (event is InitialiseNewBookletFormEvent) {
        BookletFormLoaded loaded = BookletFormLoaded(value: BookletModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 sections: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseBookletFormEvent) {
        // Need to re-retrieve the document from the repository so that I get all associated types
        BookletFormLoaded loaded = BookletFormLoaded(value: await bookletRepository(appId: appId)!.get(event.value!.documentID));
        yield loaded;
        return;
      } else if (event is InitialiseBookletFormNoLoadEvent) {
        BookletFormLoaded loaded = BookletFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is BookletFormInitialized) {
      BookletModel? newValue = null;
      if (event is ChangedBookletDocumentID) {
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          yield* _isDocumentIDValid(event.value, newValue).asStream();
        } else {
          yield SubmittableBookletForm(value: newValue);
        }

        return;
      }
      if (event is ChangedBookletDescription) {
        newValue = currentState.value!.copyWith(description: event.value);
        yield SubmittableBookletForm(value: newValue);

        return;
      }
      if (event is ChangedBookletSections) {
        newValue = currentState.value!.copyWith(sections: event.value);
        yield SubmittableBookletForm(value: newValue);

        return;
      }
      if (event is ChangedBookletConditions) {
        newValue = currentState.value!.copyWith(conditions: event.value);
        yield SubmittableBookletForm(value: newValue);

        return;
      }
    }
  }


  DocumentIDBookletFormError error(String message, BookletModel newValue) => DocumentIDBookletFormError(message: message, value: newValue);

  Future<BookletFormState> _isDocumentIDValid(String? value, BookletModel newValue) async {
    if (value == null) return Future.value(error("Provide value for documentID", newValue));
    if (value.length == 0) return Future.value(error("Provide value for documentID", newValue));
    Future<BookletModel?> findDocument = bookletRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableBookletForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }


}

