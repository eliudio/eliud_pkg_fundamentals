import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'document_renderer.dart';


typedef DocumentTextFieldTrigger(String value);

class DocumentTextField extends StatefulWidget {
  final String label;
  final DocumentRenderer documentRenderer;
  String documentValue;
  final List<DocumentItemModel> images;
  final DocumentTextFieldTrigger trigger;
  final BackgroundModel bdm;

  DocumentTextField(
      this.label, this.documentRenderer, this.documentValue, this.images, this.bdm, this.trigger);

  @override
  DocumentTextFieldState createState() {
    return DocumentTextFieldState();
  }
}

class DocumentTextFieldState extends State<DocumentTextField> {
  @override
  Widget build(BuildContext context) {
    return _buildExcludeDocument(context);
  }

  Widget _buildExcludeDocument(BuildContext context) {
    return RaisedButton.icon(
        onPressed: _fullScreen,
        icon: Icon(Icons.fullscreen),
        label: Text(widget.label,
            style: TextStyle(
                color: RgbHelper.color(
                    rgbo: GlobalData.app().formSubmitButtonTextColor))),
        color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor));
  }

  // Not used at the moment, but is a candidate
  Widget _buildIncludeDocument(BuildContext context) {
    double width = fullScreenWidth(context);
    double height = fullScreenHeight(context);

    double fullWidth = (width < height ? width : height) - 56;

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
                                child: new SizedBox(
                                    width: fullWidth,
                                    child: RaisedButton.icon(
                                        onPressed: _fullScreen,
                                        icon: Icon(Icons.fullscreen),
                                        label: Text(widget.label),
                                        color: RgbHelper.color(
                                            rgbo: GlobalData.app().formSubmitButtonColor)))))
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                child: new SizedBox(
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

  void _fullScreen() async {
    Navigator.of(context).push(pageRouteBuilder(page: DocumentTextFieldFullScreen(widget.label,
            widget.documentRenderer, widget.documentValue, widget.images, widget.bdm, _onChange)));
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

  DocumentTextFieldFullScreen(
      this.label, this.documentRenderer, this.documentValue, this.images, this.bdm, this.trigger);

  @override
  createState() {
    return new DocumentTextFieldFullScreenState();
  }
}

class DocumentTextFieldFullScreenState extends State<DocumentTextFieldFullScreen> {
  String value;

  @override
  void initState() {
    value = widget.documentValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return tabs();
  }

  Widget _document() {
    Widget w = DocumentRendererTool()
        .render(context, widget.documentRenderer, value, widget.images, widget.bdm);
    if ((widget.documentRenderer == DocumentRenderer.webview_flutter_no_list_not_web) || (widget.documentRenderer == DocumentRenderer.dynamic_widget)) return w;
    return new ListView(children: <Widget>[w]);
  }

  Widget tabs() {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
      length: 2,
      child: new Scaffold(

/*
        backgroundColor:
            RgbHelper.color(rgbo: GlobalData.app().formAppBarBackgroundColor),
*/
        appBar: AppBar(
            automaticallyImplyLeading: true,
            flexibleSpace: Container(
                decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
            title: Text(widget.label),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                    icon: new Icon(Icons.create,
                        color: RgbHelper.color(
                            rgbo: GlobalData.app().formFieldHeaderColor))),
//                        color: Colors.black)),
                Tab(
                    icon: new Icon(Icons.remove_red_eye,
                        color: RgbHelper.color(
                            rgbo: GlobalData.app().formFieldHeaderColor))),
//                        color: Colors.black)),
              ],
            )),
        body: new TabBarView(
          children: <Widget>[
            new TextFormField(
              readOnly: !GlobalData.memberIsOwner(),
              style: TextStyle(
                  color:
                      RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
              initialValue: value,
              decoration: new InputDecoration(
                fillColor: Colors.white,
//                    RgbHelper.color(rgbo: GlobalData.app().formBackgroundColor),
                filled: true,
                contentPadding: new EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
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
