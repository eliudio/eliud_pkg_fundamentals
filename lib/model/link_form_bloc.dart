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
import 'package:eliud_pkg_fundamentals/model/link_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/link_form_state.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

class LinkFormBloc extends Bloc<LinkFormEvent, LinkFormState> {
  final String? appId;

  LinkFormBloc(this.appId, ): super(LinkFormUninitialized());
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
      LinkModel? newValue = null;
      if (event is ChangedLinkLinkText) {
        newValue = currentState.value!.copyWith(linkText: event.value);
        yield SubmittableLinkForm(value: newValue);

        return;
      }
      if (event is ChangedLinkAction) {
        newValue = currentState.value!.copyWith(action: event.value);
        yield SubmittableLinkForm(value: newValue);

        return;
      }
    }
  }


}

