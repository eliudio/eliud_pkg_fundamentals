import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';

class DividerBloc extends EditorBaseBloc<DividerModel> {
  DividerBloc(String appId, EditorFeedback feedback)
      : super(appId, dividerRepository(appId: appId)!, feedback);

  @override
  DividerModel newInstance(StorageConditionsModel conditions) {
    return DividerModel(
        appId: appId,
        documentID: newRandomKey(),
        conditions: conditions,
        height: 1,
        name: 'new divider');
  }

  @override
  DividerModel setDefaultConditions(
      DividerModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        conditions: t.conditions ??
            StorageConditionsModel(
                privilegeLevelRequired:
                PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple));
  }
}
