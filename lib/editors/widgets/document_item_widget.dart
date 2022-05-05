import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/decoration/decoration.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/app_policy_item_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core/tools/storage/public_medium_helper.dart';
import 'package:eliud_core/tools/widgets/condition_simple_widget.dart';
import 'package:eliud_core/tools/widgets/editor/select_action_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_core/tools/widgets/member_medium_widget.dart';
import 'package:eliud_core/tools/widgets/platform_medium_widget.dart';
import 'package:eliud_core/tools/widgets/pos_size_widget.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef void DocumentItemModelCallback(DocumentItemModel documentItemModel);

class DocumentItemModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  final DocumentItemModel documentItemModel;
  final DocumentItemModelCallback documentItemModelCallback;
  final int containerPrivilege;

  DocumentItemModelWidget._({
    Key? key,
    required this.app,
    required this.create,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.documentItemModel,
    required this.documentItemModelCallback,
    required this.containerPrivilege,
  }) : super(key: key);

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
                    widget.app, context, widget.documentItemModel.documentID!)),
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
                    hintText: 'Image Reference which can be used from your document',
                  ),
                )),
          ]),
      if (widget.documentItemModel.image != null) PlatformMediumWidget(app: widget.app, platformMediumModel: widget.documentItemModel.image!)
    ]);
  }
}
