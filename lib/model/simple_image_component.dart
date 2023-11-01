/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_fundamentals/model/simple_image_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractSimpleImageComponent extends StatelessWidget {
  static String componentName = "simpleImages";
  final AppModel app;
  final String simpleImageId;

  AbstractSimpleImageComponent({Key? key, required this.app, required this.simpleImageId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SimpleImageComponentBloc> (
          create: (context) => SimpleImageComponentBloc(
            simpleImageRepository: simpleImageRepository(appId: app.documentID)!)
        ..add(FetchSimpleImageComponent(id: simpleImageId)),
      child: _simpleImageBlockBuilder(context),
    );
  }

  Widget _simpleImageBlockBuilder(BuildContext context) {
    return BlocBuilder<SimpleImageComponentBloc, SimpleImageComponentState>(builder: (context, state) {
      if (state is SimpleImageComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is SimpleImageComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is SimpleImageComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().progressIndicatorStyle().progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, SimpleImageModel value);
}

