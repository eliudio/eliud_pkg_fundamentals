/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_form_bloc.dart
                       
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

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/link_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/link_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/link_repository.dart';

class LinkFormBloc extends Bloc<LinkFormEvent, LinkFormState> {
  final String? appId;

  LinkFormBloc(this.appId, ): super(LinkFormUninitialized()) {
      on <InitialiseNewLinkFormEvent> ((event, emit) {
        LinkFormLoaded loaded = LinkFormLoaded(value: LinkModel(
                                               documentID: "IDENTIFIED", 
                                 linkText: "",

        ));
        emit(loaded);
      });


      on <InitialiseLinkFormEvent> ((event, emit) async {
        LinkFormLoaded loaded = LinkFormLoaded(value: event.value);
        emit(loaded);
      });
      on <InitialiseLinkFormNoLoadEvent> ((event, emit) async {
        LinkFormLoaded loaded = LinkFormLoaded(value: event.value);
        emit(loaded);
      });
      LinkModel? newValue = null;
      on <ChangedLinkLinkText> ((event, emit) async {
      if (state is LinkFormInitialized) {
        final currentState = state as LinkFormInitialized;
        newValue = currentState.value!.copyWith(linkText: event.value);
        emit(SubmittableLinkForm(value: newValue));

      }
      });
      on <ChangedLinkAction> ((event, emit) async {
      if (state is LinkFormInitialized) {
        final currentState = state as LinkFormInitialized;
        newValue = currentState.value!.copyWith(action: event.value);
        emit(SubmittableLinkForm(value: newValue));

      }
      });
  }


}

