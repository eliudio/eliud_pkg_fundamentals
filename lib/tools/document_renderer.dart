//import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:eliud_core/core/navigate/router.dart' as EliudRouter;
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals/tools/document_processor_extended.dart';
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

  Widget _rendered(AppModel app, BuildContext context,
      String renderThis) {
    return _flutterMarkdownDocument(context, renderThis);
  }

  Widget render(AppModel app, BuildContext context, MemberModel? memberModel,
      String document, List<DocumentItemModel>? images, BackgroundModel? bdm) {
    DocumentParameterProcessor documentParameterProcessor =
        ExtendedDocumentParameterProcessor(context,app,
            images: images);
    return Container(
        clipBehavior: BoxDecorationHelper.determineClipBehaviour(app, memberModel, bdm),
        child: _rendered(app, context,
            documentParameterProcessor.process(document)),
        margin: BoxDecorationHelper.determineMargin(app, memberModel, bdm),
        padding: BoxDecorationHelper.determinePadding(app, memberModel, bdm),
        decoration: BoxDecorationHelper.boxDecoration(app, memberModel, bdm));
  }
}
