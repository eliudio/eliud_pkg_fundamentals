/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_fundamentals/model/simple_text_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractSimpleTextComponent extends StatelessWidget {
  static String componentName = "simpleTexts";
  final AppModel app;
  final String simpleTextId;

  AbstractSimpleTextComponent({Key? key, required this.app, required this.simpleTextId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SimpleTextComponentBloc> (
          create: (context) => SimpleTextComponentBloc(
            simpleTextRepository: simpleTextRepository(appId: app.documentID)!)
        ..add(FetchSimpleTextComponent(id: simpleTextId)),
      child: _simpleTextBlockBuilder(context),
    );
  }

  Widget _simpleTextBlockBuilder(BuildContext context) {
    return BlocBuilder<SimpleTextComponentBloc, SimpleTextComponentState>(builder: (context, state) {
      if (state is SimpleTextComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is SimpleTextComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is SimpleTextComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, SimpleTextModel value);
}

