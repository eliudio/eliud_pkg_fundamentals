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
import 'package:eliud_core/tools/rgb_formfield.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:flutter/material.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_bloc.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_event.dart';
import 'package:eliud_core/core/editor/editor_base_bloc/editor_base_state.dart';

import 'bloc/divider_bloc.dart';

class DividerComponentEditorConstructor extends ComponentEditorConstructor {
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
        DividerModel(
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
    var divider = await dividerRepository(appId: app.documentID!)!.get(id);
    if (divider != null) {
      _openIt(app, context, false, divider, feedback);
    } else {
      openErrorDialog(app, context, app.documentID! + '/_error',
          title: 'Error',
          errorMessage: 'Cannot find notification dashboard with id $id');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create,
      DividerModel model, EditorFeedback feedback) {
    openComplexDialog(
      app,
      context,
      app.documentID! + '/notificationdashboard',
      title: create
          ? 'Create Notification Dashboard'
          : 'Update Notification Dashboard',
      includeHeading: false,
      widthFraction: .9,
      child: BlocProvider<DividerBloc>(
          create: (context) => DividerBloc(
                app.documentID!,
                /*create,
            */
                feedback,
              )..add(EditorBaseInitialise<DividerModel>(model)),
          child: DividerComponentEditor(
            app: app,
          )),
    );
  }
}

class DividerComponentEditor extends StatefulWidget {
  final AppModel app;

  const DividerComponentEditor({
    Key? key,
    required this.app,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DividerComponentEditorState();
}

class _DividerComponentEditorState extends State<DividerComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<DividerBloc, EditorBaseState<DividerModel>>(
            builder: (ppContext, dividerState) {
          if (dividerState is EditorBaseInitialised<DividerModel>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    title: 'Divider',
                    okAction: () async {
                      await BlocProvider.of<DividerBloc>(context).save(
                          EditorBaseApplyChanges<DividerModel>(
                              model: dividerState.model));
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
                                dividerState.model.documentID!)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: dividerState.model.name,
                              valueChanged: (value) {
                                dividerState.model.name = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                labelText: 'Name',
                              ),
                            )),
                      ]),
                  RgbField(widget.app, 'Colour', dividerState.model.color,
                      (value) => dividerState.model.color = value),
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
                              dividerState.model.thickness.toString(),
                              valueChanged: (value) {
                                setState(() {
                                  dividerState.model.thickness =
                                      double.parse(value);
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
                        getListTile(context, widget.app,
                            leading: Icon(Icons.height),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue:
                              dividerState.model.height.toString(),
                              valueChanged: (value) {
                                setState(() {
                                  dividerState.model.height =
                                      double.parse(value);
                                });
                              },
                              keyboardType: TextInputType.numberWithOptions(
                                signed: false,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Height',
                                labelText: 'Height',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.height),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue:
                              dividerState.model.indent.toString(),
                              valueChanged: (value) {
                                setState(() {
                                  dividerState.model.indent =
                                      double.parse(value);
                                });
                              },
                              keyboardType: TextInputType.numberWithOptions(
                                signed: false,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Indent',
                                labelText: 'Indent',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.height),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue:
                              dividerState.model.endIndent.toString(),
                              valueChanged: (value) {
                                setState(() {
                                  dividerState.model.endIndent =
                                      double.parse(value);
                                });
                              },
                              keyboardType: TextInputType.numberWithOptions(
                                signed: false,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'End Indent',
                                labelText: 'End Indent',
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
                              value: dividerState.model.conditions!,
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
