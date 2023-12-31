import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/model/platform_medium_model.dart';
import 'package:eliud_core_main/model/pos_size_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_helpers/helpers/parse_helper.dart';
import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:eliud_core/core/widgets/background_widget.dart';
import 'package:eliud_pkg_fundamentals/editors/widgets/listed_item_widget.dart';
import 'package:eliud_pkg_fundamentals_model/model/listed_item_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core/core/widgets/helper_widgets/condition_simple_widget.dart';
import 'package:eliud_core/core/widgets/helper_widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/fader_model.dart';
import 'package:eliud_core_main/apis/medium/access_rights.dart';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_state.dart';

import 'bloc/fader_bloc.dart';

class FaderComponentEditorConstructor extends ComponentEditorConstructor {
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
        FaderModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New fader',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var fader = await faderRepository(appId: app.documentID)!.get(id);
    if (fader != null) {
      _openIt(app, context, false, fader, feedback);
    } else {
      openErrorDialog(app, context, '${app.documentID}/_error',
          title: 'Error', errorMessage: 'Cannot find fader with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      FaderModel model, EditorFeedback feedback) {
    openComplexDialog(app, context, '${app.documentID}/Fader',
        title: create ? 'Create fader' : 'Update fader',
        includeHeading: false,
        widthFraction: .9,
        child: BlocProvider<FaderBloc>(
          create: (context) => FaderBloc(
            app.documentID,
            feedback,
          )..add(ExtEditorBaseInitialise<FaderModel>(model)),
          child: FaderComponentEditor(
            app: app,
          ),
        ));
  }
}

class FaderComponentEditor extends StatefulWidget {
  final AppModel app;

  const FaderComponentEditor({
    super.key,
    required this.app,
  });

  @override
  State<StatefulWidget> createState() => _FaderComponentEditorState();
}

class _FaderComponentEditorState extends State<FaderComponentEditor> {
  double? _progress;

  @override
  Widget build(BuildContext context) {
    var ownerId = AccessBloc.member(context)!.documentID;
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<FaderBloc, ExtEditorBaseState<FaderModel>>(
            builder: (ppContext, faderState) {
          if (faderState is ExtEditorBaseInitialised<FaderModel, dynamic>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'Fader',
                    okAction: () async {
                      await BlocProvider.of<FaderBloc>(context).save(
                          ExtEditorBaseApplyChanges<FaderModel>(
                              model: faderState.model));
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
                                faderState.model.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: faderState.model.description,
                              valueChanged: (value) {
                                faderState.model.description = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Background',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        checkboxListTile(widget.app, context, 'Background?',
                            faderState.model.background != null, (value) {
                          setState(() {
                            if (value!) {
                              faderState.model.background = BackgroundModel();
                            } else {
                              faderState.model.background = null;
                            }
                          });
                        }),
                        if (faderState.model.background != null)
                          BackgroundWidget(
                              app: widget.app,
                              memberId: ownerId,
                              value: faderState.model.background!,
                              label: 'Background'),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Animation settings',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.image),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue:
                                  faderState.model.imageSeconds.toString(),
                              valueChanged: (value) {
                                faderState.model.imageSeconds = intParse(value);
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'The time to display 1 image',
                                labelText: 'Display time (sec)',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.run_circle),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: faderState
                                  .model.animationMilliseconds
                                  .toString(),
                              valueChanged: (value) {
                                faderState.model.animationMilliseconds =
                                    intParse(value);
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText:
                                    'The duration of the transition between the images',
                                labelText: 'Animation time (milisec)',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Images',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _images(context, faderState),
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
                              value: faderState.model.conditions!,
                              readOnly: faderState.model.items != null &&
                                  faderState.model.items!.isNotEmpty,
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
      ExtEditorBaseInitialised<FaderModel, dynamic> state) {
    var widgets = <Widget>[];
    var items = state.model.items != null ? state.model.items! : [];
    if (state.model.items != null) {
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
              BlocProvider.of<FaderBloc>(context).add(
                  SelectForEditEvent<FaderModel, ListedItemModel>(item: item));
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
            BlocProvider.of<FaderBloc>(context).add(
                MoveEvent<FaderModel, ListedItemModel>(
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
              child: ListedItemModelWidget.getIt(
                context,
                widget.app,
                false,
                fullScreenWidth(context) * .8,
                fullScreenHeight(context) - 100,
                currentEdit,
                (newItem) => _listedItemModelCallback(currentEdit, newItem),
                state.model.conditions!.privilegeLevelRequired == null
                    ? 0
                    : state.model.conditions!.privilegeLevelRequired!.index,
              ),
            );
          }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.delete,
              ),
              label: 'Delete', onPressed: () async {
            BlocProvider.of<FaderBloc>(context).add(
                DeleteItemEvent<FaderModel, ListedItemModel>(
                    itemModel: currentEdit));
          }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.arrow_right,
              ),
              label: 'Move down', onPressed: () async {
            BlocProvider.of<FaderBloc>(context).add(
                MoveEvent<FaderModel, ListedItemModel>(
                    isUp: false, item: currentEdit));
          }),
        ]),
      ]);
    } else {
      return theWidget;
    }
  }

  void _listedItemModelCallback(
    ListedItemModel oldItem,
    ListedItemModel newItem,
  ) {
    BlocProvider.of<FaderBloc>(context).add(
        UpdateItemEvent<FaderModel, ListedItemModel>(
            oldItem: oldItem, newItem: newItem));
  }

  Widget _addButton(ExtEditorBaseInitialised<FaderModel, dynamic> faderState) {
    if (_progress != null) {
      return progressIndicatorWithValue(widget.app, context, value: _progress!);
    } else {
      return popupMenuButton<int>(widget.app, context,
          child: Icon(Icons.add),
          itemBuilder: (context) => [
                if (Apis.apis().getMediumApi().hasCamera())
                  popupMenuItem(widget.app, context,
                      value: 0, label: 'Take photo'),
                popupMenuItem(
                  widget.app,
                  context,
                  value: 1,
                  label: 'Upload image',
                ),
              ],
          onSelected: (value) async {
            if (value == 0) {
              Apis.apis().getMediumApi().takePhoto(
                  context,
                  widget.app,
                  () => PlatformMediumAccessRights(
                      faderState.model.conditions!.privilegeLevelRequired!),
                  (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            } else if (value == 1) {
              Apis.apis().getMediumApi().uploadPhoto(
                  context,
                  widget.app,
                  () => PlatformMediumAccessRights(
                      faderState.model.conditions!.privilegeLevelRequired!),
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
        BlocProvider.of<FaderBloc>(context)
            .add(AddItemEvent<FaderModel, ListedItemModel>(
                itemModel: ListedItemModel(
          documentID: newRandomKey(),
          description: '',
          action: null,
          image: platformMediumModel,
          posSize: PosSizeModel(
              widthPortrait: 1,
              widthTypePortrait: WidthTypePortrait.percentageWidth,
              heightPortrait: .5,
              heightTypePortrait: HeightTypePortrait.percentageHeight,
              fitPortrait: PortraitFitType.portraitFitWidth,
              alignTypePortrait: PortraitAlignType.portraitAlignCenter,
              widthLandscape: 1,
              widthTypeLandscape: WidthTypeLandscape.percentageWidth,
              heightLandscape: .5,
              heightTypeLandscape: HeightTypeLandscape.percentageHeight,
              fitLandscape: LandscapeFitType.landscapeFitHeight,
              alignTypeLandscape: LandscapeAlignType.landscapeAlignCenter,
              clip: ClipType.noClip),
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
