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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'booklet_component_bloc.dart';
import 'booklet_component_event.dart';
import 'booklet_model.dart';
import 'booklet_repository.dart';
import 'booklet_component_state.dart';

abstract class AbstractBookletComponent extends StatelessWidget {
  static String componentName = "booklets";
  final String bookletID;

  AbstractBookletComponent({this.bookletID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookletBloc> (
          create: (context) => BookletBloc(
            bookletRepository: getBookletRepository())
        ..add(FetchBooklet(id: bookletID)),
      child: _bookletBlockBuilder(context),
    );
  }

  Widget _bookletBlockBuilder(BuildContext context) {
    return BlocBuilder<BookletBloc, BookletState>(builder: (context, state) {
      if (state is BookletLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No booklet defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is BookletError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, BookletModel value);
  Widget alertWidget({ title: String, content: String});
  BookletRepository getBookletRepository();
}


