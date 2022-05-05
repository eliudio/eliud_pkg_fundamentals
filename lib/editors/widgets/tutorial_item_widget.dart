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
import 'package:eliud_core/tools/widgets/editor/select_action_widget.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_core/tools/widgets/platform_medium_widget.dart';
import 'package:eliud_core/tools/widgets/pos_size_widget.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef void TutorialEntryModelCallback(TutorialEntryModel tutorialEntryModel);

class TutorialEntryModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  final TutorialEntryModel tutorialEntryModel;
  final TutorialEntryModelCallback tutorialEntryModelCallback;

  TutorialEntryModelWidget._({
    Key? key,
    required this.app,
    required this.create,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.tutorialEntryModel,
    required this.tutorialEntryModelCallback,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TutorialEntryModelWidgetState();
  }

  static Widget getIt(
      BuildContext context,
      AppModel app,
      bool create,
      double widgetWidth,
      double widgetHeight,
      TutorialEntryModel tutorialEntryModel,
      TutorialEntryModelCallback tutorialEntryModelCallback) {
    var copyOf = tutorialEntryModel.copyWith();
    return TutorialEntryModelWidget._(
      app: app,
      create: create,
      widgetWidth: widgetWidth,
      widgetHeight: widgetHeight,
      tutorialEntryModel: copyOf,
      tutorialEntryModelCallback: tutorialEntryModelCallback,
    );
  }
}

class _TutorialEntryModelWidgetState extends State<TutorialEntryModelWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      HeaderWidget(
        app: widget.app,
        cancelAction: () async {
          return true;
        },
        okAction: () async {
          widget.tutorialEntryModelCallback(widget.tutorialEntryModel);
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
                    widget.app, context, widget.tutorialEntryModel.documentID!)),
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.tutorialEntryModel.description,
                  valueChanged: (value) {
                    widget.tutorialEntryModel.description = value;
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    labelText: 'Description',
                  ),
                )),
          ]),
      topicContainer(widget.app, context,
          title: 'Code',
          collapsible: true,
          collapsed: true,
          children: [
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.tutorialEntryModel.code,
                  valueChanged: (value) {
                    widget.tutorialEntryModel.code = value;
                  },
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Code',
                    labelText: 'Code',
                  ),
                )),
          ]),
      if (widget.tutorialEntryModel.image != null) PlatformMediumWidget(app: widget.app, platformMediumModel: widget.tutorialEntryModel.image!)
    ]);
  }
}
