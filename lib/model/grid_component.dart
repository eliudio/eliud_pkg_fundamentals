/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 grid_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_fundamentals/model/grid_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/grid_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/grid_model.dart';
import 'package:eliud_pkg_fundamentals/model/grid_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

abstract class AbstractGridComponent extends StatelessWidget {
  static String componentName = "grids";
  final AppModel app;
  final String gridId;

  AbstractGridComponent({super.key, required this.app, required this.gridId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GridComponentBloc>(
      create: (context) => GridComponentBloc(
          gridRepository: gridRepository(appId: app.documentID)!)
        ..add(FetchGridComponent(id: gridId)),
      child: _gridBlockBuilder(context),
    );
  }

  Widget _gridBlockBuilder(BuildContext context) {
    return BlocBuilder<GridComponentBloc, GridComponentState>(
        builder: (context, state) {
      if (state is GridComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is GridComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is GridComponentError) {
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

  Widget yourWidget(BuildContext context, GridModel value);
}
