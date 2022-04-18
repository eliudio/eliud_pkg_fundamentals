import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_bloc.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';

class DocumentBloc extends ExtEditorBaseBloc<DocumentModel, DocumentItemModel> {
  DocumentBloc(String appId, EditorFeedback feedback)
      : super(appId, documentRepository(appId: appId)!, feedback);

  @override
  DocumentModel addItem(DocumentModel model, DocumentItemModel newItem) {
    List<DocumentItemModel> newItems =
        model.images == null ? [] : model.images!;
    newItems.add(newItem);
    var newModel = model.copyWith(images: newItems);
    return newModel;
  }

  @override
  DocumentModel deleteItem(DocumentModel model, DocumentItemModel deleteItem) {
    var newItems = <DocumentItemModel>[];
    if (model.images != null) {
      for (var item in model.images!) {
        if (item != deleteItem) {
          newItems.add(item);
        }
      }
    }
    var newModel = model.copyWith(images: newItems);
    return newModel;
  }

  @override
  DocumentModel newInstance(StorageConditionsModel conditions) {
    return DocumentModel(
      appId: appId,
      documentID: newRandomKey(),
      images: [],
      conditions: conditions,
    );
  }

  @override
  DocumentModel setDefaultValues(
      DocumentModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        background: t.background ?? BackgroundModel(),
        conditions: t.conditions ??
            StorageConditionsModel(
                privilegeLevelRequired:
                    PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple));
  }

  @override
  DocumentModel updateItem(DocumentModel model, DocumentItemModel oldItem,
      DocumentItemModel newItem) {
    List<DocumentItemModel> currentItems =
        model.images == null ? [] : model.images!;
    var index = currentItems.indexOf(oldItem);
    if (index != -1) {
      var newItems = currentItems.map((e) => e).toList();
      newItems[index] = newItem;
      var newModel = model.copyWith(images: newItems);
      return newModel;
    } else {
      throw Exception("Could not find " + oldItem.toString());
    }
  }

  @override
  List<DocumentItemModel> copyOf(List<DocumentItemModel> ts) {
    return ts.map((t) => t).toList();
  }
}