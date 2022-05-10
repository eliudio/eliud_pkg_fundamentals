//import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/navigate/router.dart' as EliudRouter;
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:eliud_pkg_fundamentals/tools/document_processor_extended.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart' as wv;
import 'package:flutter_markdown/flutter_markdown.dart';

class ActionListener /*implements ClickListener*/ {
  final BuildContext context;
  final AppModel app;

  ActionListener(this.context, this.app);

  void onClicked(String event) {
      // todo: work with substring, as url.parse seems to discard case sensitivity
      var uri = Uri.parse(event);
      var authority = uri.authority;
      var scheme = uri.scheme;
      if (scheme == "page") {
        // todo, check if access rights to this page, if not... show "???!!!"
        ActionModel action = GotoPage(app, pageID: authority); // construct from event
        EliudRouter.Router.navigateTo(context, action);
      }
    }
}

class DocumentRendererTool {
  Widget _flutterMarkdownDocument(
      BuildContext context, String processedDocument) {
    debugPrint('DocumentRendererTool::_flutterMarkdownDocument()');
    return MarkdownBody(
      selectable: true,
      data: processedDocument,
    );
  }

  Future<Widget> _buildWidget(BuildContext context, String jsonString) async {
    return Text("This DynamicWidgetBuilder thing is not maintained");

  }

  Widget _dynamicWidget(AppModel app, BuildContext context, String processedDocument) {
    return FutureBuilder<Widget>(
      future: _buildWidget(context, processedDocument),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return snapshot.hasData
            ? snapshot.data!
            : progressIndicator(app, context);
      },
    );
  }

  Widget _rendered(AppModel app, BuildContext context, DocumentRenderer? documentRenderer,
      String renderThis) {
    Widget? theWidget;
    switch (documentRenderer) {
      case DocumentRenderer.flutter_markdown:
        theWidget = _flutterMarkdownDocument(context, renderThis);
        break;
      case DocumentRenderer.dynamic_widget:
        theWidget = _dynamicWidget(app, context, renderThis);
        break;
      case DocumentRenderer.Unknown:
        break;
    }
    if (theWidget == null) {
      debugPrint('DocumentRendererTool widget is null, fallback scenario');
      theWidget = _flutterMarkdownDocument(context, renderThis);
    }
    return theWidget;
  }

  Widget render(AppModel app, BuildContext context, MemberModel? memberModel, DocumentRenderer? documentRenderer,
      String document, List<DocumentItemModel>? images, BackgroundModel? bdm) {
    DocumentParameterProcessor documentParameterProcessor =
        ExtendedDocumentParameterProcessor(context,app,
            images: images);
    return Container(
        clipBehavior: (bdm == null) ? Clip.none : Clip.hardEdge,
        child: _rendered(app, context, documentRenderer,
            documentParameterProcessor.process(document)),
        decoration: BoxDecorationHelper.boxDecoration(app, memberModel, bdm));
  }
}
