import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef PresentationImageAlignmentCallback = Function(
    PresentationImageAlignment presentationImageAlignment);

class PresentationImageAlignmentWidget extends StatefulWidget {
  PresentationImageAlignmentCallback presentationImageAlignmentCallback;
  final PresentationImageAlignment presentationImageAlignment;
  final AppModel app;
  PresentationImageAlignmentWidget(
      {Key? key,
        required this.app,
        required this.presentationImageAlignmentCallback,
        required this.presentationImageAlignment})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PresentationImageAlignmentWidgetState();
  }
}

class _PresentationImageAlignmentWidgetState extends State<PresentationImageAlignmentWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.presentationImageAlignment.index;
  }

  String heighttTypeLandscapeStringValue(PresentationImageAlignment? presentationImageAlignment) {
    switch (presentationImageAlignment) {
      case PresentationImageAlignment.Right:
        return 'Right';
      case PresentationImageAlignment.Left:
        return 'Left';
      case PresentationImageAlignment.Center:
        return 'Center';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.presentationImageAlignmentCallback(toPresentationImageAlignment(val));
    });
  }

  Widget getPrivilegeOption(PresentationImageAlignment? presentationImageAlignment) {
    if (presentationImageAlignment == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(presentationImageAlignment);
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
      getPrivilegeOption(PresentationImageAlignment.Left),
      getPrivilegeOption(PresentationImageAlignment.Center),
      getPrivilegeOption(PresentationImageAlignment.Right),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
