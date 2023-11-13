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
import 'package:eliud_pkg_fundamentals/model/divider_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';

/*
 * AbstractDividerComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractDividerComponent extends StatelessWidget {
  static String componentName = "dividers";
  final AppModel app;
  final String dividerId;

  /*
   * Construct AbstractDividerComponent
   */
  AbstractDividerComponent(
      {super.key, required this.app, required this.dividerId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DividerComponentBloc>(
      create: (context) => DividerComponentBloc(
          dividerRepository: dividerRepository(appId: app.documentID)!)
        ..add(FetchDividerComponent(id: dividerId)),
      child: _dividerBlockBuilder(context),
    );
  }

  Widget _dividerBlockBuilder(BuildContext context) {
    return BlocBuilder<DividerComponentBloc, DividerComponentState>(
        builder: (context, state) {
      if (state is DividerComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is DividerComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is DividerComponentError) {
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

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, DividerModel value);
}
