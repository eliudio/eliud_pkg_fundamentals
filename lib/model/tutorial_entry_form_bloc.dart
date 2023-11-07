/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/tutorial_entry_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_form_state.dart';

class TutorialEntryFormBloc
    extends Bloc<TutorialEntryFormEvent, TutorialEntryFormState> {
  final String? appId;

  TutorialEntryFormBloc(
    this.appId,
  ) : super(TutorialEntryFormUninitialized()) {
    on<InitialiseNewTutorialEntryFormEvent>((event, emit) {
      TutorialEntryFormLoaded loaded = TutorialEntryFormLoaded(
          value: TutorialEntryModel(
        documentID: "IDENTIFIED",
        description: "",
        code: "",
      ));
      emit(loaded);
    });

    on<InitialiseTutorialEntryFormEvent>((event, emit) async {
      TutorialEntryFormLoaded loaded =
          TutorialEntryFormLoaded(value: event.value);
      emit(loaded);
    });
    on<InitialiseTutorialEntryFormNoLoadEvent>((event, emit) async {
      TutorialEntryFormLoaded loaded =
          TutorialEntryFormLoaded(value: event.value);
      emit(loaded);
    });
    TutorialEntryModel? newValue;
    on<ChangedTutorialEntryDescription>((event, emit) async {
      if (state is TutorialEntryFormInitialized) {
        final currentState = state as TutorialEntryFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableTutorialEntryForm(value: newValue));
      }
    });
    on<ChangedTutorialEntryImage>((event, emit) async {
      if (state is TutorialEntryFormInitialized) {
        final currentState = state as TutorialEntryFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              image: await platformMediumRepository(appId: appId)!
                  .get(event.value));
        }
        emit(SubmittableTutorialEntryForm(value: newValue));
      }
    });
    on<ChangedTutorialEntryCode>((event, emit) async {
      if (state is TutorialEntryFormInitialized) {
        final currentState = state as TutorialEntryFormInitialized;
        newValue = currentState.value!.copyWith(code: event.value);
        emit(SubmittableTutorialEntryForm(value: newValue));
      }
    });
  }
}
