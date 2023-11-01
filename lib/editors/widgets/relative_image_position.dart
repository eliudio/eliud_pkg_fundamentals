import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef RelativeImagePositionCallback = Function(
    RelativeImagePosition relativeImagePosition);

class RelativeImagePositionWidget extends StatefulWidget {
  RelativeImagePositionCallback relativeImagePositionCallback;
  final RelativeImagePosition relativeImagePosition;
  final AppModel app;
  RelativeImagePositionWidget(
      {Key? key,
        required this.app,
        required this.relativeImagePositionCallback,
        required this.relativeImagePosition})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RelativeImagePositionWidgetState();
  }
}

class _RelativeImagePositionWidgetState extends State<RelativeImagePositionWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.relativeImagePosition.index;
  }

  String heighttTypeLandscapeStringValue(RelativeImagePosition? relativeImagePosition) {
    switch (relativeImagePosition) {
      case RelativeImagePosition.Behind:
        return 'Behind';
      case RelativeImagePosition.InFront:
        return 'In front';
      case RelativeImagePosition.Below:
        return 'Below';
      case RelativeImagePosition.Above:
        return 'Above';
      case RelativeImagePosition.Aside:
        return 'Aside';
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
      getPrivilegeOption(RelativeImagePosition.Behind),
      getPrivilegeOption(RelativeImagePosition.InFront),
      getPrivilegeOption(RelativeImagePosition.Below),
      getPrivilegeOption(RelativeImagePosition.Above),
      getPrivilegeOption(RelativeImagePosition.Aside),
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
