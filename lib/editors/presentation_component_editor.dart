import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/body_component_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core/tools/component_title_helper.dart';
import 'package:eliud_core_helpers/helpers/parse_helper.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:eliud_core/core/widgets/helper_widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/editor/body_component_model_widget.dart';
import 'package:eliud_core/core/widgets/helper_widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals/editors/widgets/presentation_image_alignment_widget.dart';
import 'package:eliud_pkg_fundamentals/editors/widgets/presentation_relative_image_position_widget.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/presentation_bloc.dart';

class PresentationComponentEditorConstructor
    extends ComponentEditorConstructor {
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
        PresentationModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New presentation',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var presentation =
        await presentationRepository(appId: app.documentID)!.get(id);
    if (presentation != null) {
      _openIt(app, context, false, presentation, feedback);
    } else {
      openErrorDialog(app, context, '${app.documentID}/_error',
          title: 'Error',
          errorMessage: 'Cannot find membership dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      PresentationModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      '${app.documentID}/membershipdashboard',
      title: create
          ? 'Create Membership Dashboard'
          : 'Update Membership Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<PresentationBloc>(
          create: (context) => PresentationBloc(
                app.documentID,
                /*create,
            */
                feedback,
              )..add(ExtEditorBaseInitialise<PresentationModel>(model)),
          child: PresentationComponentEditor(
            app: app,
          )),
    );
  }
}

class PresentationComponentEditor extends StatefulWidget {
  final AppModel app;

  const PresentationComponentEditor({
    super.key,
    required this.app,
  });

  @override
  State<StatefulWidget> createState() => _PresentationComponentEditorState();
}

class _PresentationComponentEditorState
    extends State<PresentationComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<PresentationBloc,
                ExtEditorBaseState<PresentationModel>>(
            builder: (ppContext, presentationState) {
          if (presentationState
              is ExtEditorBaseInitialised<PresentationModel, dynamic>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'Presentation',
                    okAction: () async {
                      await BlocProvider.of<PresentationBloc>(context).save(
                          ExtEditorBaseApplyChanges<PresentationModel>(
                              model: presentationState.model));
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
                                presentationState.model.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: presentationState.model.description,
                              valueChanged: (value) {
                                presentationState.model.description = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Image Settings',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        PresentationImageAlignmentWidget(
                          app: widget.app,
                          presentationImageAlignmentCallback:
                              (PresentationImageAlignment
                                  presentationImageAlignment) {
                            presentationState.model.imageAlignment =
                                presentationImageAlignment;
                          },
                          presentationImageAlignment:
                              presentationState.model.imageAlignment ??
                                  PresentationImageAlignment.center,
                        ),
                        PresentationRelativeImagePositionWidget(
                          app: widget.app,
                          presentationRelativeImagePositionCallback:
                              (PresentationRelativeImagePosition
                                  presentationRelativeImagePosition) {
                            presentationState.model.imagePositionRelative =
                                presentationRelativeImagePosition;
                          },
                          presentationRelativeImagePosition:
                              presentationState.model.imagePositionRelative ??
                                  PresentationRelativeImagePosition.aside,
                        ),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.height),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue:
                                  presentationState.model.imageWidth.toString(),
                              valueChanged: (value) {
                                setState(() {
                                  presentationState.model.imageWidth =
                                      doubleParse(value);
                                });
                              },
                              keyboardType: TextInputType.numberWithOptions(
                                signed: false,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Thickness',
                                labelText: 'Thickness',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Components',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _actions(presentationState),
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
                              value: presentationState.model.conditions!,
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

  Widget _actions(ExtEditorBaseInitialised<PresentationModel, dynamic> state) {
    List<BodyComponentModel> items =
        state.model.bodyComponents != null ? state.model.bodyComponents! : [];
    return Container(
      height: 170,
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
                    title: ComponentTitleHelper.title(context, widget.app,
                        value.componentName ?? '?', value.componentId ?? '?'),
                    trailing: popupMenuButton<int>(widget.app, context,
                        child: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                              popupMenuItem(
                                widget.app,
                                context,
                                value: 1,
                                label: 'Update',
                              ),
                              popupMenuItem(widget.app, context,
                                  value: 2, label: 'Delete'),
                            ],
                        onSelected: (selectedValue) {
                          if (selectedValue == 1) {
                            open(
                                value,
                                (newItem) =>
                                    BlocProvider.of<PresentationBloc>(context)
                                        .add(UpdateItemEvent<PresentationModel,
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
                            BlocProvider.of<PresentationBloc>(context).add(
                                DeleteItemEvent<PresentationModel,
                                    BodyComponentModel>(itemModel: value));
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
                  (newItem) => BlocProvider.of<PresentationBloc>(context)
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
      '${widget.app.documentID}/_memberaction',
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
