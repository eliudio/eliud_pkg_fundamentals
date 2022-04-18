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
import 'package:eliud_core/tools/query/query_tools.dart';

import 'package:eliud_core/tools/has_fab.dart';


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

class ListComponentFactory implements ComponentConstructor {
  Widget? createNew({Key? key, required AppModel app,  required String id, int? privilegeLevel, Map<String, dynamic>? parameters}) {
    return ListComponent(app: app, componentId: id);
  }

  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }
}


typedef DropdownButtonChanged(String? value, int? privilegeLevel);

class DropdownButtonComponentFactory implements ComponentDropDown {
  @override
  dynamic getModel({required AppModel app, required String id}) {
    return null;
  }


  bool supports(String id) {

    if (id == "decoratedContents") return true;
    if (id == "dividers") return true;
    if (id == "faders") return true;
    if (id == "grids") return true;
    if (id == "presentations") return true;
    if (id == "simpleImages") return true;
    if (id == "simpleTexts") return true;
    if (id == "tutorials") return true;
    if (id == "booklets") return true;
    if (id == "documents") return true;
    return false;
  }

  Widget createNew({Key? key, required AppModel app, required String id, int? privilegeLevel, Map<String, dynamic>? parameters, String? value, DropdownButtonChanged? trigger, bool? optional}) {

    if (id == "decoratedContents")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "dividers")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "faders")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "grids")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "presentations")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "simpleImages")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "simpleTexts")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "tutorials")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "booklets")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    if (id == "documents")
      return DropdownButtonComponent(app: app, componentId: id, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional);

    return Text("Id $id not found");
  }
}


class ListComponent extends StatelessWidget with HasFab {
  final AppModel app;
  final String? componentId;
  Widget? widget;
  int? privilegeLevel;

  @override
  Widget? fab(BuildContext context){
    if ((widget != null) && (widget is HasFab)) {
      HasFab hasFab = widget as HasFab;
      return hasFab.fab(context);
    }
    return null;
  }

  ListComponent({required this.app, this.privilegeLevel, this.componentId}) {
    initWidget();
  }

  @override
  Widget build(BuildContext context) {

    if (componentId == 'decoratedContents') return _decoratedContentBuild(context);
    if (componentId == 'dividers') return _dividerBuild(context);
    if (componentId == 'faders') return _faderBuild(context);
    if (componentId == 'grids') return _gridBuild(context);
    if (componentId == 'presentations') return _presentationBuild(context);
    if (componentId == 'simpleImages') return _simpleImageBuild(context);
    if (componentId == 'simpleTexts') return _simpleTextBuild(context);
    if (componentId == 'tutorials') return _tutorialBuild(context);
    if (componentId == 'booklets') return _bookletBuild(context);
    if (componentId == 'documents') return _documentBuild(context);
    return Text('Component with componentId == $componentId not found');
  }

  void initWidget() {
    if (componentId == 'decoratedContents') widget = DecoratedContentListWidget(app: app);
    if (componentId == 'dividers') widget = DividerListWidget(app: app);
    if (componentId == 'faders') widget = FaderListWidget(app: app);
    if (componentId == 'grids') widget = GridListWidget(app: app);
    if (componentId == 'presentations') widget = PresentationListWidget(app: app);
    if (componentId == 'simpleImages') widget = SimpleImageListWidget(app: app);
    if (componentId == 'simpleTexts') widget = SimpleTextListWidget(app: app);
    if (componentId == 'tutorials') widget = TutorialListWidget(app: app);
    if (componentId == 'booklets') widget = BookletListWidget(app: app);
    if (componentId == 'documents') widget = DocumentListWidget(app: app);
  }

  Widget _decoratedContentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DecoratedContentListBloc>(
          create: (context) => DecoratedContentListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            decoratedContentRepository: decoratedContentRepository(appId: app.documentID!)!,
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
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            dividerRepository: dividerRepository(appId: app.documentID!)!,
          )..add(LoadDividerList()),
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
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            faderRepository: faderRepository(appId: app.documentID!)!,
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
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            gridRepository: gridRepository(appId: app.documentID!)!,
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
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            presentationRepository: presentationRepository(appId: app.documentID!)!,
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
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            simpleImageRepository: simpleImageRepository(appId: app.documentID!)!,
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
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            simpleTextRepository: simpleTextRepository(appId: app.documentID!)!,
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
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            tutorialRepository: tutorialRepository(appId: app.documentID!)!,
          )..add(LoadTutorialList()),
        )
      ],
      child: widget!,
    );
  }

  Widget _bookletBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookletListBloc>(
          create: (context) => BookletListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            bookletRepository: bookletRepository(appId: app.documentID!)!,
          )..add(LoadBookletList()),
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
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            documentRepository: documentRepository(appId: app.documentID!)!,
          )..add(LoadDocumentList()),
        )
      ],
      child: widget!,
    );
  }

}


typedef Changed(String? value, int? privilegeLevel);

class DropdownButtonComponent extends StatelessWidget {
  final AppModel app;
  final String? componentId;
  final String? value;
  final Changed? trigger;
  final bool? optional;
  int? privilegeLevel;

  DropdownButtonComponent({required this.app, this.componentId, this.privilegeLevel, this.value, this.trigger, this.optional});

  @override
  Widget build(BuildContext context) {

    if (componentId == 'decoratedContents') return _decoratedContentBuild(context);
    if (componentId == 'dividers') return _dividerBuild(context);
    if (componentId == 'faders') return _faderBuild(context);
    if (componentId == 'grids') return _gridBuild(context);
    if (componentId == 'presentations') return _presentationBuild(context);
    if (componentId == 'simpleImages') return _simpleImageBuild(context);
    if (componentId == 'simpleTexts') return _simpleTextBuild(context);
    if (componentId == 'tutorials') return _tutorialBuild(context);
    if (componentId == 'booklets') return _bookletBuild(context);
    if (componentId == 'documents') return _documentBuild(context);
    return Text('Component with componentId == $componentId not found');
  }


  Widget _decoratedContentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DecoratedContentListBloc>(
          create: (context) => DecoratedContentListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            decoratedContentRepository: decoratedContentRepository(appId: app.documentID!)!,
          )..add(LoadDecoratedContentList()),
        )
      ],
      child: DecoratedContentDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _dividerBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DividerListBloc>(
          create: (context) => DividerListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            dividerRepository: dividerRepository(appId: app.documentID!)!,
          )..add(LoadDividerList()),
        )
      ],
      child: DividerDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _faderBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FaderListBloc>(
          create: (context) => FaderListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            faderRepository: faderRepository(appId: app.documentID!)!,
          )..add(LoadFaderList()),
        )
      ],
      child: FaderDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _gridBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GridListBloc>(
          create: (context) => GridListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            gridRepository: gridRepository(appId: app.documentID!)!,
          )..add(LoadGridList()),
        )
      ],
      child: GridDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _presentationBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PresentationListBloc>(
          create: (context) => PresentationListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            presentationRepository: presentationRepository(appId: app.documentID!)!,
          )..add(LoadPresentationList()),
        )
      ],
      child: PresentationDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _simpleImageBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SimpleImageListBloc>(
          create: (context) => SimpleImageListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            simpleImageRepository: simpleImageRepository(appId: app.documentID!)!,
          )..add(LoadSimpleImageList()),
        )
      ],
      child: SimpleImageDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _simpleTextBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SimpleTextListBloc>(
          create: (context) => SimpleTextListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            simpleTextRepository: simpleTextRepository(appId: app.documentID!)!,
          )..add(LoadSimpleTextList()),
        )
      ],
      child: SimpleTextDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _tutorialBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TutorialListBloc>(
          create: (context) => TutorialListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            tutorialRepository: tutorialRepository(appId: app.documentID!)!,
          )..add(LoadTutorialList()),
        )
      ],
      child: TutorialDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _bookletBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookletListBloc>(
          create: (context) => BookletListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            bookletRepository: bookletRepository(appId: app.documentID!)!,
          )..add(LoadBookletList()),
        )
      ],
      child: BookletDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

  Widget _documentBuild(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentListBloc>(
          create: (context) => DocumentListBloc(
            eliudQuery: EliudQuery(theConditions: [
              EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel ?? 0),
              EliudQueryCondition('appId', isEqualTo: app.documentID!),]
            ),
            documentRepository: documentRepository(appId: app.documentID!)!,
          )..add(LoadDocumentList()),
        )
      ],
      child: DocumentDropdownButtonWidget(app: app, value: value, privilegeLevel: privilegeLevel, trigger: trigger, optional: optional),
    );
  }

}


