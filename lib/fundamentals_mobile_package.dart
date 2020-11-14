import 'fundamentals_package.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_singleton.dart';

import 'model/component_registry.dart';

class FundamentalsMobilePackage extends FundamentalsPackage {
  @override
  void init() {
    AbstractRepositorySingleton.singleton = RepositorySingleton();
    super.init();
  }
}
