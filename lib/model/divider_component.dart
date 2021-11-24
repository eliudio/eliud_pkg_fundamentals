/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_fundamentals/model/divider_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/divider_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:eliud_pkg_fundamentals/model/divider_repository.dart';
import 'package:eliud_pkg_fundamentals/model/divider_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractDividerComponent extends StatelessWidget {
  static String componentName = "dividers";
  final String theAppId;
  final String dividerId;

  AbstractDividerComponent({Key? key, required this.theAppId, required this.dividerId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DividerComponentBloc> (
          create: (context) => DividerComponentBloc(
            dividerRepository: dividerRepository(appId: theAppId)!)
        ..add(FetchDividerComponent(id: dividerId)),
      child: _dividerBlockBuilder(context),
    );
  }

  Widget _dividerBlockBuilder(BuildContext context) {
    return BlocBuilder<DividerComponentBloc, DividerComponentState>(builder: (context, state) {
      if (state is DividerComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Divider defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is DividerComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is DividerComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, DividerModel value);
}

