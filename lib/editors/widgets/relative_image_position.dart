import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_pkg_fundamentals_model/model/section_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef RelativeImagePositionCallback = Function(
    RelativeImagePosition relativeImagePosition);

class RelativeImagePositionWidget extends StatefulWidget {
  final RelativeImagePositionCallback relativeImagePositionCallback;
  final RelativeImagePosition relativeImagePosition;
  final AppModel app;
  RelativeImagePositionWidget(
      {super.key,
      required this.app,
      required this.relativeImagePositionCallback,
      required this.relativeImagePosition});

  @override
  State<StatefulWidget> createState() {
    return _RelativeImagePositionWidgetState();
  }
}

class _RelativeImagePositionWidgetState
    extends State<RelativeImagePositionWidget> {
  int? _heightTypeSelectedRadioTile;

  @override
  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.relativeImagePosition.index;
  }

  String heighttTypeLandscapeStringValue(
      RelativeImagePosition? relativeImagePosition) {
    switch (relativeImagePosition) {
      case RelativeImagePosition.behind:
        return 'Behind';
      case RelativeImagePosition.inFront:
        return 'In front';
      case RelativeImagePosition.below:
        return 'Below';
      case RelativeImagePosition.above:
        return 'Above';
      case RelativeImagePosition.aside:
        return 'Aside';
      case RelativeImagePosition.unknown:
        break;
      case null:
        break;
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.relativeImagePositionCallback(toRelativeImagePosition(val));
    });
  }

  Widget getPrivilegeOption(RelativeImagePosition? relativeImagePosition) {
    if (relativeImagePosition == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(relativeImagePosition);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            relativeImagePosition.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
            (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(RelativeImagePosition.behind),
      getPrivilegeOption(RelativeImagePosition.inFront),
      getPrivilegeOption(RelativeImagePosition.below),
      getPrivilegeOption(RelativeImagePosition.above),
      getPrivilegeOption(RelativeImagePosition.aside),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
