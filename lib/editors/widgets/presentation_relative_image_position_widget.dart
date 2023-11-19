import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/has_list_tile.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef PresentationRelativeImagePositionCallback = Function(
    PresentationRelativeImagePosition presentationRelativeImagePosition);

class PresentationRelativeImagePositionWidget extends StatefulWidget {
  final PresentationRelativeImagePositionCallback
      presentationRelativeImagePositionCallback;
  final PresentationRelativeImagePosition presentationRelativeImagePosition;
  final AppModel app;
  PresentationRelativeImagePositionWidget(
      {super.key,
      required this.app,
      required this.presentationRelativeImagePositionCallback,
      required this.presentationRelativeImagePosition});

  @override
  State<StatefulWidget> createState() {
    return _PresentationRelativeImagePositionWidgetState();
  }
}

class _PresentationRelativeImagePositionWidgetState
    extends State<PresentationRelativeImagePositionWidget> {
  int? _heightTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile =
        widget.presentationRelativeImagePosition.index;
  }

  String heighttTypeLandscapeStringValue(
      PresentationRelativeImagePosition? presentationRelativeImagePosition) {
    switch (presentationRelativeImagePosition) {
      case PresentationRelativeImagePosition.behind:
        return 'Behind';
      case PresentationRelativeImagePosition.inFront:
        return 'In front';
      case PresentationRelativeImagePosition.below:
        return 'Behind';
      case PresentationRelativeImagePosition.above:
        return 'Above';
      case PresentationRelativeImagePosition.aside:
        return 'Aside';
      case PresentationRelativeImagePosition.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.presentationRelativeImagePositionCallback(
          toPresentationRelativeImagePosition(val));
    });
  }

  Widget getPrivilegeOption(
      PresentationRelativeImagePosition? presentationRelativeImagePosition) {
    if (presentationRelativeImagePosition == null) return Text("?");
    var stringValue =
        heighttTypeLandscapeStringValue(presentationRelativeImagePosition);
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
      getPrivilegeOption(PresentationRelativeImagePosition.behind),
      getPrivilegeOption(PresentationRelativeImagePosition.inFront),
      getPrivilegeOption(PresentationRelativeImagePosition.below),
      getPrivilegeOption(PresentationRelativeImagePosition.above),
      getPrivilegeOption(PresentationRelativeImagePosition.aside),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
