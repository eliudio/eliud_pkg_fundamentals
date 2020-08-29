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

import 'simple_image_component_bloc.dart';
import 'simple_image_component_event.dart';
import 'simple_image_model.dart';
import 'simple_image_repository.dart';
import 'simple_image_component_state.dart';

abstract class AbstractSimpleImageComponent extends StatelessWidget {
  static String componentName = "simpleImages";
  final String simpleImageID;

  AbstractSimpleImageComponent({this.simpleImageID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SimpleImageBloc> (
          create: (context) => SimpleImageBloc(
            simpleImageRepository: getSimpleImageRepository())
        ..add(FetchSimpleImage(id: simpleImageID)),
      child: _simpleImageBlockBuilder(context),
    );
  }

  Widget _simpleImageBlockBuilder(BuildContext context) {
    return BlocBuilder<SimpleImageBloc, SimpleImageState>(builder: (context, state) {
      if (state is SimpleImageLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No simpleImage defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is SimpleImageError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, SimpleImageModel value);
  Widget alertWidget({ title: String, content: String});
  SimpleImageRepository getSimpleImageRepository();
}


