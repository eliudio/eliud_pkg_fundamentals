import 'fundamentals_package.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/js_repository_singleton.dart';

class FundamentalsWebPlugin extends FundamentalsPlugin {
  @override
  void initRepository(String appID) {
    AbstractRepositorySingleton.singleton = JsRepositorySingleton(appID);
  }
}
