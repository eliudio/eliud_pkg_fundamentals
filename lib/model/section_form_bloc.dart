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

import 'package:eliud_pkg_fundamentals/model/section_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/section_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/section_repository.dart';

class SectionFormBloc extends Bloc<SectionFormEvent, SectionFormState> {
  final ImageRepository _imageRepository = imageRepository();

  SectionFormBloc(): super(SectionFormUninitialized());
  @override
  Stream<SectionFormState> mapEventToState(SectionFormEvent event) async* {
    final currentState = state;
    if (currentState is SectionFormUninitialized) {
      if (event is InitialiseNewSectionFormEvent) {
        SectionFormLoaded loaded = SectionFormLoaded(value: SectionModel(
                                               documentID: "IDENTIFIED", 
                                 title: "",
                                 description: "",
                                 imageWidth: 0.0,
                                 links: [],

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseSectionFormEvent) {
        SectionFormLoaded loaded = SectionFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseSectionFormNoLoadEvent) {
        SectionFormLoaded loaded = SectionFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is SectionFormInitialized) {
      SectionModel newValue = null;
      if (event is ChangedSectionTitle) {
        newValue = currentState.value.copyWith(title: event.value);
        yield SubmittableSectionForm(value: newValue);

        return;
      }
      if (event is ChangedSectionDescription) {
        newValue = currentState.value.copyWith(description: event.value);
        yield SubmittableSectionForm(value: newValue);

        return;
      }
      if (event is ChangedSectionImage) {
        if (event.value != null)
          newValue = currentState.value.copyWith(image: await _imageRepository.get(event.value));
        else
          newValue = new SectionModel(
                                 documentID: currentState.value.documentID,
                                 title: currentState.value.title,
                                 description: currentState.value.description,
                                 image: null,
                                 imagePositionRelative: currentState.value.imagePositionRelative,
                                 imageAlignment: currentState.value.imageAlignment,
                                 imageWidth: currentState.value.imageWidth,
                                 links: currentState.value.links,
          );
        yield SubmittableSectionForm(value: newValue);

        return;
      }
      if (event is ChangedSectionImagePositionRelative) {
        newValue = currentState.value.copyWith(imagePositionRelative: event.value);
        yield SubmittableSectionForm(value: newValue);

        return;
      }
      if (event is ChangedSectionImageAlignment) {
        newValue = currentState.value.copyWith(imageAlignment: event.value);
        yield SubmittableSectionForm(value: newValue);

        return;
      }
      if (event is ChangedSectionImageWidth) {
        if (isDouble(event.value)) {
          newValue = currentState.value.copyWith(imageWidth: double.parse(event.value));
          yield SubmittableSectionForm(value: newValue);

        } else {
          newValue = currentState.value.copyWith(imageWidth: 0.0);
          yield ImageWidthSectionFormError(message: "Value should be a number or decimal number", value: newValue);
        }
        return;
      }
      if (event is ChangedSectionLinks) {
        newValue = currentState.value.copyWith(links: event.value);
        yield SubmittableSectionForm(value: newValue);

        return;
      }
    }
  }


}

