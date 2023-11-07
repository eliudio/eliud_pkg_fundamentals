import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';

import '../../model/presentation_entity.dart';

class PresentationBloc extends ExtEditorBaseBloc<PresentationModel,
    BodyComponentModel, PresentationEntity> {
  PresentationBloc(String appId, EditorFeedback feedback)
      : super(appId, presentationRepository(appId: appId)!, feedback);

  @override
  PresentationModel addItem(
      PresentationModel model, BodyComponentModel newItem) {
    List<BodyComponentModel> newItems = model.bodyComponents == null
        ? []
        : model.bodyComponents!.map((e) => e).toList();
    newItems.add(newItem);
    var newModel = model.copyWith(bodyComponents: newItems);
    return newModel;
  }

  @override
  PresentationModel deleteItem(
      PresentationModel model, BodyComponentModel deleteItem) {
    var newItems = <BodyComponentModel>[];
    for (var item in model.bodyComponents!) {
      if (item != deleteItem) {
        newItems.add(item);
      }
    }
    var newModel = model.copyWith(bodyComponents: newItems);
    return newModel;
  }

  @override
  PresentationModel newInstance(StorageConditionsModel conditions) {
    return PresentationModel(
      appId: appId,
      description: 'New presentation',
      documentID: newRandomKey(),
      conditions: conditions,
    );
  }

  @override
  PresentationModel setDefaultValues(
      PresentationModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }

  @override
  PresentationModel updateItem(PresentationModel model,
      BodyComponentModel oldItem, BodyComponentModel newItem) {
    List<BodyComponentModel> currentItems =
        model.bodyComponents == null ? [] : model.bodyComponents!;
    var index = currentItems.indexOf(oldItem);
    if (index != -1) {
      var newItems = currentItems.map((e) => e).toList();
      newItems[index] = newItem;
      var newModel = model.copyWith(bodyComponents: newItems);
      return newModel;
    } else {
      throw Exception("Could not find $oldItem");
    }
  }

  @override
  List<BodyComponentModel> copyOf(List<BodyComponentModel> ts) {
    return ts.map((e) => e).toList();
  }
}
