/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_fundamentals/model/fader_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractFaderComponent extends StatelessWidget {
  static String componentName = "faders";
  final String theAppId;
  final String faderId;

  AbstractFaderComponent({Key? key, required this.theAppId, required this.faderId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FaderComponentBloc> (
          create: (context) => FaderComponentBloc(
            faderRepository: faderRepository(appId: theAppId)!)
        ..add(FetchFaderComponent(id: faderId)),
      child: _faderBlockBuilder(context),
    );
  }

  Widget _faderBlockBuilder(BuildContext context) {
    return BlocBuilder<FaderComponentBloc, FaderComponentState>(builder: (context, state) {
      if (state is FaderComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Fader defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is FaderComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is FaderComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, FaderModel value);
}

