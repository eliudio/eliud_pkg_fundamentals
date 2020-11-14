import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/app/app_bloc.dart';
import 'package:eliud_core/core/tools/document_processor.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' as wv;
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:eliud_pkg_fundamentals/tools/document_processor_extended.dart';

/*
class ActionListener implements ClickListener {
  final BuildContext context;

  ActionListener(this.context);

  @override
  void onClicked(String event) {
    // todo: work with substring, as url.parse seems to discard case sensitivity
    Uri uri = Uri.parse(event);
    String authority = uri.authority;
    String scheme = uri.scheme;
    if (scheme == "page") {
      // todo, check if access rights to this page, if not... show "???!!!"
      ActionModel action = GotoPage(pageID: authority); // construct from event
      EliudRouter.Router.navigateTo(context, action);
    }
  }
}
*/
class DocumentRendererTool {
  Widget _webViewRendererNotWeb(
      BuildContext context, String processedDocument) {
    debugPrint('DocumentRendererTool::_webViewRendererNotWeb()');
    return LimitedBox(
        // maxHeight: 2000,
        child: wv.WebView(
      gestureRecognizers: Set()
        ..add(
          Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer(),
          ),
        ),
      gestureNavigationEnabled: true,
      initialUrl:
          Uri.dataFromString(processedDocument, mimeType: 'text/document')
              .toString(),
    ));
  }

  Widget _flutterDocument(BuildContext context, String processedDocument) {
    debugPrint('DocumentRendererTool::_flutterDocument()');
    try {
      return Html(
        data: processedDocument,
        onLinkTap: (url) {
          // open url in a webview
        },
        onImageTap: (src) {
          // Display the image in large form.
        },
      );
    } catch (_) {
      return null;
    }
  }

  Widget _flutterWidgetFromDocumentNotWeb(
      BuildContext context, String processedDocument) {
    debugPrint('DocumentRendererTool::_flutterWidgetFromDocumentNotWeb()');
    try {
      return HtmlWidget(
        processedDocument,
        webView: true,
      );
    } catch (_) {
      return null;
    }
  }

  Widget _flutterMarkdownDocument(
      BuildContext context, String processedDocument) {
    debugPrint('DocumentRendererTool::_flutterMarkdownDocument()');
    return MarkdownBody(
      selectable: true,
      data: processedDocument,
//        imageDirectory: value.imageDirectory,
    );
  }

/*
  Future<Widget> _buildWidget(BuildContext context, String jsonString) async {
    return DynamicWidgetBuilder()
        .build(jsonString, context, new ActionListener(context));
  }
*/
  Future<Widget> _buildWidget(BuildContext context, String jsonString) async {
    return Text('dynamic_widget not supported. ' + jsonString);
  }

  Widget _dynamicWidget(BuildContext context, String processedDocument) {
    return FutureBuilder<Widget>(
      future: _buildWidget(context, processedDocument),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return snapshot.hasData
            ? snapshot.data
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _rendered(BuildContext context, DocumentRenderer documentRenderer,
      String renderThis) {
    Widget theWidget;
    switch (documentRenderer) {
      case DocumentRenderer.webview_flutter_no_list_not_web:
        theWidget = _webViewRendererNotWeb(context, renderThis);
        break;
      case DocumentRenderer.flutter_html:
        theWidget = _flutterDocument(context, renderThis);
        break;
      case DocumentRenderer.flutter_widget_from_html_not_web:
        theWidget = _flutterWidgetFromDocumentNotWeb(context, renderThis);
        break;
      case DocumentRenderer.flutter_markdown:
        theWidget = _flutterMarkdownDocument(context, renderThis);
        break;
      case DocumentRenderer.dynamic_widget:
        theWidget = _dynamicWidget(context, renderThis);
        break;
      case DocumentRenderer.Unknown:
        break;
    }
    if (theWidget == null) {
      debugPrint('DocumentRendererTool widget is null, fallback scenario');
      theWidget = _flutterDocument(context, renderThis);
    }
    return theWidget;
  }

  Widget render(
      BuildContext context,
      DocumentRenderer documentRenderer,
      String document,
      List<DocumentItemModel> images,
      BackgroundModel bdm) {
    var accessState = AccessBloc.getState(context);
    var appState = AppBloc.getState(context);
    DocumentParameterProcessor documentParameterProcessor = ExtendedDocumentParameterProcessor(context, accessState, appState, images: images);
    return Container(
        child: _rendered(context, documentRenderer, documentParameterProcessor.process(document)),
        decoration: BoxDecorationHelper.boxDecoration(accessState, bdm));
  }
}
