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
import 'package:eliud_pkg_fundamentals/model/decorated_content_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractDecoratedContentComponent extends StatelessWidget {
  static String componentName = "decoratedContents";
  final AppModel app;
  final String decoratedContentId;

  AbstractDecoratedContentComponent(
      {super.key, required this.app, required this.decoratedContentId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DecoratedContentComponentBloc>(
      create: (context) => DecoratedContentComponentBloc(
          decoratedContentRepository:
              decoratedContentRepository(appId: app.documentID)!)
        ..add(FetchDecoratedContentComponent(id: decoratedContentId)),
      child: _decoratedContentBlockBuilder(context),
    );
  }

  Widget _decoratedContentBlockBuilder(BuildContext context) {
    return BlocBuilder<DecoratedContentComponentBloc,
        DecoratedContentComponentState>(builder: (context, state) {
      if (state is DecoratedContentComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is DecoratedContentComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is DecoratedContentComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, DecoratedContentModel value);
}
