import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef PresentationImageAlignmentCallback = Function(
    PresentationImageAlignment presentationImageAlignment);

class PresentationImageAlignmentWidget extends StatefulWidget {
  final PresentationImageAlignmentCallback presentationImageAlignmentCallback;
  final PresentationImageAlignment presentationImageAlignment;
  final AppModel app;
  PresentationImageAlignmentWidget(
      {super.key,
      required this.app,
      required this.presentationImageAlignmentCallback,
      required this.presentationImageAlignment});

  @override
  State<StatefulWidget> createState() {
    return _PresentationImageAlignmentWidgetState();
  }
}

class _PresentationImageAlignmentWidgetState
    extends State<PresentationImageAlignmentWidget> {
  int? _heightTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.presentationImageAlignment.index;
  }

  String heighttTypeLandscapeStringValue(
      PresentationImageAlignment? presentationImageAlignment) {
    switch (presentationImageAlignment) {
      case PresentationImageAlignment.right:
        return 'Right';
      case PresentationImageAlignment.left:
        return 'Left';
      case PresentationImageAlignment.center:
        return 'Center';
      case PresentationImageAlignment.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.presentationImageAlignmentCallback(
          toPresentationImageAlignment(val));
    });
  }

  Widget getPrivilegeOption(
      PresentationImageAlignment? presentationImageAlignment) {
    if (presentationImageAlignment == null) return Text("?");
    var stringValue =
        heighttTypeLandscapeStringValue(presentationImageAlignment);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            presentationImageAlignment.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(PresentationImageAlignment.left),
      getPrivilegeOption(PresentationImageAlignment.center),
      getPrivilegeOption(PresentationImageAlignment.right),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
