import 'package:eliud_core/access/state/access_determined.dart';
import 'package:eliud_core/access/state/access_state.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/storage_conditions_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core/core/widgets/helper_widgets/condition_simple_widget.dart';
import 'package:eliud_core/core/widgets/helper_widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/simple_image_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core_main/editor/editor_base_bloc/editor_base_state.dart';

import 'package:eliud_pkg_fundamentals_model/model/simple_image_entity.dart';

class SimpleImageComponentEditorConstructor extends ComponentEditorConstructor {
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
        SimpleImageModel(
          appId: app.documentID,
          documentID: newRandomKey(),
          description: 'New Image',
          conditions: StorageConditionsModel(
              privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.noPrivilegeRequiredSimple),
        ),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app, BuildContext context, String id,
      EditorFeedback feedback) async {
    var simpleImage =
        await simpleImageRepository(appId: app.documentID)!.get(id);
    if (simpleImage != null) {
      _openIt(app, context, false, simpleImage, feedback);
    } else {
      openErrorDialog(app, context, '${app.documentID}/_error',
          title: 'Error',
          errorMessage: 'Cannot find chat dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      SimpleImageModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      '${app.documentID}/chatdashboard',
      title: create ? 'Create Chat Dashboard' : 'Update Chat Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<SimpleImageBloc>(
          create: (context) => SimpleImageBloc(
                app.documentID,
                /*create,
            */
                feedback,
              )..add(EditorBaseInitialise<SimpleImageModel>(model)),
          child: SimpleImageComponentEditor(
            app: app,
          )),
    );
  }
}

class SimpleImageBloc
    extends EditorBaseBloc<SimpleImageModel, SimpleImageEntity> {
  SimpleImageBloc(String appId, EditorFeedback feedback)
      : super(appId, simpleImageRepository(appId: appId)!, feedback);

  @override
  SimpleImageModel newInstance(StorageConditionsModel conditions) {
    return SimpleImageModel(
        appId: appId,
        documentID: newRandomKey(),
        description: 'New image',
        conditions: conditions);
  }

  @override
  SimpleImageModel setDefaultValues(
      SimpleImageModel t, StorageConditionsModel conditions) {
    return t.copyWith(conditions: t.conditions ?? conditions);
  }
}

class SimpleImageComponentEditor extends StatefulWidget {
  final AppModel app;

  const SimpleImageComponentEditor({
    super.key,
    required this.app,
  });

  @override
  State<StatefulWidget> createState() => _SimpleImageComponentEditorState();
}

class _SimpleImageComponentEditorState
    extends State<SimpleImageComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<SimpleImageBloc, EditorBaseState<SimpleImageModel>>(
            builder: (ppContext, simpleImageState) {
          if (simpleImageState is EditorBaseInitialised<SimpleImageModel>) {
            return ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'SimpleImage',
                    okAction: () async {
                      await BlocProvider.of<SimpleImageBloc>(context).save(
                          EditorBaseApplyChanges<SimpleImageModel>(
                              model: simpleImageState.model));
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
                                simpleImageState.model.documentID)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: simpleImageState.model.description,
                              valueChanged: (value) {
                                simpleImageState.model.description = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Select Image',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        Apis.apis().getMediumApi().getPlatformPhotoWidget(
                              context: context,
                              feedbackFunction: (mediumModel) {
                                setState(() {
                                  simpleImageState.model.image = mediumModel;
                                });
                              },
                              app: widget.app,
                              initialImage: simpleImageState.model.image,
                            ),
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
                              value: simpleImageState.model.conditions!,
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
}
