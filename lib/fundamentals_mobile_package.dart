import 'fundamentals_package.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_singleton.dart';

class FundamentalsMobilePlugin extends FundamentalsPlugin {
  @override
  void initRepository(String appID) {
    AbstractRepositorySingleton.singleton = RepositorySingleton(appID);
  }
}
