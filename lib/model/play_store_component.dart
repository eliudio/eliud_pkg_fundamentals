/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'play_store_component_bloc.dart';
import 'play_store_component_event.dart';
import 'play_store_model.dart';
import 'play_store_repository.dart';
import 'play_store_component_state.dart';

abstract class AbstractPlayStoreComponent extends StatelessWidget {
  static String componentName = "playStores";
  final String playStoreID;

  AbstractPlayStoreComponent({this.playStoreID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayStoreBloc> (
          create: (context) => PlayStoreBloc(
            playStoreRepository: getPlayStoreRepository())
        ..add(FetchPlayStore(id: playStoreID)),
      child: _playStoreBlockBuilder(context),
    );
  }

  Widget _playStoreBlockBuilder(BuildContext context) {
    return BlocBuilder<PlayStoreBloc, PlayStoreState>(builder: (context, state) {
      if (state is PlayStoreLoaded) {
        if (state.value == null) {
          return alertWidget(title: 'Error', content: 'No playStore defined');
        } else {
          return yourWidget(context, state.value);
        }
      } else if (state is PlayStoreError) {
        return alertWidget(title: 'Error', content: state.message);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget yourWidget(BuildContext context, PlayStoreModel value);
  Widget alertWidget({ title: String, content: String});
  PlayStoreRepository getPlayStoreRepository();
}


