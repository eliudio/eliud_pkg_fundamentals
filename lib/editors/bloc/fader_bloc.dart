import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core_model/model/storage_conditions_model.dart';
import 'package:eliud_core_model/tools/component/component_spec.dart';
import 'package:eliud_core_model/tools/etc/random.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/listed_item_model.dart';

import 'package:eliud_pkg_fundamentals_model/model/fader_entity.dart';

class FaderBloc
    extends ExtEditorBaseBloc<FaderModel, ListedItemModel, FaderEntity> {
  FaderBloc(String appId, EditorFeedback feedback)
      : super(appId, faderRepository(appId: appId)!, feedback);

  @override
  FaderModel addItem(FaderModel model, ListedItemModel newItem) {
    List<ListedItemModel> newItems = model.items == null ? [] : model.items!;
    newItems.add(newItem);
    var newModel = model.copyWith(items: newItems);
    return newModel;
  }

  @override
  FaderModel deleteItem(FaderModel model, ListedItemModel deleteItem) {
    var newItems = <ListedItemModel>[];
    if (model.items != null) {
      for (var item in model.items!) {
        if (item != deleteItem) {
          newItems.add(item);
        }
      }
    }
    var newModel = model.copyWith(items: newItems);
    return newModel;
  }

  @override
  FaderModel newInstance(StorageConditionsModel conditions) {
    return FaderModel(
      appId: appId,
      description: 'New fader',
      documentID: newRandomKey(),
      animationMilliseconds: 1000,
      imageSeconds: 1,
      items: [],
      conditions: conditions,
    );
  }

  @override
  FaderModel setDefaultValues(FaderModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }

  @override
  FaderModel updateItem(
      FaderModel model, ListedItemModel oldItem, ListedItemModel newItem) {
    List<ListedItemModel> currentItems =
        model.items == null ? [] : model.items!;
    var index = currentItems.indexOf(oldItem);
    if (index != -1) {
      var newItems = currentItems.map((e) => e).toList();
      newItems[index] = newItem;
      var newModel = model.copyWith(items: newItems);
      return newModel;
    } else {
      throw Exception("Could not find $oldItem");
    }
  }

  @override
  List<ListedItemModel> copyOf(List<ListedItemModel> ts) {
    return ts.map((t) => t).toList();
  }
}
