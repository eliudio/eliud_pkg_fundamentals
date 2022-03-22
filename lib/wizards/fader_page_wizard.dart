import 'package:eliud_core/core/wizards/registry/new_app_wizard_info_with_action_specification.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/core/wizards/tools/documentIdentifier.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:flutter/material.dart';
import 'builders/page/fader_page_builder.dart';

class FaderPageWizard extends NewAppWizardInfoWithActionSpecification {
  static String faderPageId = 'fader';
  static String faderComponentIdentifier = "fader";

  FaderPageWizard() : super('fader', 'Fader', 'Generate an example Fader Page');

  @override
  String getPackageName() => "eliud_pkg_fundamentals";

  @override
  NewAppWizardParameters newAppWizardParameters() =>
      ActionSpecificationParametersBase(
        requiresAccessToLocalFileSystem: false,
        availableInLeftDrawer: true,
        availableInRightDrawer: false,
        availableInAppBar: false,
        availableInHomeMenu: true,
        available: false,
      );

  @override
  List<MenuItemModel>? getThoseMenuItems(String uniqueId, AppModel app) =>
      [menuItemFader(uniqueId, app, faderPageId, 'Fader')];

  MenuItemModel menuItemFader(String uniqueId, AppModel app, pageID, text) =>
      MenuItemModel(
          documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageID),
          text: text,
          description: text,
          icon: IconModel(
              codePoint: Icons.info.codePoint,
              fontFamily: Icons.settings.fontFamily),
          action: GotoPage(app, pageID: constructDocumentId(uniqueId: uniqueId, documentId: pageID)));

  @override
  List<NewAppTask>? getCreateTasks(
    String uniqueId,
    AppModel app,
    NewAppWizardParameters parameters,
    MemberModel member,
    HomeMenuProvider homeMenuProvider,
    AppBarProvider appBarProvider,
    DrawerProvider leftDrawerProvider,
    DrawerProvider rightDrawerProvider,
    PageProvider pageProvider,
  ) {
    if (parameters is ActionSpecificationParametersBase) {
      var faderPageSpecifications = parameters.actionSpecifications;
      if (faderPageSpecifications.shouldCreatePageDialogOrWorkflow()) {
        var memberId = member.documentID!;
        List<NewAppTask> tasks = [];
        tasks.add(() async {
          print("Fader Page");
          await FaderPageBuilder(
                  uniqueId,
                  faderComponentIdentifier,
                  faderPageId,
                  app,
                  memberId,
                  homeMenuProvider(),
                  appBarProvider(),
                  leftDrawerProvider(),
                  rightDrawerProvider(),
                  pageProvider,
                  )
              .create();
        });
        return tasks;
      }
    } else {
      throw Exception(
          'Unexpected class for parameters: ' + parameters.toString());
    }
  }

  @override
  AppModel updateApp(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel adjustMe,
  ) =>
      adjustMe;

  @override
  String? getPageID(String uniqueId, NewAppWizardParameters parameters,
          String pageType) =>
      null;

  @override
  ActionModel? getAction(
    String uniqueId,
    NewAppWizardParameters parameters,
    AppModel app,
    String actionType,
  ) =>
      null;

  @override
  PublicMediumModel? getPublicMediumModel(String uniqueId, NewAppWizardParameters parameters, String pageType) => null;
}
