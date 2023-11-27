import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core/core/widgets/helper_widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals_model/model/link_model.dart';
import 'package:flutter/material.dart';

typedef LinkModelCallback = void Function(LinkModel documentItemModel);

class LinkModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  final LinkModel documentItemModel;
  final LinkModelCallback documentItemModelCallback;
  final int containerPrivilege;

  LinkModelWidget._({
    required this.app,
    required this.create,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.documentItemModel,
    required this.documentItemModelCallback,
    required this.containerPrivilege,
  });

  @override
  State<StatefulWidget> createState() {
    return _LinkModelWidgetState();
  }

  static Widget getIt(
      BuildContext context,
      AppModel app,
      bool create,
      double widgetWidth,
      double widgetHeight,
      LinkModel documentItemModel,
      LinkModelCallback documentItemModelCallback,
      int containerPrivilege) {
    var copyOf = documentItemModel.copyWith();
    return LinkModelWidget._(
      app: app,
      create: create,
      widgetWidth: widgetWidth,
      widgetHeight: widgetHeight,
      documentItemModel: copyOf,
      documentItemModelCallback: documentItemModelCallback,
      containerPrivilege: containerPrivilege,
    );
  }
}

class _LinkModelWidgetState extends State<LinkModelWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      HeaderWidget(
        app: widget.app,
        cancelAction: () async {
          return true;
        },
        okAction: () async {
          widget.documentItemModelCallback(widget.documentItemModel);
          return true;
        },
        title: 'Link',
      ),
      divider(widget.app, context),
      topicContainer(widget.app, context,
          title: 'General',
          collapsible: true,
          collapsed: true,
          children: [
            getListTile(context, widget.app,
                leading: Icon(Icons.vpn_key),
                title: text(
                    widget.app, context, widget.documentItemModel.documentID)),
          ]),
      Apis.apis().getRegistryApi().openSelectActionWidget(
          app: widget.app,
          action: widget.documentItemModel.action,
          label: 'Action',
          containerPrivilege: widget.containerPrivilege,
          actionSelected: (action) {
            setState(() {
              widget.documentItemModel.action = action;
            });
          }),
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
                  initialValue: widget.documentItemModel.linkText,
                  valueChanged: (value) {
                    widget.documentItemModel.linkText = value;
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    labelText: 'Link text',
                    hintText: 'Link text',
                  ),
                )),
          ]),
    ]);
  }
}
