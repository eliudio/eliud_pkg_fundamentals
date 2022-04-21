import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/extensiontype_formfield.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';
import 'package:eliud_pkg_medium/wizards/widgets/photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef void SectionModelCallback(
    SectionModel labelledSectionModel);

class SectionModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  final SectionModel labelledSectionModel;
  final SectionModelCallback labelledSectionModelCallback;
  final int containerPrivilege;

  SectionModelWidget._({
    Key? key,
    required this.app,
    required this.create,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.labelledSectionModel,
    required this.labelledSectionModelCallback,
    required this.containerPrivilege,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SectionModelWidgetState();
  }

  static Widget getIt(
      BuildContext context,
      AppModel app,
      bool create,
      double widgetWidth,
      double widgetHeight,
      SectionModel labelledSectionModel,
      SectionModelCallback labelledSectionModelCallback,
      int containerPrivilege) {
    var copyOf = labelledSectionModel.copyWith();
    return SectionModelWidget._(
      app: app,
      create: create,
      widgetWidth: widgetWidth,
      widgetHeight: widgetHeight,
      labelledSectionModel: copyOf,
      labelledSectionModelCallback: labelledSectionModelCallback,
      containerPrivilege: containerPrivilege,
    );
  }
}

class _SectionModelWidgetState
    extends State<SectionModelWidget> {
  int? currentPrivilegeLevel;

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      HeaderWidget(
        app: widget.app,
        cancelAction: () async {
          return true;
        },
        okAction: () async {
          widget.labelledSectionModelCallback(
              widget.labelledSectionModel);
          return true;
        },
        title: 'Section',
      ),
      divider(widget.app, context),
      topicContainer(widget.app, context,
          title: 'General',
          collapsible: true,
          collapsed: true,
          children: [
            getListTile(context, widget.app,
                leading: Icon(Icons.vpn_key),
                title: text(widget.app, context,
                    widget.labelledSectionModel.documentID!)),
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.labelledSectionModel.title,
                  valueChanged: (value) {
                    widget.labelledSectionModel.title = value;
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    labelText: 'Title',
                  ),
                )),
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.labelledSectionModel.description,
                  valueChanged: (value) {
                    widget.labelledSectionModel.description = value;
                  },
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    labelText: 'Description',
                  ),
                )),
          ]),
      PlatformPhotoWidget(
        title: 'Select Image',
        feedbackFunction: (mediumModel) {
          setState(() {
            widget.labelledSectionModel.image = mediumModel;
          });
        },
        app: widget.app,
        initialImage: widget.labelledSectionModel.image,
      ),
    ]);
  }
}
