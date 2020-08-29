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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'divider_component_bloc.dart';
import 'divider_component_event.dart';
import 'divider_model.dart';
import 'divider_repository.dart';
import 'divider_component_state.dart';

abstract class AbstractDividerComponent extends StatelessWidget {
  static String componentName = "dividers";
  final String dividerID;

  AbstractDividerComponent({this.dividerID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DividerBloc> (
          create: (context) => DividerBloc(
            dividerRepository: getDividerRepository())
        ..add(FetchDivider(id: dividerID)),
      child: _dividerBlockBuilder(context),
    );
  }

  Widget _dividerBlockBuilder(BuildContext context) {
    return BlocBuilder<DividerBloc, DividerState>(builder: (context, state) {
      if (state is DividerLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No divider defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is DividerError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, DividerModel value);
  Widget alertWidget({ title: String, content: String});
  DividerRepository getDividerRepository();
}


