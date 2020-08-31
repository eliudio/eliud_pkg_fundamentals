/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_pkg_fundamentals/model/presentation_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_repository.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_component_state.dart';

abstract class AbstractPresentationComponent extends StatelessWidget {
  static String componentName = "presentations";
  final String presentationID;

  AbstractPresentationComponent({this.presentationID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PresentationBloc> (
          create: (context) => PresentationBloc(
            presentationRepository: getPresentationRepository())
        ..add(FetchPresentation(id: presentationID)),
      child: _presentationBlockBuilder(context),
    );
  }

  Widget _presentationBlockBuilder(BuildContext context) {
    return BlocBuilder<PresentationBloc, PresentationState>(builder: (context, state) {
      if (state is PresentationLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No presentation defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PresentationError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PresentationModel value);
  Widget alertWidget({ title: String, content: String});
  PresentationRepository getPresentationRepository();
}


