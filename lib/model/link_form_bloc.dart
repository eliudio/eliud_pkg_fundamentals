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

import 'link_form_event.dart';
import 'link_form_state.dart';

class LinkFormBloc extends Bloc<LinkFormEvent, LinkFormState> {

  LinkFormBloc(): super(LinkFormUninitialized());
  @override
  Stream<LinkFormState> mapEventToState(LinkFormEvent event) async* {
    final currentState = state;
    if (currentState is LinkFormUninitialized) {
      if (event is InitialiseNewLinkFormEvent) {
        LinkFormLoaded loaded = LinkFormLoaded(value: LinkModel(
                                               documentID: "IDENTIFIED", 
                                 linkText: "",

        ));
        yield loaded;
        return;

      }


      if (event is InitialiseLinkFormEvent) {
        LinkFormLoaded loaded = LinkFormLoaded(value: event.value);
        yield loaded;
        return;
      } else if (event is InitialiseLinkFormNoLoadEvent) {
        LinkFormLoaded loaded = LinkFormLoaded(value: event.value);
        yield loaded;
        return;
      }
    } else if (currentState is LinkFormInitialized) {
      LinkModel newValue = null;
      if (event is ChangedLinkLinkText) {
        newValue = currentState.value.copyWith(linkText: event.value);
        yield SubmittableLinkForm(value: newValue);

        return;
      }
      if (event is ChangedLinkAction) {
        newValue = currentState.value.copyWith(action: event.value);
        yield SubmittableLinkForm(value: newValue);

        return;
      }
    }
  }


}

