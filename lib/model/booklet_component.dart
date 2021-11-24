/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_pkg_fundamentals/model/booklet_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

abstract class AbstractBookletComponent extends StatelessWidget {
  static String componentName = "booklets";
  final String theAppId;
  final String bookletId;

  AbstractBookletComponent({Key? key, required this.theAppId, required this.bookletId}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookletComponentBloc> (
          create: (context) => BookletComponentBloc(
            bookletRepository: bookletRepository(appId: theAppId)!)
        ..add(FetchBookletComponent(id: bookletId)),
      child: _bookletBlockBuilder(context),
    );
  }

  Widget _bookletBlockBuilder(BuildContext context) {
    return BlocBuilder<BookletComponentBloc, BookletComponentState>(builder: (context, state) {
      if (state is BookletComponentLoaded) {
        if (state.value == null) {
          return AlertWidget(title: "Error", content: 'No Booklet defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is BookletComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is BookletComponentError) {
        return AlertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().progressIndicatorStyle().progressIndicator(context),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, BookletModel value);
}

