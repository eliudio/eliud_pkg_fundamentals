import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef SectionImageAlignmentCallback = Function(
    SectionImageAlignment sectionImageAlignment);

class SectionImageAlignmentWidget extends StatefulWidget {
  SectionImageAlignmentCallback sectionImageAlignmentCallback;
  final SectionImageAlignment sectionImageAlignment;
  final AppModel app;
  SectionImageAlignmentWidget(
      {Key? key,
        required this.app,
        required this.sectionImageAlignmentCallback,
        required this.sectionImageAlignment})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SectionImageAlignmentWidgetState();
  }
}

class _SectionImageAlignmentWidgetState extends State<SectionImageAlignmentWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.sectionImageAlignment.index;
  }

  String heighttTypeLandscapeStringValue(SectionImageAlignment? sectionImageAlignment) {
    switch (sectionImageAlignment) {
      case SectionImageAlignment.Center:
        return 'Center';
      case SectionImageAlignment.Left:
        return 'Left';
      case SectionImageAlignment.Right:
        return 'Right';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.sectionImageAlignmentCallback(toSectionImageAlignment(val));
    });
  }

  Widget getPrivilegeOption(SectionImageAlignment? sectionImageAlignment) {
    if (sectionImageAlignment == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(sectionImageAlignment);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            sectionImageAlignment.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
                (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(SectionImageAlignment.Right),
      getPrivilegeOption(SectionImageAlignment.Left),
      getPrivilegeOption(SectionImageAlignment.Center),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
