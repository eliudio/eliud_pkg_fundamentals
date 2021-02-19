/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_pkg_fundamentals/model/photo_and_text_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_model.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_repository.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_component_state.dart';

abstract class AbstractPhotoAndTextComponent extends StatelessWidget {
  static String componentName = "photoAndTexts";
  final String photoAndTextID;

  AbstractPhotoAndTextComponent({this.photoAndTextID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoAndTextComponentBloc> (
          create: (context) => PhotoAndTextComponentBloc(
            photoAndTextRepository: getPhotoAndTextRepository(context))
        ..add(FetchPhotoAndTextComponent(id: photoAndTextID)),
      child: _photoAndTextBlockBuilder(context),
    );
  }

  Widget _photoAndTextBlockBuilder(BuildContext context) {
    return BlocBuilder<PhotoAndTextComponentBloc, PhotoAndTextComponentState>(builder: (context, state) {
      if (state is PhotoAndTextComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No PhotoAndText defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PhotoAndTextComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is PhotoAndTextComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PhotoAndTextModel value);
  Widget alertWidget({ title: String, content: String});
  PhotoAndTextRepository getPhotoAndTextRepository(BuildContext context);
}

