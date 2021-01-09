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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_pkg_fundamentals/model/simple_image_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_repository.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component_state.dart';

abstract class AbstractSimpleImageComponent extends StatelessWidget {
  static String componentName = "simpleImages";
  final String simpleImageID;

  AbstractSimpleImageComponent({this.simpleImageID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SimpleImageComponentBloc> (
          create: (context) => SimpleImageComponentBloc(
            simpleImageRepository: getSimpleImageRepository(context))
        ..add(FetchSimpleImageComponent(id: simpleImageID)),
      child: _simpleImageBlockBuilder(context),
    );
  }

  Widget _simpleImageBlockBuilder(BuildContext context) {
    return BlocBuilder<SimpleImageComponentBloc, SimpleImageComponentState>(builder: (context, state) {
      if (state is SimpleImageComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No SimpleImage defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is SimpleImageComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is SimpleImageComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, SimpleImageModel value);
  Widget alertWidget({ title: String, content: String});
  SimpleImageRepository getSimpleImageRepository(BuildContext context);
}

