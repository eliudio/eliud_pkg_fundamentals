/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/admin_app.dart
                       
 This code is generated. This is read only. Don't touch!

*/


import 'package:eliud_core/tools/admin_app_base.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';

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

class AdminApp extends AdminAppInstallerBase {
  final String appId;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;
  
  AdminApp(this.appId, this._drawer, this._endDrawer, this._appBar, this._homeMenu, this.menuItemColor, this.selectedMenuItemColor, this.backgroundColor);


  PageModel _bookletsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-booklets", componentName: "eliud_pkg_fundamentals_internalWidgets", componentId: "booklets"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_booklets_page",
        title: "Booklets",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _decoratedContentsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-decoratedContents", componentName: "eliud_pkg_fundamentals_internalWidgets", componentId: "decoratedContents"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_decoratedcontents_page",
        title: "DecoratedContents",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _dividersPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-dividers", componentName: "eliud_pkg_fundamentals_internalWidgets", componentId: "dividers"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_dividers_page",
        title: "Dividers",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _documentsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-documents", componentName: "eliud_pkg_fundamentals_internalWidgets", componentId: "documents"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_documents_page",
        title: "Documents",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _fadersPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-faders", componentName: "eliud_pkg_fundamentals_internalWidgets", componentId: "faders"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_faders_page",
        title: "Faders",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _gridsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-grids", componentName: "eliud_pkg_fundamentals_internalWidgets", componentId: "grids"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_grids_page",
        title: "Grids",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _presentationsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-presentations", componentName: "eliud_pkg_fundamentals_internalWidgets", componentId: "presentations"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_presentations_page",
        title: "Presentations",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _simpleImagesPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-simpleImages", componentName: "eliud_pkg_fundamentals_internalWidgets", componentId: "simpleImages"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_simpleimages_page",
        title: "SimpleImages",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _simpleTextsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-simpleTexts", componentName: "eliud_pkg_fundamentals_internalWidgets", componentId: "simpleTexts"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_simpletexts_page",
        title: "SimpleTexts",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  PageModel _tutorialsPages() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "internalWidget-tutorials", componentName: "eliud_pkg_fundamentals_internalWidgets", componentId: "tutorials"));
    PageModel page = PageModel(
        conditions: StorageConditionsModel(
          privilegeLevelRequired: PrivilegeLevelRequiredSimple.OwnerPrivilegeRequiredSimple,
        ),
        appId: appId,
        documentID: "eliud_pkg_fundamentals_tutorials_page",
        title: "Tutorials",
        drawer: _drawer,
        endDrawer: _endDrawer,
        appBar: _appBar,
        homeMenu: _homeMenu,
        bodyComponents: components,
        layout: PageLayout.OnlyTheFirstComponent
    );
    return page;
  }


  Future<void> _setupAdminPages() {

    return pageRepository(appId: appId)!.add(_bookletsPages())

        .then((_) => pageRepository(appId: appId)!.add(_decoratedContentsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_dividersPages()))

        .then((_) => pageRepository(appId: appId)!.add(_documentsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_fadersPages()))

        .then((_) => pageRepository(appId: appId)!.add(_gridsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_presentationsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_simpleImagesPages()))

        .then((_) => pageRepository(appId: appId)!.add(_simpleTextsPages()))

        .then((_) => pageRepository(appId: appId)!.add(_tutorialsPages()))

    ;
  }

  @override
  Future<void> run() async {
    return _setupAdminPages();
  }


}

class AdminMenu extends AdminAppMenuInstallerBase {

  Future<MenuDefModel> menu(AppModel app) async {
    var menuItems = <MenuItemModel>[];

    menuItems.add(
      MenuItemModel(
        documentID: "Booklets",
        text: "Booklets",
        description: "Booklets",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_fundamentals_booklets_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "DecoratedContents",
        text: "DecoratedContents",
        description: "DecoratedContents",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_fundamentals_decoratedcontents_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Dividers",
        text: "Dividers",
        description: "Dividers",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_fundamentals_dividers_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Documents",
        text: "Documents",
        description: "Documents",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_fundamentals_documents_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Faders",
        text: "Faders",
        description: "Faders",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_fundamentals_faders_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Grids",
        text: "Grids",
        description: "Grids",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_fundamentals_grids_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Presentations",
        text: "Presentations",
        description: "Presentations",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_fundamentals_presentations_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "SimpleImages",
        text: "SimpleImages",
        description: "SimpleImages",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_fundamentals_simpleimages_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "SimpleTexts",
        text: "SimpleTexts",
        description: "SimpleTexts",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_fundamentals_simpletexts_page"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Tutorials",
        text: "Tutorials",
        description: "Tutorials",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(app, pageID: "eliud_pkg_fundamentals_tutorials_page"))
    );


    MenuDefModel menu = MenuDefModel(
      admin: true,
      documentID: "eliud_pkg_fundamentals_admin_menu",
      appId: app.documentID,
      name: "eliud_pkg_fundamentals",
      menuItems: menuItems
    );
    await menuDefRepository(appId: app.documentID)!.add(menu);
    return menu;
  }
}

class AdminAppWiper extends AdminAppWiperBase {

  @override
  Future<void> deleteAll(String appId) async {
    ;
  }


}

