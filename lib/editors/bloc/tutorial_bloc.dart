import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';

class TutorialBloc extends ExtEditorBaseBloc<TutorialModel, TutorialEntryModel> {

  TutorialBloc(String appId, EditorFeedback feedback)
      : super(appId, tutorialRepository(appId: appId)!, feedback);

  @override
  TutorialModel addItem(TutorialModel model, TutorialEntryModel newItem) {
    List<TutorialEntryModel> newItems = model.tutorialEntries == null
        ? []
        : model.tutorialEntries!;
    newItems.add(newItem);
    var newModel = model.copyWith(tutorialEntries: newItems);
    return newModel;
  }

  @override
  TutorialModel deleteItem(TutorialModel model, TutorialEntryModel deleteItem) {
    var newItems = <TutorialEntryModel>[];
    if (model.tutorialEntries != null) {
      for (var item in model.tutorialEntries!) {
        if (item != deleteItem) {
          newItems.add(item);
        }
      }
    }
    var newModel = model.copyWith(tutorialEntries: newItems);
    return newModel;
  }

  @override
  TutorialModel newInstance(StorageConditionsModel conditions) {
    return TutorialModel(
      appId: appId,
      documentID: newRandomKey(),
      name: 'new tutorial',
      title: 'new totorial',
      description: 'new tutorial',
      conditions: conditions,
    );
  }

  @override
  TutorialModel setDefaultValues(TutorialModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }

  @override
  TutorialModel updateItem(TutorialModel model, TutorialEntryModel oldItem, TutorialEntryModel newItem) {
    List<TutorialEntryModel> currentItems = model.tutorialEntries == null
        ? []
        : model.tutorialEntries!;
    var index = currentItems.indexOf(oldItem);
    if (index != -1) {
      var newItems = currentItems.map((e) => e).toList();
      newItems[index] = newItem;
      var newModel = model.copyWith(tutorialEntries: newItems);
      return newModel;
    } else {
      throw Exception("Could not find " + oldItem.toString());
    }
  }

  @override
  List<TutorialEntryModel> copyOf(List<TutorialEntryModel> ts) {
    return ts.map((t) => t).toList();
  }

}
