import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/body_component_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/component_title_helper.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/rgb_formfield.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/editor/body_component_model_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/grid_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/widgets/grid_view/select_grid_view_widget.dart';

import 'bloc/grid_bloc.dart';

class GridComponentEditorConstructor extends ComponentEditorConstructor {
  @override
  void updateComponent(
      AppModel app, BuildContext context, model, EditorFeedback feedback) {
    _openIt(app, context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(
      AppModel app, BuildContext context, EditorFeedback feedback) {
    _openIt(
        app,
        context,
        true,
        GridModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New grid',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var grid = await gridRepository(appId: app.documentID!)!.get(id);
    if (grid != null) {
      _openIt(app, context, false, grid, feedback);
    } else {
      openErrorDialog(app, context, app.documentID! + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find membership dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create, GridModel model,
      EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID! + '/membershipdashboard',
      title: create
          ? 'Create Membership Dashboard'
          : 'Update Membership Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<GridBloc>(
          create: (context) => GridBloc(
                app.documentID!,
                /*create,
            */
                feedback,
              )..add(ExtEditorBaseInitialise<GridModel>(model)),
          child: GridComponentEditor(
            app: app,
          )),
    );
  }
}

class GridComponentEditor extends StatefulWidget {
  final AppModel app;

  const GridComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GridComponentEditorState();
}

class _GridComponentEditorState extends State<GridComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<GridBloc, ExtEditorBaseState<GridModel>>(
            builder: (ppContext, gridState) {
          if (gridState is ExtEditorBaseInitialised<GridModel, dynamic>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'Grid',
                    okAction: () async {
                      await BlocProvider.of<GridBloc>(context).save(
                          ExtEditorBaseApplyChanges<GridModel>(
                              model: gridState.model));
                      return true;
                    },
                    cancelAction: () async {
                      return true;
                    },
                  ),
                  topicContainer(widget.app, context,
                      title: 'General',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.vpn_key),
                            title: text(widget.app, context,
                                gridState.model.documentID!)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: gridState.model.description,
                              valueChanged: (value) {
                                gridState.model.description = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description',
                              ),
                            )),
                      ]),
                  selectGridViewWidget(
                      context,
                      widget.app,
                      gridState.model.conditions,
                      gridState.model.gridView, (newGridView) {
                    setState(() {
                      gridState.model.gridView = newGridView;
                    });
                  }),
                  topicContainer(widget.app, context,
                      title: 'Components',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _actions(gridState),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Condition',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.security),
                            title: ConditionsSimpleWidget(
                              app: widget.app,
                              value: gridState.model.conditions!,
                            )),
                      ]),
                ]);
          } else {
            return progressIndicator(widget.app, context);
          }
        });
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }

  Widget _actions(ExtEditorBaseInitialised<GridModel, dynamic> state) {
    List<BodyComponentModel> items =
        state.model.bodyComponents != null ? state.model.bodyComponents! : [];
    return Container(
      height: 150,
      child: ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
        Container(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                //separatorBuilder: (context, index) => divider(widget.app, context),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final value = items[index];
                  return getListTile(
                    context,
                    widget.app,
                    title: ComponentTitleHelper.title(context, widget.app, value.componentName ?? '?', value.componentId ?? '?'),
                    trailing: popupMenuButton<int>(
                        widget.app, context,
                        child: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                              popupMenuItem(
                                widget.app, context,
                                value: 1,
                                label: 'Update'
                              ),
                              popupMenuItem(
                                widget.app, context,
                                value: 2,
                                label: 'Delete'
                              ),
                            ],
                        onSelected: (selectedValue) {
                          if (selectedValue == 1) {
                            open(
                                value,
                                (newItem) => BlocProvider.of<GridBloc>(context)
                                    .add(UpdateItemEvent<GridModel,
                                            BodyComponentModel>(
                                        oldItem: value, newItem: newItem)),
                                ((state.model.conditions == null) ||
                                        (state.model.conditions!
                                                .privilegeLevelRequired ==
                                            null))
                                    ? 0
                                    : state.model.conditions!
                                        .privilegeLevelRequired!.index);
                          } else if (selectedValue == 2) {
                            BlocProvider.of<GridBloc>(context).add(
                                DeleteItemEvent<GridModel, BodyComponentModel>(
                                    itemModel: value));
                          }
                        }),
                  );
                })),
        divider(
          widget.app,
          context,
        ),
        Row(children: [
          Spacer(),
          button(
            widget.app,
            context,
            icon: Icon(
              Icons.add,
            ),
            label: 'Add',
            onPressed: () {
              open(
                  BodyComponentModel(
                    documentID: newRandomKey(),
                  ),
                  (newItem) => BlocProvider.of<GridBloc>(context)
                      .add(AddItemEvent(itemModel: newItem)),
                  ((state.model.conditions == null) ||
                          (state.model.conditions!.privilegeLevelRequired ==
                              null))
                      ? 0
                      : state.model.conditions!.privilegeLevelRequired!.index);
            },
          ),
          Spacer(),
        ])
      ]),
    );
  }

  void open(
      BodyComponentModel value,
      BodyComponentModelCallback memberActionModelCallback,
      int privilegeContainer) {
    openFlexibleDialog(
      widget.app,
      context,
      widget.app.documentID! + '/_memberaction',
      includeHeading: false,
      widthFraction: .8,
      child: BodyComponentModelWidget.getIt(
          context,
          widget.app,
          false,
          fullScreenWidth(context) * .8,
          fullScreenHeight(context) - 100,
          value,
          memberActionModelCallback,
          privilegeContainer),
    );
  }
}
