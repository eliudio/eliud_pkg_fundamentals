import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/grid_model.dart';

class GridBloc extends ExtEditorBaseBloc<GridModel, BodyComponentModel> {

  GridBloc(String appId, EditorFeedback feedback)
      : super(appId, gridRepository(appId: appId)!, feedback);

  @override
  GridModel addItem(GridModel model, BodyComponentModel newItem) {
    List<BodyComponentModel> newItems = model.bodyComponents == null
        ? []
        : model.bodyComponents!.map((e) => e).toList();
    newItems.add(newItem);
    var newModel = model.copyWith(bodyComponents:  newItems);
    return newModel;
  }

  @override
  GridModel deleteItem(GridModel model, BodyComponentModel deleteItem) {
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
  GridModel newInstance(StorageConditionsModel conditions) {
    return GridModel(
      appId: appId,
      description: 'New grid',
      documentID: newRandomKey(),
      conditions: conditions,
    );
  }

  @override
  GridModel setDefaultValues(GridModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        conditions: t.conditions ?? conditions);
  }

  @override
  GridModel updateItem(GridModel model, BodyComponentModel oldItem, BodyComponentModel newItem) {
    List<BodyComponentModel> currentItems = model.bodyComponents == null
        ? []
        : model.bodyComponents!;
    var index = currentItems.indexOf(oldItem);
    if (index != -1) {
      var newItems = currentItems.map((e) => e).toList();
      newItems[index] = newItem;
      var newModel = model.copyWith(bodyComponents: newItems);
      return newModel;
    } else {
      throw Exception("Could not find " + oldItem.toString());
    }
  }

  @override
  List<BodyComponentModel> copyOf(List<BodyComponentModel> ts) {
    return ts.map((e) => e).toList();
  }

}
