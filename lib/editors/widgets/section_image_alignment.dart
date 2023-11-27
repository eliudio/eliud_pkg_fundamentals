import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_pkg_fundamentals_model/model/section_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef SectionImageAlignmentCallback = Function(
    SectionImageAlignment sectionImageAlignment);

class SectionImageAlignmentWidget extends StatefulWidget {
  final SectionImageAlignmentCallback sectionImageAlignmentCallback;
  final SectionImageAlignment sectionImageAlignment;
  final AppModel app;
  SectionImageAlignmentWidget(
      {super.key,
      required this.app,
      required this.sectionImageAlignmentCallback,
      required this.sectionImageAlignment});

  @override
  State<StatefulWidget> createState() {
    return _SectionImageAlignmentWidgetState();
  }
}

class _SectionImageAlignmentWidgetState
    extends State<SectionImageAlignmentWidget> {
  int? _heightTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.sectionImageAlignment.index;
  }

  String heighttTypeLandscapeStringValue(
      SectionImageAlignment? sectionImageAlignment) {
    switch (sectionImageAlignment) {
      case SectionImageAlignment.center:
        return 'Center';
      case SectionImageAlignment.left:
        return 'Left';
      case SectionImageAlignment.right:
        return 'Right';
      case SectionImageAlignment.unknown:
        break;
      case null:
        break;
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
      getPrivilegeOption(SectionImageAlignment.right),
      getPrivilegeOption(SectionImageAlignment.left),
      getPrivilegeOption(SectionImageAlignment.center),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
