import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DividerComponentEditorConstructor extends ComponentEditorConstructor {
  @override
  void updateComponent(BuildContext context, model, EditorFeedback feedback) {
    _openIt(context, false, model.copyWith(), feedback);
  }

  @override
  void createNewComponent(BuildContext context, EditorFeedback feedback) {
    _openIt(
        context,
        true,
        DividerModel(documentID: 'new identifier', name: 'New divider'),
        feedback);
  }

  @override
  void updateComponentWithID(
      BuildContext context, String dividerId, EditorFeedback feedback) async {
    var divider =
        await dividerRepository(appId: AccessBloc.currentAppId(context))!
            .get(dividerId);
    if (divider != null) {
      _openIt(context, false, divider, feedback);
    } else {
      openErrorDialog(context, AccessBloc.currentAppId(context) + '/_error', 
          title: 'Error', errorMessage: 'Cannot find divider with id $dividerId');
    }
  }

  void _openIt(BuildContext context, bool create, DividerModel model,
      EditorFeedback feedback) {
    openComplexDialog(
      context,
      AccessBloc.currentAppId(context) + '/divider',
      title: create ? 'Create divider' : 'Update divider',
      includeHeading: false,
      widthFraction: .9,
      child: DividerComponentEditor(
          model: model, create: create, feedback: feedback),
    );
  }
}

class DividerComponentEditor extends StatefulWidget {
  final DividerModel model;
  final bool create;
  final EditorFeedback feedback;

  const DividerComponentEditor(
      {Key? key,
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
          HeaderWidget(
            title: 'Divider',
            okAction: () async {
              var appId = accessState.currentAppId(context);
              if (widget.create) {
                var existingModel = await dividerRepository(appId: appId)!
                    .get(widget.model.documentID);
                if (existingModel == null) {
                  await dividerRepository(appId: appId)!.add(widget.model);
                } else {
                  openErrorDialog(context,
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
          topicContainer(context,
              title: 'General',
              collapsible: true,
              collapsed: true,
              children: [
                getListTile(context,
                    leading: Icon(Icons.vpn_key),
                    title: widget.create
                        ? dialogField(
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
                        : text(context, widget.model.documentID!)),
                getListTile(context,
                    leading: Icon(Icons.security),
                    title: ConditionsSimpleWidget(
                      value: widget.model.conditions!,
                    )),
                getListTile(context,
                    leading: Icon(Icons.description),
                    title: dialogField(
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
        return progressIndicator(context);
      }
    });
  }
}