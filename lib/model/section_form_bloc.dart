/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_form_bloc.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/section_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/section_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/section_repository.dart';

class SectionFormBloc extends Bloc<SectionFormEvent, SectionFormState> {
  final String? appId;

  SectionFormBloc(this.appId, ): super(SectionFormUninitialized());
  @override
  Stream<SectionFormState> mapEventToState(SectionFormEvent event) async* {
    final currentState = state;
    if (currentState is SectionFormUninitialized) {
      on <InitialiseNewSectionFormEvent> ((event, emit) {
        SectionFormLoaded loaded = SectionFormLoaded(value: SectionModel(
                                               documentID: "IDENTIFIED", 
                                 title: "",
                                 description: "",
                                 imageWidth: 0.0,
                                 links: [],

        ));
        emit(loaded);
      });


      if (event is InitialiseSectionFormEvent) {
        SectionFormLoaded loaded = SectionFormLoaded(value: event.value);
        emit(loaded);
      } else if (event is InitialiseSectionFormNoLoadEvent) {
        SectionFormLoaded loaded = SectionFormLoaded(value: event.value);
        emit(loaded);
      }
    } else if (currentState is SectionFormInitialized) {
      SectionModel? newValue = null;
      on <ChangedSectionTitle> ((event, emit) async {
        newValue = currentState.value!.copyWith(title: event.value);
        emit(SubmittableSectionForm(value: newValue));

      });
      on <ChangedSectionDescription> ((event, emit) async {
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableSectionForm(value: newValue));

      });
      on <ChangedSectionImage> ((event, emit) async {
        if (event.value != null)
          newValue = currentState.value!.copyWith(image: await platformMediumRepository(appId: appId)!.get(event.value));
        emit(SubmittableSectionForm(value: newValue));

      });
      on <ChangedSectionImagePositionRelative> ((event, emit) async {
        newValue = currentState.value!.copyWith(imagePositionRelative: event.value);
        emit(SubmittableSectionForm(value: newValue));

      });
      on <ChangedSectionImageAlignment> ((event, emit) async {
        newValue = currentState.value!.copyWith(imageAlignment: event.value);
        emit(SubmittableSectionForm(value: newValue));

      });
      on <ChangedSectionImageWidth> ((event, emit) async {
        if (isDouble(event.value!)) {
          newValue = currentState.value!.copyWith(imageWidth: double.parse(event.value!));
          emit(SubmittableSectionForm(value: newValue));

        } else {
          newValue = currentState.value!.copyWith(imageWidth: 0.0);
          emit(ImageWidthSectionFormError(message: "Value should be a number or decimal number", value: newValue));
        }
      });
      on <ChangedSectionLinks> ((event, emit) async {
        newValue = currentState.value!.copyWith(links: event.value);
        emit(SubmittableSectionForm(value: newValue));

      });
    }
  }


}

