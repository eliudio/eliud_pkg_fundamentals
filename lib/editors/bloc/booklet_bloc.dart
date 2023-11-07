import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';

import '../../model/booklet_entity.dart';

class BookletBloc
    extends ExtEditorBaseBloc<BookletModel, SectionModel, BookletEntity> {
  BookletBloc(String appId, EditorFeedback feedback)
      : super(appId, bookletRepository(appId: appId)!, feedback);

  @override
  BookletModel addItem(BookletModel model, SectionModel newItem) {
    List<SectionModel> newItems =
        model.sections == null ? [] : model.sections!.map((e) => e).toList();
    newItems.add(newItem);
    var newModel = model.copyWith(sections: newItems);
    return newModel;
  }

  @override
  BookletModel deleteItem(BookletModel model, SectionModel deleteItem) {
    var newItems = <SectionModel>[];
    for (var item in model.sections!) {
      if (item != deleteItem) {
        newItems.add(item);
      }
    }
    var newModel = model.copyWith(sections: newItems);
    return newModel;
  }

  @override
  BookletModel newInstance(StorageConditionsModel conditions) {
    return BookletModel(
      appId: appId,
      documentID: newRandomKey(),
      description: 'New booklet',
      conditions: conditions,
    );
  }

  @override
  BookletModel setDefaultValues(
      BookletModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }

  @override
  BookletModel updateItem(
      BookletModel model, SectionModel oldItem, SectionModel newItem) {
    List<SectionModel> currentItems =
        model.sections == null ? [] : model.sections!;
    var index = currentItems.indexOf(oldItem);
    if (index != -1) {
      var newItems = currentItems.map((e) => e).toList();
      newItems[index] = newItem;
      var newModel = model.copyWith(sections: newItems);
      return newModel;
    } else {
      throw Exception("Could not find $oldItem");
    }
  }

  @override
  List<SectionModel> copyOf(List<SectionModel> ts) {
    return ts.map((e) => e).toList();
  }
}
