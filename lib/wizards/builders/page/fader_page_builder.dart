import 'package:eliud_core_main/wizards/builders/page_builder.dart';
import 'package:eliud_core_main/wizards/tools/document_identifier.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart'
    as corerepo;
import 'package:eliud_core_main/model/app_bar_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/body_component_model.dart';
import 'package:eliud_core_main/model/drawer_model.dart';
import 'package:eliud_core_main/model/home_menu_model.dart';
import 'package:eliud_core_main/model/page_model.dart';
import 'package:eliud_core_main/model/platform_medium_model.dart';
import 'package:eliud_core_main/model/pos_size_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_main/storage/platform_medium_helper.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/fader_component.dart';
import 'package:eliud_pkg_fundamentals_model/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/listed_item_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/section_model.dart';

class FaderPageBuilder extends PageBuilder {
  static String androidImage =
      'packages/eliud_pkg_fundamentals/assets/wizards/fader/android.jpg';
  static String iphoneImage =
      'packages/eliud_pkg_fundamentals/assets/wizards/fader/iphone.jpg';
  static String tabletImage =
      'packages/eliud_pkg_fundamentals/assets/wizards/fader/tablet.jpg';
  static String macbookImage =
      'packages/eliud_pkg_fundamentals/assets/wizards/fader/macbook.jpg';

  final String componentId;
  final RelativeImagePosition imagePosition = RelativeImagePosition.aside;
  final SectionImageAlignment alignment = SectionImageAlignment.left;

  FaderPageBuilder(
    String uniqueId,
    this.componentId,
    String pageId,
    AppModel app,
    String memberId,
    HomeMenuModel theHomeMenu,
    AppBarModel theAppBar,
    DrawerModel leftDrawer,
    DrawerModel rightDrawer,
  ) : super(
          uniqueId,
          pageId,
          app,
          memberId,
          theHomeMenu,
          theAppBar,
          leftDrawer,
          rightDrawer,
        );

  Future<PageModel> _setupPage() async {
    return await corerepo.AbstractRepositorySingleton.singleton
        .pageRepository(app.documentID)!
        .add(_page());
  }

  PageModel _page() {
    List<BodyComponentModel> components = [];
    components.add(BodyComponentModel(
      documentID: "1",
      componentName: AbstractFaderComponent.componentName,
      componentId:
          constructDocumentId(uniqueId: uniqueId, documentId: componentId),
    ));

    return PageModel(
        documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageId),
        appId: app.documentID,
        title: 'Fader example',
        description: 'Fader example',
        drawer: leftDrawer,
        endDrawer: rightDrawer,
        appBar: theAppBar,
        homeMenu: theHomeMenu,
        layout: PageLayout.listView,
        conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple,
        ),
        bodyComponents: components);
  }

  Future<PlatformMediumModel> installImage(String location) async {
    return await PlatformMediumHelper(app, memberId,
            PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple)
        .createThumbnailUploadPhotoAsset(newRandomKey(), location);
  }

  PosSizeModel screen75() {
    return PosSizeModel(
        widthPortrait: .75,
        widthTypePortrait: WidthTypePortrait.percentageWidth,
        heightPortrait: .75,
        heightTypePortrait: HeightTypePortrait.percentageHeight,
        fitPortrait: PortraitFitType.portraitFitWidth,
        alignTypePortrait: PortraitAlignType.portraitAlignCenter,
        widthLandscape: .75,
        widthTypeLandscape: WidthTypeLandscape.percentageWidth,
        heightLandscape: .75,
        heightTypeLandscape: HeightTypeLandscape.percentageHeight,
        fitLandscape: LandscapeFitType.landscapeFitHeight,
        alignTypeLandscape: LandscapeAlignType.landscapeAlignCenter,
        clip: ClipType.noClip);
  }

  Future<FaderModel> createFader(
    PlatformMediumModel android,
    PlatformMediumModel iphone,
    PlatformMediumModel tablet,
    PlatformMediumModel macbook,
  ) async {
    var items = <ListedItemModel>[];
    items.add(ListedItemModel(
        documentID: "android",
        description: "Android",
        posSize: screen75(),
        image: android));
    items.add(ListedItemModel(
        documentID: "macbook",
        description: "Macbook",
        posSize: screen75(),
        image: macbook));
    items.add(ListedItemModel(
        documentID: "iphone",
        description: "iphone",
        posSize: screen75(),
        image: iphone));
    items.add(ListedItemModel(
        documentID: "tablet",
        description: "Tablet",
        posSize: screen75(),
        image: tablet));
    var model = FaderModel(
      documentID:
          constructDocumentId(uniqueId: uniqueId, documentId: componentId),
      description: "Welcome fader",
      animationMilliseconds: 1000,
      imageSeconds: 5,
      items: items,
      appId: app.documentID,
      conditions: StorageConditionsModel(
          privilegeLevelRequired:
              PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
    );
    await AbstractRepositorySingleton.singleton
        .faderRepository(app.documentID)!
        .add(model);
    return model;
  }

  Future<PageModel> create() async {
    var android = await installImage(androidImage);
    var iphone = await installImage(iphoneImage);
    var tablet = await installImage(tabletImage);
    var macbook = await installImage(macbookImage);
    await createFader(
      android,
      iphone,
      tablet,
      macbook,
    );
    return await _setupPage();
  }
}
