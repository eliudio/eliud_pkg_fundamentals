import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/component_registry.dart';
import 'package:eliud_pkg_fundamentals/model/repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/wizards/fader_page_wizard.dart';

import 'package:eliud_pkg_fundamentals/fundamentals_package_stub.dart'
if (dart.library.io) 'fundamentals_mobile_package.dart'
if (dart.library.html) 'fundamentals_web_package.dart';

abstract class FundamentalsPackage extends Package {
  FundamentalsPackage() : super('eliud_pkg_fundamentals');

  @override
  Future<List<PackageConditionDetails>>? getAndSubscribe(AccessBloc accessBloc, AppModel app, MemberModel? member, bool isOwner, bool? isBlocked, PrivilegeLevel? privilegeLevel) => null;

  @override
  List<String>? retrieveAllPackageConditions() => null;

  @override
  void init() {
    ComponentRegistry().init();

    // wizards
    NewAppWizardRegistry.registry().register(FaderPageWizard());

    AbstractRepositorySingleton.singleton = RepositorySingleton();
  }

  @override
  List<MemberCollectionInfo> getMemberCollectionInfo() => AbstractRepositorySingleton.collections;

  static FundamentalsPackage instance() => getFundamentalsPackage();

  /*
   * Register depending packages
   */
  void registerDependencies(Eliud eliud) {
  }
}
