import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/model/platform_medium_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_helpers/helpers/parse_helper.dart';
import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:eliud_core/core/widgets/background_widget.dart';
import 'package:eliud_pkg_fundamentals/editors/widgets/document_item_widget.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
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
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/apis/medium/access_rights.dart';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core_main/editor/ext_editor_base_bloc/ext_editor_base_state.dart';

import 'bloc/document_bloc.dart';

class DocumentComponentEditorConstructor extends ComponentEditorConstructor {
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
        DocumentModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New document',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var document = await documentRepository(appId: app.documentID)!.get(id);
    if (document != null) {
      _openIt(app, context, false, document, feedback);
    } else {
      openErrorDialog(app, context, '${app.documentID}/_error',
          title: 'Error', errorMessage: 'Cannot find document with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      DocumentModel model, EditorFeedback feedback) {
    openComplexDialog(app, context, '${app.documentID}/Document',
        title: create ? 'Create document' : 'Update document',
        includeHeading: false,
        widthFraction: .9,
        child: BlocProvider<DocumentBloc>(
          create: (context) => DocumentBloc(
            app.documentID,
            feedback,
          )..add(ExtEditorBaseInitialise<DocumentModel>(model)),
          child: DocumentComponentEditor(
            app: app,
          ),
        ));
  }
}

class DocumentComponentEditor extends StatefulWidget {
  final AppModel app;

  const DocumentComponentEditor({
    super.key,
    required this.app,
  });

  @override
  State<StatefulWidget> createState() => _DocumentComponentEditorState();
}

class _DocumentComponentEditorState extends State<DocumentComponentEditor> {
  double? _progress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        if (accessState.getMember() == null) {
          return text(widget.app, context, 'Member not logged in');
        }
        var memberId = accessState.getMember()!.documentID;
        return BlocBuilder<DocumentBloc, ExtEditorBaseState<DocumentModel>>(
            builder: (ppContext, documentState) {
          if (documentState
              is ExtEditorBaseInitialised<DocumentModel, dynamic>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'Document',
                    okAction: () async {
                      await BlocProvider.of<DocumentBloc>(context).save(
                          ExtEditorBaseApplyChanges<DocumentModel>(
                              model: documentState.model));
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
                                documentState.model.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: documentState.model.description,
                              valueChanged: (value) {
                                documentState.model.description = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Contents',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: documentState.model.content,
                              valueChanged: (value) {
                                documentState.model.content = value;
                              },
                              maxLines: 10,
                              decoration: const InputDecoration(
                                hintText: 'Content',
                                labelText: 'Content',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Settings',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.height),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue:
                                  documentState.model.padding.toString(),
                              valueChanged: (value) {
                                setState(() {
                                  documentState.model.padding =
                                      doubleParse(value);
                                });
                              },
                              keyboardType: TextInputType.numberWithOptions(
                                signed: false,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Padding',
                                labelText: 'Padding',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Images',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _images(context, documentState),
                      ]),
                  BackgroundWidget(
                      app: widget.app,
                      memberId: memberId,
                      value: documentState.model.background!,
                      label: 'Background'),
                  topicContainer(widget.app, context,
                      title: 'Condition',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.security),
                            title: ConditionsSimpleWidget(
                              app: widget.app,
                              value: documentState.model.conditions!,
                              readOnly: documentState.model.images != null &&
                                  documentState.model.images!.isNotEmpty,
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
      ExtEditorBaseInitialised<DocumentModel, dynamic> state) {
    var widgets = <Widget>[];
    var items = state.model.images != null ? state.model.images! : [];
    if (state.model.images != null) {
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
              BlocProvider.of<DocumentBloc>(context).add(
                  SelectForEditEvent<DocumentModel, DocumentItemModel>(
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
            BlocProvider.of<DocumentBloc>(context).add(
                MoveEvent<DocumentModel, DocumentItemModel>(
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
              child: DocumentItemModelWidget.getIt(
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
            BlocProvider.of<DocumentBloc>(context).add(
                DeleteItemEvent<DocumentModel, DocumentItemModel>(
                    itemModel: currentEdit));
          }),
          Spacer(),
          button(widget.app, context,
              icon: Icon(
                Icons.arrow_right,
              ),
              label: 'Move down', onPressed: () async {
            BlocProvider.of<DocumentBloc>(context).add(
                MoveEvent<DocumentModel, DocumentItemModel>(
                    isUp: false, item: currentEdit));
          }),
        ]),
      ]);
    } else {
      return theWidget;
    }
  }

  void _listedItemModelCallback(
    DocumentItemModel oldItem,
    DocumentItemModel newItem,
  ) {
    BlocProvider.of<DocumentBloc>(context).add(
        UpdateItemEvent<DocumentModel, DocumentItemModel>(
            oldItem: oldItem, newItem: newItem));
  }

  Widget _addButton(
      ExtEditorBaseInitialised<DocumentModel, dynamic> documentState) {
    if (_progress != null) {
      return progressIndicatorWithValue(widget.app, context, value: _progress!);
    } else {
      return popupMenuButton<int>(widget.app, context,
          child: Icon(Icons.add),
          itemBuilder: (context) => [
                if (Apis.apis().getMediumApi().hasCamera())
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
              Apis.apis().getMediumApi().takePhoto(
                  context,
                  widget.app,
                  () => PlatformMediumAccessRights(
                      documentState.model.conditions!.privilegeLevelRequired!),
                  (photo) => _photoFeedbackFunction(photo),
                  _photoUploading,
                  allowCrop: false);
            } else if (value == 1) {
              Apis.apis().getMediumApi().uploadPhoto(
                  context,
                  widget.app,
                  () => PlatformMediumAccessRights(
                      documentState.model.conditions!.privilegeLevelRequired!),
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
        BlocProvider.of<DocumentBloc>(context)
            .add(AddItemEvent<DocumentModel, DocumentItemModel>(
                itemModel: DocumentItemModel(
          documentID: newRandomKey(),
          image: platformMediumModel,
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
