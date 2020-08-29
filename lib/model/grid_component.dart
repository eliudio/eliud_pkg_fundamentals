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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'grid_component_bloc.dart';
import 'grid_component_event.dart';
import 'grid_model.dart';
import 'grid_repository.dart';
import 'grid_component_state.dart';

abstract class AbstractGridComponent extends StatelessWidget {
  static String componentName = "grids";
  final String gridID;

  AbstractGridComponent({this.gridID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GridBloc> (
          create: (context) => GridBloc(
            gridRepository: getGridRepository())
        ..add(FetchGrid(id: gridID)),
      child: _gridBlockBuilder(context),
    );
  }

  Widget _gridBlockBuilder(BuildContext context) {
    return BlocBuilder<GridBloc, GridState>(builder: (context, state) {
      if (state is GridLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No grid defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is GridError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, GridModel value);
  Widget alertWidget({ title: String, content: String});
  GridRepository getGridRepository();
}


