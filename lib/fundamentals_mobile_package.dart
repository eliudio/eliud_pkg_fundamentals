import 'fundamentals_package.dart';
import 'model/abstract_repository_singleton.dart';
import 'model/repository_singleton.dart';

class FundamentalsMobilePlugin extends FundamentalsPlugin {
  @override
  void initRepository(String appID) {
    AbstractRepositorySingleton.singleton = RepositorySingleton(appID);
  }
}
