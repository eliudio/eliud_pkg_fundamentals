/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_fundamentals/model/decorated_content_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_model.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_repository.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractDecoratedContentComponent extends StatelessWidget {
  static String componentName = "decoratedContents";
  final String theAppId;
  final String decoratedContentId;

  AbstractDecoratedContentComponent({Key? key, required this.theAppId, required this.decoratedContentId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DecoratedContentComponentBloc> (
          create: (context) => DecoratedContentComponentBloc(
            decoratedContentRepository: decoratedContentRepository(appId: theAppId)!)
        ..add(FetchDecoratedContentComponent(id: decoratedContentId)),
      child: _decoratedContentBlockBuilder(context),
    );
  }

  Widget _decoratedContentBlockBuilder(BuildContext context) {
    return BlocBuilder<DecoratedContentComponentBloc, DecoratedContentComponentState>(builder: (context, state) {
      if (state is DecoratedContentComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No DecoratedContent defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is DecoratedContentComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is DecoratedContentComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, DecoratedContentModel value);
}

