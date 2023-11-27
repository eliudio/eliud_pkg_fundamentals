import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/divider_model.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_bloc.dart';

import 'package:eliud_pkg_fundamentals_model/model/divider_entity.dart';

class DividerBloc extends EditorBaseBloc<DividerModel, DividerEntity> {
  DividerBloc(String appId, EditorFeedback feedback)
      : super(appId, dividerRepository(appId: appId)!, feedback);

  @override
  DividerModel newInstance(StorageConditionsModel conditions) {
    return DividerModel(
        appId: appId,
        documentID: newRandomKey(),
        conditions: conditions,
        height: 1,
        description: 'new divider');
  }

  @override
  DividerModel setDefaultValues(
      DividerModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }
}
