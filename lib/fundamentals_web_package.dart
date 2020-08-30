import 'fundamentals_package.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/js_repository_singleton.dart';

abstract class FundamentalsWebPlugin extends FundamentalsPlugin {
  @override
  void initRepository(String appID) {
    AbstractRepositorySingleton.singleton = JsRepositorySingleton(appID);
  }
}
