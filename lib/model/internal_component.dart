/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/internal_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/component_constructor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/tools/has_fab.dart';


import 'package:eliud_pkg_fundamentals/model/booklet_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_list.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/divider_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/divider_list.dart';
import 'package:eliud_pkg_fundamentals/model/divider_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/divider_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/document_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/document_list.dart';
import 'package:eliud_pkg_fundamentals/model/document_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/document_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/fader_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/fader_list.dart';
import 'package:eliud_pkg_fundamentals/model/fader_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/fader_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/grid_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/grid_list.dart';
import 'package:eliud_pkg_fundamentals/model/grid_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/grid_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/play_store_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_list.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/presentation_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_list.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/simple_image_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_list.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/tutorial_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_list.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_list_event.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class ListComponentFactory implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters}) {
    return ListComponent(componentId: id);
  }
}


typedef DropdownButtonChanged(String value);

class DropdownButtonComponentFactory implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters, String value, DropdownButtonChanged trigger, bool optional}) {
  
    if (id == "booklets")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "dividers")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "documents")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "faders")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "grids")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "playStores")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "presentations")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "simpleImages")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "tutorials")
      return DropdownButtonComponent(componentId: id, value: value, trigger: trigger, optional: optional);

    return null;
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final String componentId;
  Widget widget;

  @override
  Widget fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({this.componentId}) {
    initWidget();
  }

  @override
  Widget build(BuildContext context) {

    if (componentId == 'booklets') return _bookletBuild();
    if (componentId == 'dividers') return _dividerBuild();
    if (componentId == 'documents') return _documentBuild();
    if (componentId == 'faders') return _faderBuild();
    if (componentId == 'grids') return _gridBuild();
    if (componentId == 'playStores') return _playStoreBuild();
    if (componentId == 'presentations') return _presentationBuild();
    if (componentId == 'simpleImages') return _simpleImageBuild();
    if (componentId == 'tutorials') return _tutorialBuild();
    return Image(image: AssetImage('assets/images/component_not_available.png'));
  }

  Widget initWidget() {
    if (componentId == 'booklets') widget = BookletListWidget();
    if (componentId == 'dividers') widget = DividerListWidget();
    if (componentId == 'documents') widget = DocumentListWidget();
    if (componentId == 'faders') widget = FaderListWidget();
    if (componentId == 'grids') widget = GridListWidget();
    if (componentId == 'playStores') widget = PlayStoreListWidget();
    if (componentId == 'presentations') widget = PresentationListWidget();
    if (componentId == 'simpleImages') widget = SimpleImageListWidget();
    if (componentId == 'tutorials') widget = TutorialListWidget();
  }

  Widget _bookletBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookletListBloc>(
          create: (context) => BookletListBloc(
            bookletRepository: bookletRepository(),
          )..add(LoadBookletList()),
        )
      ],
      child: widget,
    );
  }

  Widget _dividerBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DividerListBloc>(
          create: (context) => DividerListBloc(
            dividerRepository: dividerRepository(),
          )..add(LoadDividerList()),
        )
      ],
      child: widget,
    );
  }

  Widget _documentBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentListBloc>(
          create: (context) => DocumentListBloc(
            documentRepository: documentRepository(),
          )..add(LoadDocumentList()),
        )
      ],
      child: widget,
    );
  }

  Widget _faderBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FaderListBloc>(
          create: (context) => FaderListBloc(
            faderRepository: faderRepository(),
          )..add(LoadFaderList()),
        )
      ],
      child: widget,
    );
  }

  Widget _gridBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GridListBloc>(
          create: (context) => GridListBloc(
            gridRepository: gridRepository(),
          )..add(LoadGridList()),
        )
      ],
      child: widget,
    );
  }

  Widget _playStoreBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlayStoreListBloc>(
          create: (context) => PlayStoreListBloc(
            playStoreRepository: playStoreRepository(),
          )..add(LoadPlayStoreList()),
        )
      ],
      child: widget,
    );
  }

  Widget _presentationBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PresentationListBloc>(
          create: (context) => PresentationListBloc(
            presentationRepository: presentationRepository(),
          )..add(LoadPresentationList()),
        )
      ],
      child: widget,
    );
  }

  Widget _simpleImageBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SimpleImageListBloc>(
          create: (context) => SimpleImageListBloc(
            simpleImageRepository: simpleImageRepository(),
          )..add(LoadSimpleImageList()),
        )
      ],
      child: widget,
    );
  }

  Widget _tutorialBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TutorialListBloc>(
          create: (context) => TutorialListBloc(
            tutorialRepository: tutorialRepository(),
          )..add(LoadTutorialList()),
        )
      ],
      child: widget,
    );
  }

}


typedef Changed(String value);

class DropdownButtonComponent extends StatelessWidget {
  final String componentId;
  final String value;
  final Changed trigger;
  final bool optional;

  DropdownButtonComponent({this.componentId, this.value, this.trigger, this.optional});

  @override
  Widget build(BuildContext context) {

    if (componentId == 'booklets') return _bookletBuild();
    if (componentId == 'dividers') return _dividerBuild();
    if (componentId == 'documents') return _documentBuild();
    if (componentId == 'faders') return _faderBuild();
    if (componentId == 'grids') return _gridBuild();
    if (componentId == 'playStores') return _playStoreBuild();
    if (componentId == 'presentations') return _presentationBuild();
    if (componentId == 'simpleImages') return _simpleImageBuild();
    if (componentId == 'tutorials') return _tutorialBuild();
    return Image(image: AssetImage('assets/images/component_not_available.png'));
  }


  Widget _bookletBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookletListBloc>(
          create: (context) => BookletListBloc(
            bookletRepository: bookletRepository(),
          )..add(LoadBookletList()),
        )
      ],
      child: BookletDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _dividerBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DividerListBloc>(
          create: (context) => DividerListBloc(
            dividerRepository: dividerRepository(),
          )..add(LoadDividerList()),
        )
      ],
      child: DividerDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _documentBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentListBloc>(
          create: (context) => DocumentListBloc(
            documentRepository: documentRepository(),
          )..add(LoadDocumentList()),
        )
      ],
      child: DocumentDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _faderBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FaderListBloc>(
          create: (context) => FaderListBloc(
            faderRepository: faderRepository(),
          )..add(LoadFaderList()),
        )
      ],
      child: FaderDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _gridBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GridListBloc>(
          create: (context) => GridListBloc(
            gridRepository: gridRepository(),
          )..add(LoadGridList()),
        )
      ],
      child: GridDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _playStoreBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlayStoreListBloc>(
          create: (context) => PlayStoreListBloc(
            playStoreRepository: playStoreRepository(),
          )..add(LoadPlayStoreList()),
        )
      ],
      child: PlayStoreDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _presentationBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PresentationListBloc>(
          create: (context) => PresentationListBloc(
            presentationRepository: presentationRepository(),
          )..add(LoadPresentationList()),
        )
      ],
      child: PresentationDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _simpleImageBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SimpleImageListBloc>(
          create: (context) => SimpleImageListBloc(
            simpleImageRepository: simpleImageRepository(),
          )..add(LoadSimpleImageList()),
        )
      ],
      child: SimpleImageDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _tutorialBuild() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TutorialListBloc>(
          create: (context) => TutorialListBloc(
            tutorialRepository: tutorialRepository(),
          )..add(LoadTutorialList()),
        )
      ],
      child: TutorialDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

}


