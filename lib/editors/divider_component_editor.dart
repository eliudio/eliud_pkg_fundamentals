import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:flutter/material.dart';

class DividerComponentEditorConstructor extends ComponentEditorConstructor {
  @override
  void updateComponent(BuildContext context, model) {
    _openIt(context, false, model.copyWith());
  }

  @override
  void createNewComponent(BuildContext context) {
    _openIt(context, true,
        DividerModel(documentID: 'new identifier', name: 'New divider'));
  }

  void _openIt(BuildContext context, bool create, DividerModel model) {
    openComplexDialog(
      context,
      title: create ? 'Create divider' : 'Update divider',
      includeHeading: false,
      widthFraction: .9,
      child: DividerComponentEditor(model: model, create: create),
    );
  }

  @override
  void updateComponentWithID(BuildContext context, String id) async {
    var divider = await dividerRepository(appId: AccessBloc.appId(context)!)!.get(id);
    if (divider != null) {
      _openIt(context, false, divider);
    } else {
      openErrorDialog(context, title: 'Error', errorMessage: 'Cannot find divider with id $id');
    }
  }
}

class DividerComponentEditor extends StatefulWidget {
  final DividerModel model;
  final bool create;

  const DividerComponentEditor(
      {Key? key, required this.model, required this.create})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DividerComponentEditorState();
}

class _DividerComponentEditorState extends State<DividerComponentEditor> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      HeaderWidget(
        title: 'Divider',
        okAction: () async {
          var appId = AccessBloc.appId(context);
          if (widget.create) {
            var existingModel = await dividerRepository(appId: appId)!.get(widget.model.documentID);
            if (existingModel == null) {
              dividerRepository(appId: appId)!.add(widget.model);
            } else {
              openErrorDialog(context, title: 'Error', errorMessage: 'Divider with this ID already exists');
              return false;
            }
          } else {
            dividerRepository(appId: appId)!.update(widget.model);
          }
          return true;
        },
        cancelAction: () {},
      ),
      getListTile(context,
          leading: Icon(Icons.vpn_key),
          title: widget.create ? dialogField(
            context,
            initialValue: widget.model.documentID,
            valueChanged:  (value) {
              widget.model.documentID = value;
            },
            decoration: const InputDecoration(
              hintText: 'Identifier',
              labelText: 'Identifier',
            ),
          ) : text(context, widget.model.documentID!)),
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
          ))
    ]);
  }
}
