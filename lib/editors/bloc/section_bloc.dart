import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/repository_base.dart';
import 'package:eliud_pkg_fundamentals/editors/widgets/section_model_widget.dart';
import 'package:eliud_pkg_fundamentals/model/link_model.dart';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';


class SectionBloc extends Bloc<ExtEditorBaseEvent<SectionModel>, ExtEditorBaseState<SectionModel>> {
  final String appId;

  SectionBloc(this.appId)
      : super(ExtEditorBaseUninitialised());


  @override
  Stream<ExtEditorBaseState<SectionModel>> mapEventToState(
      ExtEditorBaseEvent event) async* {
    if (event is ExtEditorBaseInitialise) {
      yield ExtEditorBaseInitialised(
        model: event.model.copyWith(),
      );
    } else if (state is ExtEditorBaseInitialised) {
      var theState = state as ExtEditorBaseInitialised;
      var model = theState.model as SectionModel;
      if (event is AddItemEvent) {
        List<LinkModel> newItems = model.links == null
            ? []
            : model.links!.map((e) => e).toList();
        newItems.add(event.itemModel);
        var newModel = model.copyWith(links:  newItems);
        yield ExtEditorBaseInitialised(
            model: newModel,
            currentEdit: theState.currentEdit);
      } else if (event is UpdateItemEvent) {
        List<LinkModel> currentItems = model.links == null
            ? []
            : model.links!;
        var index = currentItems.indexOf(event.oldItem);
        if (index != -1) {
          var newItems = currentItems.map((e) => e).toList();
          newItems[index] = event.newItem;
          var newModel = model.copyWith(links: newItems);
          yield ExtEditorBaseInitialised(
              model: newModel);
        } else {
          throw Exception("Could not find item");
        }
      } else if (event is DeleteItemEvent) {
        var newItems = <LinkModel>[];
        for (var item in model.links!) {
          if (item != event.itemModel) {
            newItems.add(item);
          }
        }
        var newModel = model.copyWith(links: newItems);
        yield ExtEditorBaseInitialised(
            model: newModel);
      }
    }
  }
}
