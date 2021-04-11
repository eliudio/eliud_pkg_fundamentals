/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_text_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:eliud_pkg_fundamentals/model/simple_text_component_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_repository.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_component_state.dart';

abstract class AbstractSimpleTextComponent extends StatelessWidget {
  static String componentName = "simpleTexts";
  final String? simpleTextID;

  AbstractSimpleTextComponent({this.simpleTextID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SimpleTextComponentBloc> (
          create: (context) => SimpleTextComponentBloc(
            simpleTextRepository: getSimpleTextRepository(context))
        ..add(FetchSimpleTextComponent(id: simpleTextID)),
      child: _simpleTextBlockBuilder(context),
    );
  }

  Widget _simpleTextBlockBuilder(BuildContext context) {
    return BlocBuilder<SimpleTextComponentBloc, SimpleTextComponentState>(builder: (context, state) {
      if (state is SimpleTextComponentLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No SimpleText defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is SimpleTextComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is SimpleTextComponentError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, SimpleTextModel? value);
  Widget alertWidget({ title: String, content: String});
  SimpleTextRepository getSimpleTextRepository(BuildContext context);
}

