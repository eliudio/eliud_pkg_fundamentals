import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';

import '../../model/dynamic_widget_entity.dart';
import '../../model/dynamic_widget_model.dart';

class DynamicWidgetBloc extends EditorBaseBloc<DynamicWidgetModel, DynamicWidgetEntity> {
  DynamicWidgetBloc(String appId, EditorFeedback feedback)
      : super(appId, dynamicWidgetRepository(appId: appId)!, feedback);

  @override
  DynamicWidgetModel newInstance(StorageConditionsModel conditions) {
    return DynamicWidgetModel(
        appId: appId,
        documentID: newRandomKey(),
        conditions: conditions,
        content: "",
        description: 'new dynamicWidget');
  }

  @override
  DynamicWidgetModel setDefaultValues(
      DynamicWidgetModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        conditions: t.conditions ?? conditions);
  }
}
