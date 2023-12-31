import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core/core/widgets/helper_widgets/header_widget.dart';
import 'package:eliud_core/core/widgets/helper_widgets/platform_medium_widget.dart';
import 'package:eliud_pkg_fundamentals_model/model/tutorial_entry_model.dart';
import 'package:flutter/material.dart';

typedef TutorialEntryModelCallback = void Function(
    TutorialEntryModel tutorialEntryModel);

class TutorialEntryModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  final TutorialEntryModel tutorialEntryModel;
  final TutorialEntryModelCallback tutorialEntryModelCallback;

  TutorialEntryModelWidget._({
    required this.app,
    required this.create,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.tutorialEntryModel,
    required this.tutorialEntryModelCallback,
  });

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
                    widget.app, context, widget.tutorialEntryModel.documentID)),
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
      if (widget.tutorialEntryModel.image != null)
        PlatformMediumWidget(
            app: widget.app,
            platformMediumModel: widget.tutorialEntryModel.image!)
    ]);
  }
}
