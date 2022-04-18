import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_text_model.dart';
import 'package:eliud_pkg_medium/wizards/widgets/photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

class SimpleTextComponentEditorConstructor
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
        SimpleTextModel(
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
    var simpleText =
        await simpleTextRepository(appId: app.documentID!)!.get(id);
    if (simpleText != null) {
      _openIt(app, context, false, simpleText, feedback);
    } else {
      openErrorDialog(app, context, app.documentID! + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find chat dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      SimpleTextModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID! + '/chatdashboard',
      title: create
          ? 'Create Chat Dashboard'
          : 'Update Chat Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<SimpleTextBloc>(
          create: (context) => SimpleTextBloc(
                app.documentID!,
                /*create,
            */
                feedback,
              )..add(EditorBaseInitialise<SimpleTextModel>(model)),
          child: SimpleTextComponentEditor(
            app: app,
          )),
    );
  }
}

class SimpleTextBloc
    extends EditorBaseBloc<SimpleTextModel> {

  SimpleTextBloc(String appId, EditorFeedback feedback)
      : super(appId, simpleTextRepository(appId: appId)!, feedback);

  @override
  SimpleTextModel newInstance(StorageConditionsModel conditions) {
    return SimpleTextModel(
        appId: appId,
        documentID: newRandomKey(),
        conditions: conditions);
  }

  @override
  SimpleTextModel setDefaultValues(
      SimpleTextModel t, StorageConditionsModel conditions) {
    return t.copyWith(
        conditions: t.conditions ??
            StorageConditionsModel(
                privilegeLevelRequired:
                PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple));
  }
}

class SimpleTextComponentEditor extends StatefulWidget {
  final AppModel app;

  const SimpleTextComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _SimpleTextComponentEditorState();
}

class _SimpleTextComponentEditorState
    extends State<SimpleTextComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<SimpleTextBloc, EditorBaseState<SimpleTextModel>>(
            builder: (ppContext, simpleTextState) {
          if (simpleTextState is EditorBaseInitialised<SimpleTextModel>) {
            return ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'SimpleText',
                    okAction: () async {
                      await BlocProvider.of<SimpleTextBloc>(context)
                          .save(EditorBaseApplyChanges<SimpleTextModel>(
                              model: simpleTextState.model));
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
                                simpleTextState.model.documentID!)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: simpleTextState.model.title,
                              valueChanged: (value) {
                                simpleTextState.model.title = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Title',
                                labelText: 'Title',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Text',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: simpleTextState.model.text,
                              valueChanged: (value) {
                                simpleTextState.model.text = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Text',
                                labelText: 'Text',
                              ),
                            )),
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
                              value: simpleTextState.model.conditions!,
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
