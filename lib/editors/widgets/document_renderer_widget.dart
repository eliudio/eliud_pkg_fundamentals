import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef DocumentRendererCallback = Function(
    DocumentRenderer documentRenderer);

class DocumentRendererWidget extends StatefulWidget {
  DocumentRendererCallback documentRendererCallback;
  final DocumentRenderer documentRenderer;
  final AppModel app;
  DocumentRendererWidget(
      {Key? key,
        required this.app,
        required this.documentRendererCallback,
        required this.documentRenderer})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DocumentRendererWidgetState();
  }
}

class _DocumentRendererWidgetState extends State<DocumentRendererWidget> {
  int? _heightTypeSelectedRadioTile;

  void initState() {
    super.initState();
    _heightTypeSelectedRadioTile = widget.documentRenderer.index;
  }

  String heighttTypeLandscapeStringValue(DocumentRenderer? documentRenderer) {
    switch (documentRenderer) {
      case DocumentRenderer.flutter_markdown:
        return 'Flutter markdown';
      case DocumentRenderer.dynamic_widget:
        return 'Dynamic widget';
    }
    return '?';
  }

  void setSelection(int? val) {
    setState(() {
      _heightTypeSelectedRadioTile = val;
      widget.documentRendererCallback(toDocumentRenderer(val));
    });
  }

  Widget getPrivilegeOption(DocumentRenderer? documentRenderer) {
    if (documentRenderer == null) return Text("?");
    var stringValue = heighttTypeLandscapeStringValue(documentRenderer);
    return Center(
        child: radioListTile(
            widget.app,
            context,
            documentRenderer.index,
            _heightTypeSelectedRadioTile,
            stringValue,
            null,
                (dynamic val) => setSelection(val)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      getPrivilegeOption(DocumentRenderer.flutter_markdown),
      getPrivilegeOption(DocumentRenderer.dynamic_widget)
    ], shrinkWrap: true, physics: ScrollPhysics());
  }
}
