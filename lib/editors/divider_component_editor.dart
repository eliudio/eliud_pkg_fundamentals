import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
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
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DividerComponentEditorConstructor extends ComponentEditorConstructor {
  @override
  void updateComponent(AppModel app, BuildContext context, model, EditorFeedback feedback) {
    _openIt(app, context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(AppModel app, BuildContext context, EditorFeedback feedback) {
    _openIt(app,
        context,
        true,
        DividerModel(appId: app.documentID, documentID: 'new identifier', name: newRandomKey()),
        feedback);
  }

  @override
  void updateComponentWithID(AppModel app,
      BuildContext context, String dividerId, EditorFeedback feedback) async {
    var divider =
        await dividerRepository(appId: app.documentID!)!
            .get(dividerId);
    if (divider != null) {
      _openIt(app, context, false, divider, feedback);
    } else {
      openErrorDialog(app, context, app.documentID! + '/_error',
          title: 'Error', errorMessage: 'Cannot find divider with id $dividerId');
    }
  }

  void _openIt(AppModel app, BuildContext context, bool create, DividerModel model,
      EditorFeedback feedback) {
    openComplexDialog(app,
      context,
      app.documentID! + '/divider',
      title: create ? 'Create divider' : 'Update divider',
      includeHeading: false,
      widthFraction: .9,
      child: DividerComponentEditor(app: app,
          model: model, create: create, feedback: feedback),
    );
  }
}

class DividerComponentEditor extends StatefulWidget {
  final AppModel app;
  final DividerModel model;
  final bool create;
  final EditorFeedback feedback;

  const DividerComponentEditor(
      {Key? key,
        required this.app,
      required this.model,
      required this.create,
      required this.feedback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DividerComponentEditorState();
}

class _DividerComponentEditorState extends State<DividerComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
      if (accessState is AccessDetermined) {
        return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
          HeaderWidget(app:widget.app,
            title: 'Divider',
            okAction: () async {
              var appId = widget.app.documentID!;
              if (widget.create) {
                var existingModel = await dividerRepository(appId: appId)!
                    .get(widget.model.documentID);
                if (existingModel == null) {
                  await dividerRepository(appId: appId)!.add(widget.model);
                } else {
                  openErrorDialog( widget.app, context,
                      appId + '/error',
                      title: 'Error',
                      errorMessage: 'Divider with this ID already exists');
                  widget.feedback(false);
                  return false;
                }
              } else {
                await dividerRepository(appId: appId)!.update(widget.model);
              }
              widget.feedback(true);
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
                getListTile(context,widget.app,
                    leading: Icon(Icons.vpn_key),
                    title: widget.create
                        ? dialogField(widget.app,
                      context,
                      initialValue: widget.model.documentID,
                      valueChanged: (value) {
                        widget.model.documentID = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Identifier',
                        labelText: 'Identifier',
                      ),
                    )
                        : text(widget.app, context, widget.model.documentID!)),
                getListTile(context,widget.app,
                    leading: Icon(Icons.security),
                    title: ConditionsSimpleWidget(app: widget.app,
                      value: widget.model.conditions!,
                    )),
                getListTile(context,widget.app,
                    leading: Icon(Icons.description),
                    title: dialogField(widget.app,
                      context,
                      initialValue: widget.model.name,
                      valueChanged: (value) {
                        widget.model.name = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        labelText: 'Name',
                      ),
                    )),
              ])
        ]);
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }
}
