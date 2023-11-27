import 'package:bloc/bloc.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_pkg_fundamentals_model/model/link_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/section_model.dart';

class SectionBloc extends Bloc<ExtEditorBaseEvent<SectionModel>,
    ExtEditorBaseState<SectionModel>> {
  final String appId;

  SectionBloc(this.appId) : super(ExtEditorBaseUninitialised()) {
    on<ExtEditorBaseInitialise<SectionModel>>((event, emit) {
      emit(ExtEditorBaseInitialised(
        model: event.model.copyWith(),
      ));
    });

    on<AddItemEvent<SectionModel, LinkModel>>((event, emit) {
      if (state is ExtEditorBaseInitialised) {
        var theState = state as ExtEditorBaseInitialised;
        var model = theState.model as SectionModel;
        List<LinkModel> newItems =
            model.links == null ? [] : model.links!.map((e) => e).toList();
        newItems.add(event.itemModel);
        var newModel = model.copyWith(links: newItems);
        emit(ExtEditorBaseInitialised(
            model: newModel, currentEdit: theState.currentEdit));
      }
    });

    on<UpdateItemEvent<SectionModel, LinkModel>>((event, emit) {
      if (state is ExtEditorBaseInitialised) {
        var theState = state as ExtEditorBaseInitialised;
        var model = theState.model as SectionModel;
        List<LinkModel> currentItems = model.links == null ? [] : model.links!;
        var index = currentItems.indexOf(event.oldItem);
        if (index != -1) {
          var newItems = currentItems.map((e) => e).toList();
          newItems[index] = event.newItem;
          var newModel = model.copyWith(links: newItems);
          emit(ExtEditorBaseInitialised(model: newModel));
        } else {
          throw Exception("Could not find item");
        }
      }
    });

    on<DeleteItemEvent<SectionModel, LinkModel>>((event, emit) {
      if (state is ExtEditorBaseInitialised) {
        var theState = state as ExtEditorBaseInitialised;
        var model = theState.model as SectionModel;
        var newItems = <LinkModel>[];
        for (var item in model.links!) {
          if (item != event.itemModel) {
            newItems.add(item);
          }
        }
        var newModel = model.copyWith(links: newItems);
        emit(ExtEditorBaseInitialised(model: newModel));
      }
    });
  }
}
