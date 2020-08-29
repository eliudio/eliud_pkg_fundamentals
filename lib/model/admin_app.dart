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


import 'package:eliud_core/tools/action_model.dart';

import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/app_bar_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/drawer_model.dart';
import 'package:eliud_core/model/menu_item_model.dart';
import 'package:eliud_core/model/home_menu_model.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

class AdminApp {
  final String appID;
  final DrawerModel _drawer;
  final DrawerModel _endDrawer;
  final AppBarModel _appBar;
  final HomeMenuModel _homeMenu;
  final RgbModel menuItemColor;
  final RgbModel selectedMenuItemColor;
  final RgbModel backgroundColor;
  
  AdminApp(this.appID, this._drawer, this._endDrawer, this._appBar, this._homeMenu, this.menuItemColor, this.selectedMenuItemColor, this.backgroundColor);


  static MenuDefModel _adminMenuDef(String appID) {
    List<MenuItemModel> menuItems = List<MenuItemModel>();

    menuItems.add(
      MenuItemModel(
        documentID: "Booklets",
        text: "Booklets",
        description: "Booklets",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "bookletspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Dividers",
        text: "Dividers",
        description: "Dividers",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "dividerspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Documents",
        text: "Documents",
        description: "Documents",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "documentspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Faders",
        text: "Faders",
        description: "Faders",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "faderspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Grids",
        text: "Grids",
        description: "Grids",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "gridspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "PlayStores",
        text: "PlayStores",
        description: "PlayStores",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "playstorespage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Presentations",
        text: "Presentations",
        description: "Presentations",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "presentationspage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "SimpleImages",
        text: "SimpleImages",
        description: "SimpleImages",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "simpleimagespage"))
    );


    menuItems.add(
      MenuItemModel(
        documentID: "Tutorials",
        text: "Tutorials",
        description: "Tutorials",
        icon: IconModel(codePoint: 0xe88a, fontFamily: "MaterialIcons"),
        action: GotoPage(pageID: "tutorialspage"))
    );


    MenuDefModel menu = MenuDefModel(
      admin: true,
      documentID: "ADMIN_MENU_DEF_1",
      appId: appID,
      name: "Menu Definition 1",
      menuItems: menuItems
    );
    return menu;
  }

  static Future<MenuDefModel> _setupMenuDef(String appID) {
    return menuDefRepository().add(_adminMenuDef(appID));
  }


  PageModel _bookletsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-booklets", componentName: "internalWidgets", componentId: "booklets"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "bookletspage",
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


  PageModel _dividersPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-dividers", componentName: "internalWidgets", componentId: "dividers"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "dividerspage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-documents", componentName: "internalWidgets", componentId: "documents"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "documentspage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-faders", componentName: "internalWidgets", componentId: "faders"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "faderspage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-grids", componentName: "internalWidgets", componentId: "grids"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "gridspage",
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


  PageModel _playStoresPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-playStores", componentName: "internalWidgets", componentId: "playStores"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "playstorespage",
        title: "PlayStores",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-presentations", componentName: "internalWidgets", componentId: "presentations"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "presentationspage",
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
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-simpleImages", componentName: "internalWidgets", componentId: "simpleImages"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "simpleimagespage",
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


  PageModel _tutorialsPages() {
    List<BodyComponentModel> components = List();
    components.add(BodyComponentModel(
      documentID: "internalWidget-tutorials", componentName: "internalWidgets", componentId: "tutorials"));
    PageModel page = PageModel(
        conditional: PageCondition.AdminOnly,
        appId: appID,
        documentID: "tutorialspage",
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

    return pageRepository().add(_bookletsPages())

        .then((_) => pageRepository().add(_dividersPages()))

        .then((_) => pageRepository().add(_documentsPages()))

        .then((_) => pageRepository().add(_fadersPages()))

        .then((_) => pageRepository().add(_gridsPages()))

        .then((_) => pageRepository().add(_playStoresPages()))

        .then((_) => pageRepository().add(_presentationsPages()))

        .then((_) => pageRepository().add(_simpleImagesPages()))

        .then((_) => pageRepository().add(_tutorialsPages()))

    ;
  }

  static Future<void> deleteAll(String appID) async {
    return await imageRepository().deleteAll()
        .then((_) => bookletRepository().deleteAll())
        .then((_) => dividerRepository().deleteAll())
        .then((_) => documentRepository().deleteAll())
        .then((_) => faderRepository().deleteAll())
        .then((_) => gridRepository().deleteAll())
        .then((_) => playStoreRepository().deleteAll())
        .then((_) => presentationRepository().deleteAll())
        .then((_) => simpleImageRepository().deleteAll())
        .then((_) => tutorialRepository().deleteAll())
    ;
  }

  static Future<MenuDefModel> menu(String appID) async {
    return _setupMenuDef(appID);
  }

  Future<void> run() async {
    return _setupAdminPages();
  }


}

