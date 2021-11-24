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


import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/tools/has_fab.dart';


import 'package:eliud_pkg_fundamentals/model/booklet_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_list.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/decorated_content_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_list.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
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
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
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
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/fader_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/fader_list.dart';
import 'package:eliud_pkg_fundamentals/model/fader_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/fader_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
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
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
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
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
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
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/simple_text_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_list.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/tutorial_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_list.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_dropdown_button.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_list_event.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

class ListComponentFactory implements ComponentConstructor {
  Widget? createNew({Key? key, required String appId,  required String id, Map<String, dynamic>? parameters}) {
    return ListComponent(appId: appId, componentId: id);
  }

  @override
  dynamic getModel({required String appId, required String id}) {
    return null;
  }
}


typedef DropdownButtonChanged(String? value);

class DropdownButtonComponentFactory implements ComponentDropDown {
  @override
  dynamic getModel({required String appId, required String id}) {
    return null;
  }


  bool supports(String id) {

    if (id == "booklets") return true;
    if (id == "decoratedContents") return true;
    if (id == "dividers") return true;
    if (id == "documents") return true;
    if (id == "faders") return true;
    if (id == "grids") return true;
    if (id == "presentations") return true;
    if (id == "simpleImages") return true;
    if (id == "simpleTexts") return true;
    if (id == "tutorials") return true;
    return false;
  }

  Widget createNew({Key? key, required String appId, required String id, Map<String, dynamic>? parameters, String? value, DropdownButtonChanged? trigger, bool? optional}) {

    if (id == "booklets")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "decoratedContents")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "dividers")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "documents")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "faders")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "grids")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "presentations")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "simpleImages")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "simpleTexts")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    if (id == "tutorials")
      return DropdownButtonComponent(appId: appId, componentId: id, value: value, trigger: trigger, optional: optional);

    return Text("Id $id not found");
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final String appId;
  final String? componentId;
  Widget? widget;

  @override
  Widget? fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({required this.appId, this.componentId}) {
    initWidget();
  }

  @override
  Widget build(BuildContext context) {

    if (componentId == 'booklets') return _bookletBuild(context);
    if (componentId == 'decoratedContents') return _decoratedContentBuild(context);
    if (componentId == 'dividers') return _dividerBuild(context);
    if (componentId == 'documents') return _documentBuild(context);
    if (componentId == 'faders') return _faderBuild(context);
    if (componentId == 'grids') return _gridBuild(context);
    if (componentId == 'presentations') return _presentationBuild(context);
    if (componentId == 'simpleImages') return _simpleImageBuild(context);
    if (componentId == 'simpleTexts') return _simpleTextBuild(context);
    if (componentId == 'tutorials') return _tutorialBuild(context);
    return Text('Component with componentId == $componentId not found');
  }

  void initWidget() {
    if (componentId == 'booklets') widget = BookletListWidget();
    if (componentId == 'decoratedContents') widget = DecoratedContentListWidget();
    if (componentId == 'dividers') widget = DividerListWidget();
    if (componentId == 'documents') widget = DocumentListWidget();
    if (componentId == 'faders') widget = FaderListWidget();
    if (componentId == 'grids') widget = GridListWidget();
    if (componentId == 'presentations') widget = PresentationListWidget();
    if (componentId == 'simpleImages') widget = SimpleImageListWidget();
    if (componentId == 'simpleTexts') widget = SimpleTextListWidget();
    if (componentId == 'tutorials') widget = TutorialListWidget();
  }

  Widget _bookletBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookletListBloc>(
          create: (context) => BookletListBloc(
            bookletRepository: bookletRepository(appId: appId)!,
          )..add(LoadBookletList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _decoratedContentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DecoratedContentListBloc>(
          create: (context) => DecoratedContentListBloc(
            decoratedContentRepository: decoratedContentRepository(appId: appId)!,
          )..add(LoadDecoratedContentList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _dividerBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DividerListBloc>(
          create: (context) => DividerListBloc(
            dividerRepository: dividerRepository(appId: appId)!,
          )..add(LoadDividerList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _documentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentListBloc>(
          create: (context) => DocumentListBloc(
            documentRepository: documentRepository(appId: appId)!,
          )..add(LoadDocumentList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _faderBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FaderListBloc>(
          create: (context) => FaderListBloc(
            faderRepository: faderRepository(appId: appId)!,
          )..add(LoadFaderList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _gridBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GridListBloc>(
          create: (context) => GridListBloc(
            gridRepository: gridRepository(appId: appId)!,
          )..add(LoadGridList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _presentationBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PresentationListBloc>(
          create: (context) => PresentationListBloc(
            presentationRepository: presentationRepository(appId: appId)!,
          )..add(LoadPresentationList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _simpleImageBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SimpleImageListBloc>(
          create: (context) => SimpleImageListBloc(
            simpleImageRepository: simpleImageRepository(appId: appId)!,
          )..add(LoadSimpleImageList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _simpleTextBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SimpleTextListBloc>(
          create: (context) => SimpleTextListBloc(
            simpleTextRepository: simpleTextRepository(appId: appId)!,
          )..add(LoadSimpleTextList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _tutorialBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TutorialListBloc>(
          create: (context) => TutorialListBloc(
            tutorialRepository: tutorialRepository(appId: appId)!,
          )..add(LoadTutorialList()),
        )
      ],
      child: widget!,
    );
  }

}


typedef Changed(String? value);

class DropdownButtonComponent extends StatelessWidget {
  final String appId;
  final String? componentId;
  final String? value;
  final Changed? trigger;
  final bool? optional;

  DropdownButtonComponent({required this.appId, this.componentId, this.value, this.trigger, this.optional});

  @override
  Widget build(BuildContext context) {

    if (componentId == 'booklets') return _bookletBuild(context);
    if (componentId == 'decoratedContents') return _decoratedContentBuild(context);
    if (componentId == 'dividers') return _dividerBuild(context);
    if (componentId == 'documents') return _documentBuild(context);
    if (componentId == 'faders') return _faderBuild(context);
    if (componentId == 'grids') return _gridBuild(context);
    if (componentId == 'presentations') return _presentationBuild(context);
    if (componentId == 'simpleImages') return _simpleImageBuild(context);
    if (componentId == 'simpleTexts') return _simpleTextBuild(context);
    if (componentId == 'tutorials') return _tutorialBuild(context);
    return Text('Component with componentId == $componentId not found');
  }


  Widget _bookletBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookletListBloc>(
          create: (context) => BookletListBloc(
            bookletRepository: bookletRepository(appId: appId)!,
          )..add(LoadBookletList()),
        )
      ],
      child: BookletDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _decoratedContentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DecoratedContentListBloc>(
          create: (context) => DecoratedContentListBloc(
            decoratedContentRepository: decoratedContentRepository(appId: appId)!,
          )..add(LoadDecoratedContentList()),
        )
      ],
      child: DecoratedContentDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _dividerBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DividerListBloc>(
          create: (context) => DividerListBloc(
            dividerRepository: dividerRepository(appId: appId)!,
          )..add(LoadDividerList()),
        )
      ],
      child: DividerDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _documentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentListBloc>(
          create: (context) => DocumentListBloc(
            documentRepository: documentRepository(appId: appId)!,
          )..add(LoadDocumentList()),
        )
      ],
      child: DocumentDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _faderBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FaderListBloc>(
          create: (context) => FaderListBloc(
            faderRepository: faderRepository(appId: appId)!,
          )..add(LoadFaderList()),
        )
      ],
      child: FaderDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _gridBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GridListBloc>(
          create: (context) => GridListBloc(
            gridRepository: gridRepository(appId: appId)!,
          )..add(LoadGridList()),
        )
      ],
      child: GridDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _presentationBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PresentationListBloc>(
          create: (context) => PresentationListBloc(
            presentationRepository: presentationRepository(appId: appId)!,
          )..add(LoadPresentationList()),
        )
      ],
      child: PresentationDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _simpleImageBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SimpleImageListBloc>(
          create: (context) => SimpleImageListBloc(
            simpleImageRepository: simpleImageRepository(appId: appId)!,
          )..add(LoadSimpleImageList()),
        )
      ],
      child: SimpleImageDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _simpleTextBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SimpleTextListBloc>(
          create: (context) => SimpleTextListBloc(
            simpleTextRepository: simpleTextRepository(appId: appId)!,
          )..add(LoadSimpleTextList()),
        )
      ],
      child: SimpleTextDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

  Widget _tutorialBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TutorialListBloc>(
          create: (context) => TutorialListBloc(
            tutorialRepository: tutorialRepository(appId: appId)!,
          )..add(LoadTutorialList()),
        )
      ],
      child: TutorialDropdownButtonWidget(value: value, trigger: trigger, optional: optional),
    );
  }

}


