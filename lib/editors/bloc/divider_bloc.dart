import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';

import '../../model/divider_entity.dart';

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
    return t.copyWith(
        conditions: t.conditions ?? conditions);
  }
}
