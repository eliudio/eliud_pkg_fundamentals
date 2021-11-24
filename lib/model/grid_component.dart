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
import 'package:eliud_pkg_fundamentals/model/grid_repository.dart';
import 'package:eliud_pkg_fundamentals/model/grid_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractGridComponent extends StatelessWidget {
  static String componentName = "grids";
  final String theAppId;
  final String gridId;

  AbstractGridComponent({Key? key, required this.theAppId, required this.gridId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GridComponentBloc> (
          create: (context) => GridComponentBloc(
            gridRepository: gridRepository(appId: theAppId)!)
        ..add(FetchGridComponent(id: gridId)),
      child: _gridBlockBuilder(context),
    );
  }

  Widget _gridBlockBuilder(BuildContext context) {
    return BlocBuilder<GridComponentBloc, GridComponentState>(builder: (context, state) {
      if (state is GridComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Grid defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is GridComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is GridComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, GridModel value);
}

