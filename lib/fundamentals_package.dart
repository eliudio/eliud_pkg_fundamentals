import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core_main/apis/wizard_api/new_app_wizard_info.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core_model/model/access_model.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/component_registry.dart';
import 'package:eliud_pkg_fundamentals_model/model/repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/wizards/fader_page_wizard.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';

import 'package:eliud_pkg_fundamentals/fundamentals_package_stub.dart'
    if (dart.library.io) 'fundamentals_mobile_package.dart'
    if (dart.library.html) 'fundamentals_web_package.dart';

import 'editors/booklet_component_editor.dart';
import 'editors/decorated_content_component_editor.dart';
import 'editors/divider_component_editor.dart';
import 'editors/document_component_editor.dart';
import 'editors/dynamic_widget_component_editor.dart';
import 'editors/fader_component_editor.dart';
import 'editors/grid_component_editor.dart';
import 'editors/presentation_component_editor.dart';
import 'editors/simple_image_component_editor.dart';
import 'editors/simple_text_component_editor.dart';
import 'editors/tutorial_component_editor.dart';
import 'extensions/booklet_component.dart';
import 'extensions/decorated_content_component.dart';
import 'extensions/divider_component.dart';
import 'extensions/document_component.dart';
import 'extensions/dynamic_widget_component.dart';
import 'extensions/fader_component.dart';
import 'extensions/grid_component.dart';
import 'extensions/presentation_component.dart';
import 'extensions/simple_image_component.dart';
import 'extensions/simple_text_component.dart';
import 'extensions/tutorial_component.dart';

abstract class FundamentalsPackage extends Package {
  FundamentalsPackage() : super('eliud_pkg_fundamentals');

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(
          AccessBloc accessBloc,
          AppModel app,
          MemberModel? member,
          bool isOwner,
          bool? isBlocked,
          PrivilegeLevel? privilegeLevel) =>
      null;

  @override
  List<String>? retrieveAllPackageConditions() => null;

  @override
  void init() {
    ComponentRegistry().init(
      BookletComponentConstructorDefault(),
      BookletComponentEditorConstructor(),
      DecoratedContentComponentConstructorDefault(),
      DecoratedContentComponentEditorConstructor(),
      DividerComponentConstructorDefault(),
      DividerComponentEditorConstructor(),
      DocumentComponentConstructorDefault(),
      DocumentComponentEditorConstructor(),
      DynamicWidgetComponentConstructorDefault(),
      DynamicWidgetComponentEditorConstructor(),
      FaderComponentConstructorDefault(),
      FaderComponentEditorConstructor(),
      GridComponentConstructorDefault(),
      GridComponentEditorConstructor(),
      PresentationComponentConstructorDefault(),
      PresentationComponentEditorConstructor(),
      SimpleImageComponentConstructorDefault(),
      SimpleImageComponentEditorConstructor(),
      SimpleTextComponentConstructorDefault(),
      SimpleTextComponentEditorConstructor(),
      TutorialComponentConstructorDefault(),
      TutorialComponentEditorConstructor(),
    );

    // wizards
    NewAppWizardRegistry.registry().register(FaderPageWizard());

    AbstractRepositorySingleton.singleton = RepositorySingleton();
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() =>
      AbstractRepositorySingleton.collections;

  static FundamentalsPackage instance() => getFundamentalsPackage();

  /*
   * Register depending packages
   */
  @override
  void registerDependencies(Eliud eliud) {}
}
