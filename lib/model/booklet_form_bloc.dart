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

import 'package:eliud_core/tools/enums.dart';



import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/booklet_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_form_state.dart';

class BookletFormBloc extends Bloc<BookletFormEvent, BookletFormState> {
  final FormAction? formAction;
  final String? appId;

  BookletFormBloc(this.appId, { this.formAction }): super(BookletFormUninitialized()) {
      on <InitialiseNewBookletFormEvent> ((event, emit) {
        BookletFormLoaded loaded = BookletFormLoaded(value: BookletModel(
                                               documentID: "",
                                 appId: "",
                                 description: "",
                                 sections: [],

        ));
        emit(loaded);
      });


      on <InitialiseBookletFormEvent> ((event, emit) async {
        // Need to re-retrieve the document from the repository so that I get all associated types
        BookletFormLoaded loaded = BookletFormLoaded(value: await bookletRepository(appId: appId)!.get(event.value!.documentID));
        emit(loaded);
      });
      on <InitialiseBookletFormNoLoadEvent> ((event, emit) async {
        BookletFormLoaded loaded = BookletFormLoaded(value: event.value);
        emit(loaded);
      });
      BookletModel? newValue = null;
      on <ChangedBookletDocumentID> ((event, emit) async {
      if (state is BookletFormInitialized) {
        final currentState = state as BookletFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.AddAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableBookletForm(value: newValue));
        }

      }
      });
      on <ChangedBookletDescription> ((event, emit) async {
      if (state is BookletFormInitialized) {
        final currentState = state as BookletFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableBookletForm(value: newValue));

      }
      });
      on <ChangedBookletSections> ((event, emit) async {
      if (state is BookletFormInitialized) {
        final currentState = state as BookletFormInitialized;
        newValue = currentState.value!.copyWith(sections: event.value);
        emit(SubmittableBookletForm(value: newValue));

      }
      });
      on <ChangedBookletConditions> ((event, emit) async {
      if (state is BookletFormInitialized) {
        final currentState = state as BookletFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableBookletForm(value: newValue));

      }
      });
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

