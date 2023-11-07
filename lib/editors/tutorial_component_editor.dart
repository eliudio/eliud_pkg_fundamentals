import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/editors/widgets/tutorial_item_widget.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';
import 'package:eliud_core/package/access_rights.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_state.dart';

import 'bloc/tutorial_bloc.dart';

class TutorialComponentEditorConstructor extends ComponentEditorConstructor {
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
        TutorialModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New tutorial',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var tutorial = await tutorialRepository(appId: app.documentID)!.get(id);
    if (tutorial != null) {
      _openIt(app, context, false, tutorial, feedback);
    } else {
      openErrorDialog(app, context, '${app.documentID}/_error',
          title: 'Error', errorMessage: 'Cannot find tutorial with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      TutorialModel model, EditorFeedback feedback) {
    openComplexDialog(app, context, '${app.documentID}/Tutorial',
        title: create ? 'Create tutorial' : 'Update tutorial',
        includeHeading: false,
        widthFraction: .9,
        child: BlocProvider<TutorialBloc>(
          create: (context) => TutorialBloc(
            app.documentID,
            feedback,
          )..add(ExtEditorBaseInitialise<TutorialModel>(model)),
          child: TutorialComponentEditor(
            app: app,
          ),
        ));
  }
}

class TutorialComponentEditor extends StatefulWidget {
  final AppModel app;

  const TutorialComponentEditor({
    super.key,
    required this.app,
  });

  @override
  State<StatefulWidget> createState() => _TutorialComponentEditorState();
}

class _TutorialComponentEditorState extends State<TutorialComponentEditor> {
  double? _progress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<TutorialBloc, ExtEditorBaseState<TutorialModel>>(
            builder: (ppContext, tutorialState) {
          if (tutorialState
              is ExtEditorBaseInitialised<TutorialModel, dynamic>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'Tutorial',
                    okAction: () async {
                      await BlocProvider.of<TutorialBloc>(context).save(
                          ExtEditorBaseApplyChanges<TutorialModel>(
                              model: tutorialState.model));
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
                                tutorialState.model.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: tutorialState.model.title,
                              valueChanged: (value) {
                                tutorialState.model.title = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Title',
                                labelText: 'Title',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: tutorialState.model.name,
                              valueChanged: (value) {
                                tutorialState.model.name = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                labelText: 'Name',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: tutorialState.model.description,
                              valueChanged: (value) {
                                tutorialState.model.description = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Images',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _images(context, tutorialState),
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
                              value: tutorialState.model.conditions!,
                              readOnly:
                                  tutorialState.model.tutorialEntries != null &&
                                      tutorialState
                                          .model.tutorialEntries!.isNotEmpty,
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

  Widget _images(BuildContext context,
      ExtEditorBaseInitialised<TutorialModel, dynamic> state) {
    var widgets = <Widget>[];
    var items =
        state.model.tutorialEntries != null ? state.model.tutorialEntries! : [];
    if (state.model.tutorialEntries != null) {
      var photos = <PlatformMediumModel>[];
      for (var item in items) {
        if (item.image != null) {
          photos.add(item.image!);
        }
      }
    }
    for (var item in items) {
      var medium = item.image;
      if (medium != null) {
        widgets.add(GestureDetector(
            onTap: () {
              BlocProvider.of<TutorialBloc>(context).add(
                  SelectForEditEvent<TutorialModel, TutorialEntryModel>(
                      item: item));
            },
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: item == state.currentEdit
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 1),
                        ),
                        child: Image.network(
                          medium.url!,
                          //            height: height,
                        ))
                    : Image.network(
                        medium.url!,
                        //            height: height,
                      ))));
      }
    }
    widgets.add(_addButton(state));

    var theWidget = GridView.extent(
        maxCrossAxisExtent: 200,
        padding: const EdgeInsets.all(0),
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        physics: const ScrollPhysics(), // to disable GridView's scrolling
        shrinkWrap: true,
        children: widgets);

    if (state.currentEdit != null) {
      var currentEdit = state.currentEdit!;
      return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
        theWidget,
        divider(widget.app, context),
        Row(children: [
          button(widget.app, context,
              icon: Icon(
                Icons.arrow_left,
              ),
              label: 'Move up', onPressed: () async {
            BlocProvider.of<TutorialBloc>(context).add(
                MoveEvent<TutorialModel, TutorialEntryModel>(
                    isUp: true, item: currentEdit));
          }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.edit,
              ),
              label: 'Edit', onPressed: () async {
            openFlexibleDialog(
              widget.app,
              context,
              '${widget.app.documentID}/_listeditem',
              includeHeading: false,
              widthFraction: .8,
              child: TutorialEntryModelWidget.getIt(
                context,
                widget.app,
                false,
                fullScreenWidth(context) * .8,
                fullScreenHeight(context) - 100,
                currentEdit,
                (newItem) => _listedItemModelCallback(currentEdit, newItem),
              ),
            );
          }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.delete,
              ),
              label: 'Delete', onPressed: () async {
            BlocProvider.of<TutorialBloc>(context).add(
                DeleteItemEvent<TutorialModel, TutorialEntryModel>(
                    itemModel: currentEdit));
          }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.arrow_right,
              ),
              label: 'Move down', onPressed: () async {
            BlocProvider.of<TutorialBloc>(context).add(
                MoveEvent<TutorialModel, TutorialEntryModel>(
                    isUp: false, item: currentEdit));
          }),
        ]),
      ]);
    } else {
      return theWidget;
    }
  }

  void _listedItemModelCallback(
    TutorialEntryModel oldItem,
    TutorialEntryModel newItem,
  ) {
    BlocProvider.of<TutorialBloc>(context).add(
        UpdateItemEvent<TutorialModel, TutorialEntryModel>(
            oldItem: oldItem, newItem: newItem));
  }

  Widget _addButton(
      ExtEditorBaseInitialised<TutorialModel, dynamic> tutorialState) {
    if (_progress != null) {
      return progressIndicatorWithValue(widget.app, context, value: _progress!);
    } else {
      return popupMenuButton<int>(widget.app, context,
          child: Icon(Icons.add),
          itemBuilder: (context) => [
                if (Registry.registry()!.getMediumApi().hasCamera())
                  popupMenuItem(
                    widget.app,
                    context,
                    value: 0,
                    label: 'Take photo',
                  ),
                popupMenuItem(
                  widget.app,
                  context,
                  value: 1,
                  label: 'Upload image',
                ),
              ],
          onSelected: (value) async {
            if (value == 0) {
              Registry.registry()!.getMediumApi().takePhoto(
                  context,
                  widget.app,
                  () => PlatformMediumAccessRights(
                      tutorialState.model.conditions!.privilegeLevelRequired!),
                  (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            } else if (value == 1) {
              Registry.registry()!.getMediumApi().uploadPhoto(
                  context,
                  widget.app,
                  () => PlatformMediumAccessRights(
                      tutorialState.model.conditions!.privilegeLevelRequired!),
                  (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            }
          });
    }
  }

  void _photoFeedbackFunction(PlatformMediumModel? platformMediumModel) {
    setState(() {
      _progress = null;
      if (platformMediumModel != null) {
        BlocProvider.of<TutorialBloc>(context)
            .add(AddItemEvent<TutorialModel, TutorialEntryModel>(
                itemModel: TutorialEntryModel(
          documentID: newRandomKey(),
          description: '',
          image: platformMediumModel,
          code: '',
        )));
      }
    });
  }

  void _photoUploading(dynamic progress) {
    if (progress != null) {}
    setState(() {
      _progress = progress;
    });
  }
}
