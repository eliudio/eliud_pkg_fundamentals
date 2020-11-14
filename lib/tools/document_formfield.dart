import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/app/app_bloc.dart';
import 'package:eliud_core/core/app/app_state.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eliud_pkg_fundamentals/tools/document_renderer.dart';

typedef DocumentTextFieldTrigger(String value);

class DocumentTextField extends StatefulWidget {
  final String label;
  final DocumentRenderer documentRenderer;
  String documentValue;
  final List<DocumentItemModel> images;
  final DocumentTextFieldTrigger trigger;
  final BackgroundModel bdm;

  DocumentTextField(this.label, this.documentRenderer, this.documentValue,
      this.images, this.bdm, this.trigger);

  @override
  DocumentTextFieldState createState() {
    return DocumentTextFieldState();
  }
}

class DocumentTextFieldState extends State<DocumentTextField> {
  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appState = AppBloc.getState(context);
    return _buildExcludeDocument(appState, accessState, context);
  }

  Widget _buildExcludeDocument(
      AppState appState, AccessState accessState, BuildContext context) {
    var app = AppBloc.app(context);
    return RaisedButton.icon(
        onPressed: () => _fullScreen(appState),
        icon: Icon(Icons.fullscreen),
        label: Text(widget.label,
            style: TextStyle(
                color: RgbHelper.color(rgbo: app.formSubmitButtonTextColor))),
        color: RgbHelper.color(rgbo: app.formSubmitButtonColor));
  }

  // Not used at the moment, but is a candidate
  Widget _buildIncludeDocument(
      AppState appState, AccessState accessState, BuildContext context) {
    var width = fullScreenWidth(context);
    var height = fullScreenHeight(context);
    var fullWidth = (width < height ? width : height) - 56;

    return Builder(
        builder: (context) => Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                child: SizedBox(
                                    width: fullWidth,
                                    child: RaisedButton.icon(
                                        onPressed: () => _fullScreen(appState),
                                        icon: Icon(Icons.fullscreen),
                                        label: Text(widget.label),
                                        color: appState is AppLoaded
                                            ? RgbHelper.color(
                                                rgbo: appState
                                                    .app.formSubmitButtonColor)
                                            : null))))
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                child: SizedBox(
                                    width: fullWidth,
                                    height: 250,
                                    child: DocumentRendererTool().render(
                                        context,
                                        widget.documentRenderer,
                                        widget.documentValue,
                                        widget.images,
                                        widget.bdm))))
                      ])
                ])));
  }

  void _fullScreen(AppState appState) async {
    if (appState is AppLoaded) {
      Navigator.of(context).push(pageRouteBuilder(appState.app,
          page: DocumentTextFieldFullScreen(
              widget.label,
              widget.documentRenderer,
              widget.documentValue,
              widget.images,
              widget.bdm,
              _onChange)));
    }
  }

  void _onChange(val) {
    widget.trigger(val);
    setState(() {
      widget.documentValue = val;
    });
  }
}

class DocumentTextFieldFullScreen extends StatefulWidget {
  final String label;
  final DocumentRenderer documentRenderer;
  final String documentValue;
  final List<DocumentItemModel> images;
  final BackgroundModel bdm;
  final DocumentTextFieldTrigger trigger;

  DocumentTextFieldFullScreen(this.label, this.documentRenderer,
      this.documentValue, this.images, this.bdm, this.trigger);

  @override
  createState() {
    return DocumentTextFieldFullScreenState();
  }
}

class DocumentTextFieldFullScreenState
    extends State<DocumentTextFieldFullScreen> {
  String value;

  @override
  void initState() {
    value = widget.documentValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appState = AppBloc.getState(context);
    return tabs(appState, accessState);
  }

  Widget _document() {
    Widget w = DocumentRendererTool().render(
        context, widget.documentRenderer, value, widget.images, widget.bdm);
    if ((widget.documentRenderer ==
            DocumentRenderer.webview_flutter_no_list_not_web) ||
        (widget.documentRenderer == DocumentRenderer.dynamic_widget)) return w;
    return ListView(children: <Widget>[w]);
  }

  Widget tabs(AppState appState, AccessState accessState) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                flexibleSpace: appState is AppLoaded
                    ? Container(
                        decoration: BoxDecorationHelper.boxDecoration(
                            accessState, appState.app.formAppBarBackground))
                    : null,
                title: Text(widget.label),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                        icon: Icon(Icons.create,
                            color: appState is AppLoaded
                                ? RgbHelper.color(
                                    rgbo: appState.app.formFieldHeaderColor)
                                : null)),
                    Tab(
                        icon: Icon(Icons.remove_red_eye,
                            color: appState is AppLoaded
                                ? RgbHelper.color(
                                    rgbo: appState.app.formFieldHeaderColor)
                                : null)),
                  ],
                )),
            body: TabBarView(
              children: <Widget>[
                TextFormField(
                  readOnly: !accessState.memberIsOwner(appState),
                  style: appState is AppLoaded
                      ? TextStyle(
                          color: RgbHelper.color(
                              rgbo: appState.app.formFieldTextColor))
                      : null,
                  initialValue: value,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                  ),
                  onChanged: _onChanged,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autovalidate: true,
                ),
                _document()
              ],
            ),
          ),
        ));
  }

  void _onChanged(val) {
    widget.trigger(val);
    setState(() {
      value = val;
    });
  }
}
