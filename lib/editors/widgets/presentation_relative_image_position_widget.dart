import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef PresentationRelativeImagePositionCallback = Function(
    PresentationRelativeImagePosition presentationRelativeImagePosition);

class PresentationRelativeImagePositionWidget extends StatefulWidget {
  PresentationRelativeImagePositionCallback presentationRelativeImagePositionCallback;
  final PresentationRelativeImagePosition presentationRelativeImagePosition;
  final AppModel app;
  PresentationRelativeImagePositionWidget(
      {Key? key,
        required this.app,
        required this.presentationRelativeImagePositionCallback,
        required this.presentationRelativeImagePosition})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PresentationRelativeImagePositionWidgetState();
  }
}

class _PresentationRelativeImagePositionWidgetState extends State<PresentationRelativeImagePositionWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.presentationRelativeImagePosition.index;
  }

  String heighttTypeLandscapeStringValue(PresentationRelativeImagePosition? presentationRelativeImagePosition) {
    switch (presentationRelativeImagePosition) {
      case PresentationRelativeImagePosition.Behind:
        return 'Behind';
      case PresentationRelativeImagePosition.InFront:
        return 'In front';
      case PresentationRelativeImagePosition.Below:
        return 'Behind';
      case PresentationRelativeImagePosition.Above:
          return 'Above';
      case PresentationRelativeImagePosition.Aside:
          return 'Aside';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.presentationRelativeImagePositionCallback(toPresentationRelativeImagePosition(val));
    });
  }

  Widget getPrivilegeOption(PresentationRelativeImagePosition? presentationRelativeImagePosition) {
    if (presentationRelativeImagePosition == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(presentationRelativeImagePosition);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            presentationRelativeImagePosition.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
                (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(PresentationRelativeImagePosition.Behind),
      getPrivilegeOption(PresentationRelativeImagePosition.InFront),
      getPrivilegeOption(PresentationRelativeImagePosition.Below),
      getPrivilegeOption(PresentationRelativeImagePosition.Above),
      getPrivilegeOption(PresentationRelativeImagePosition.Aside),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
