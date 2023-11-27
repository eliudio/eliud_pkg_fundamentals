import 'package:eliud_core/core/widgets/helper_widgets/platform_medium_widget.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core/core/widgets/helper_widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals_model/model/document_item_model.dart';
import 'package:flutter/material.dart';

typedef DocumentItemModelCallback = void Function(
    DocumentItemModel documentItemModel);

class DocumentItemModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  final DocumentItemModel documentItemModel;
  final DocumentItemModelCallback documentItemModelCallback;
  final int containerPrivilege;

  DocumentItemModelWidget._({
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
    return _DocumentItemModelWidgetState();
  }

  static Widget getIt(
      BuildContext context,
      AppModel app,
      bool create,
      double widgetWidth,
      double widgetHeight,
      DocumentItemModel documentItemModel,
      DocumentItemModelCallback documentItemModelCallback,
      int containerPrivilege) {
    var copyOf = documentItemModel.copyWith();
    return DocumentItemModelWidget._(
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

class _DocumentItemModelWidgetState extends State<DocumentItemModelWidget> {
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
                    widget.app, context, widget.documentItemModel.documentID)),
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.documentItemModel.reference,
                  valueChanged: (value) {
                    widget.documentItemModel.reference = value;
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    labelText: 'Image Reference',
                    hintText:
                        'Image Reference which can be used from your document',
                  ),
                )),
          ]),
      if (widget.documentItemModel.image != null)
        PlatformMediumWidget(
            app: widget.app,
            platformMediumModel: widget.documentItemModel.image!)
    ]);
  }
}
