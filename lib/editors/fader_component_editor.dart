import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/editors/widgets/item_widget.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_core/tools/widgets/pos_size_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_medium/platform/access_rights.dart';
import 'package:eliud_pkg_medium/platform/medium_platform.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fader_bloc/fader_bloc.dart';
import 'fader_bloc/fader_event.dart';
import 'fader_bloc/fader_state.dart';

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
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var fader = await faderRepository(appId: app.documentID!)!.get(id);
    if (fader != null) {
      _openIt(app, context, false, fader, feedback);
    } else {
      openErrorDialog(app, context, app.documentID! + '/_error',
          title: 'Error', errorMessage: 'Cannot find fader with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      FaderModel model, EditorFeedback feedback) {
    openComplexDialog(app, context, app.documentID! + '/Fader',
        title: create ? 'Create fader' : 'Update fader',
        includeHeading: false,
        widthFraction: .9,
        child: BlocProvider<FaderBloc>(
          create: (context) => FaderBloc(
            app.documentID!,
            /*create,
            */
            feedback,
          )..add(FaderInitialise(model)),
          child: FaderComponentEditor(
            app: app,
          ),
        ));
  }
}

class FaderComponentEditor extends StatefulWidget {
  final AppModel app;

  const FaderComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FaderComponentEditorState();
}

class _FaderComponentEditorState extends State<FaderComponentEditor> {
  double? _progress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<FaderBloc, FaderState>(
            builder: (ppContext, faderState) {
          if (faderState is FaderInitialised) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'Fader',
                    okAction: () async {
                      await BlocProvider.of<FaderBloc>(context)
                          .save(FaderApplyChanges(model: faderState.model));
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
                                faderState.model.documentID!)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.security),
                            title: ConditionsSimpleWidget(
                              app: widget.app,
                              value: faderState.model.conditions!,
                              readOnly: faderState.model.items!.isNotEmpty,
                            )),
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
                              initialValue: faderState.model.imageSeconds.toString(),
                              valueChanged: (value) {
                                faderState.model.imageSeconds = int.parse(value);
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
                              initialValue: faderState.model.animationMilliseconds.toString(),
                              valueChanged: (value) {
                                faderState.model.animationMilliseconds = int.parse(value);
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'The duration of the transition between the images',
                                labelText: 'Animation time (milisec)',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Images',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _images(faderState),
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

  Widget _images(FaderInitialised state) {
    var widgets = <Widget>[];
    var items = state.model.items != null ? state.model.items! : [];
    var photos = <PlatformMediumModel>[];
    if (state.model.items != null) {
      var photos = <PlatformMediumModel>[];
      items.forEach((item) {
        if (item.image != null) {
          photos.add(item.image!);
        }
      });
    }
    for (var item in items) {
      var medium = item.image;
      if (medium != null) {
        widgets.add(GestureDetector(
            onTap: () {
              BlocProvider.of<FaderBloc>(context)
                  .add(SelectForEditEvent(listedItemModel: item));
            },
            child: Padding(
                padding: const EdgeInsets.all(5), child: item == state.currentEdit ? Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 1 ),
              ),
              child: Image.network(
                medium.url!,
                //            height: height,
              )
            ) : Image.network(
              medium.url!,
              //            height: height,
            ))
            ));
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
              label: 'Move up',
              onPressed: () async {
                BlocProvider.of<FaderBloc>(context)
                    .add(MoveEvent(isUp: true, listedItemModel: currentEdit));

              }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.edit,
              ),
              label: 'Edit',
              onPressed: () async {
                openFlexibleDialog(
                  widget.app,
                  context,
                  widget.app.documentID! + '/_listeditem',
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
                  ),
                );
              }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.delete,
              ),
              label: 'Delete',
              onPressed: () async {
                BlocProvider.of<FaderBloc>(context)
                    .add(DeleteListedItemEvent(listedItemModel: currentEdit));
              }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.arrow_right,
              ),
              label: 'Move down',
              onPressed: () async {
                BlocProvider.of<FaderBloc>(context)
                    .add(MoveEvent(isUp: false, listedItemModel: currentEdit));

              }),
        ]),      ]);
    } else {
      return theWidget;
    }
  }

  void _listedItemModelCallback(ListedItemModel oldItem, ListedItemModel newItem, ) {
    BlocProvider.of<FaderBloc>(context)
        .add(UpdatedItemEvent(oldItem: oldItem, newItem: newItem));
  }

  Widget _addButton(FaderInitialised faderState) {
    if (_progress != null) {
      return progressIndicatorWithValue(widget.app, context, value: _progress!);
    } else {
      return PopupMenuButton<int>(
          child: Icon(Icons.add),
          elevation: 10,
          itemBuilder: (context) => [
                if (AbstractMediumPlatform.platform!.hasCamera())
                  PopupMenuItem(
                    value: 0,
                    child: text(widget.app, context, 'Take photo'),
                  ),
                PopupMenuItem(
                  value: 1,
                  child: text(widget.app, context, 'Upload image'),
                ),
              ],
          onSelected: (value) async {
            if (value == 0) {
              AbstractMediumPlatform.platform!.takePhoto(
                  context,
                  widget.app,
                  widget.app.ownerID!,
                  () => PlatformMediumAccessRights(
                      faderState.model.conditions!.privilegeLevelRequired!),
                  (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            } else if (value == 1) {
              AbstractMediumPlatform.platform!.uploadPhoto(
                  context,
                  widget.app,
                  widget.app.ownerID!,
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
            .add(NewImageEvent(medium: platformMediumModel));
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
