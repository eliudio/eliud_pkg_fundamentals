import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

import 'model/abstract_repository_singleton.dart';
import 'model/component_registry.dart';
import 'model/js_repository_singleton.dart';
import 'model/repository_singleton.dart';

class FundamentalsPlugin extends Plugin {
  static final String CONDITION_CARTS_HAS_ITEMS = 'MustHaveStuffInBasket';

  @override
  BlocProvider createMainBloc(NavigatorBloc navigatorBloc) => null;

  @override
  Future<bool> isConditionOk(String pluginCondition, AppModel app, MemberModel member, bool isOwner) async => null;

  @override
  void init() {
    if (isWeb()) {
      AbstractRepositorySingleton.singleton = JsRepositorySingleton(GlobalData.app().documentID);
    } else {
      if (isMobile()) {
        AbstractRepositorySingleton.singleton = RepositorySingleton(GlobalData.app().documentID);
      }
    }
    ComponentRegistry().init();
  }

  @override
  void initRepository(String appID) {
    if (isWeb()) {
      AbstractRepositorySingleton.singleton = JsRepositorySingleton(appID);
    } else {
      if (isMobile()) {
        AbstractRepositorySingleton.singleton = RepositorySingleton(appID);
      }
    }
  }

}
