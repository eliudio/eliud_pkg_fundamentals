import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/widgets/editor/select_action_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_core/tools/widgets/platform_medium_widget.dart';
import 'package:eliud_core/tools/widgets/pos_size_widget.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef void ListedItemModelCallback(ListedItemModel listedItemModel);

class ListedItemModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  final ListedItemModel listedItemModel;
  final ListedItemModelCallback listedItemModelCallback;
  final int containerPrivilege;

  ListedItemModelWidget._({
    Key? key,
    required this.app,
    required this.create,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.listedItemModel,
    required this.listedItemModelCallback,
    required this.containerPrivilege,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListedItemModelWidgetState();
  }

  static Widget getIt(
      BuildContext context,
      AppModel app,
      bool create,
      double widgetWidth,
      double widgetHeight,
      ListedItemModel listedItemModel,
      ListedItemModelCallback listedItemModelCallback,
      int containerPrivilege) {
    var copyOf = listedItemModel.copyWith();
    return ListedItemModelWidget._(
      app: app,
      create: create,
      widgetWidth: widgetWidth,
      widgetHeight: widgetHeight,
      listedItemModel: copyOf,
      listedItemModelCallback: listedItemModelCallback,
      containerPrivilege: containerPrivilege,
    );
  }
}

class _ListedItemModelWidgetState extends State<ListedItemModelWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      HeaderWidget(
        app: widget.app,
        cancelAction: () async {
          return true;
        },
        okAction: () async {
          widget.listedItemModelCallback(widget.listedItemModel);
          return true;
        },
        title: 'Fader image settings',
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
                    widget.app, context, widget.listedItemModel.documentID)),
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.listedItemModel.description,
                  valueChanged: (value) {
                    widget.listedItemModel.description = value;
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    labelText: 'Description',
                  ),
                )),
          ]),
      PosSizeWidget(
        app: widget.app,
        posSizeModel: widget.listedItemModel.posSize!,
      ),
      SelectActionWidget(
          app: widget.app,
          action: widget.listedItemModel.action,
          label: 'action',
          containerPrivilege: widget.containerPrivilege,
          actionSelected: (action) {
            setState(() {
              widget.listedItemModel.action = action;
            });
          }),
      if (widget.listedItemModel.image != null) PlatformMediumWidget(app: widget.app, platformMediumModel: widget.listedItemModel.image!)
    ]);
  }
}
