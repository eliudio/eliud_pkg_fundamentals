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


import 'package:bloc/bloc.dart';




import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/link_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/link_form_state.dart';

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

