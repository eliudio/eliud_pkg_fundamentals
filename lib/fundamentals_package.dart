import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/eliud.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

import 'package:eliud_pkg_fundamentals/model/component_registry.dart';

abstract class FundamentalsPackage extends Package {
  @override
  BlocProvider createMainBloc(BuildContext context, NavigatorBloc navigatorBloc) => null;

  @override
  Future<bool> isConditionOk(String packageCondition, AppModel app, MemberModel member, bool isOwner) async => null;

  @override
  void init() {
    ComponentRegistry().init();
  }
}
