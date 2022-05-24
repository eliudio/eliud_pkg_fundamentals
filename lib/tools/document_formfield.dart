import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:eliud_pkg_fundamentals/tools/document_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef DocumentTextFieldTrigger(String value);

class DocumentTextField extends StatefulWidget {
  final AppModel app;
  final String label;
  final DocumentRenderer? documentRenderer;
  String? documentValue;
  final List<DocumentItemModel>? images;
  final DocumentTextFieldTrigger trigger;
  final BackgroundModel? bdm;

  DocumentTextField(this.app, this.label, this.documentRenderer, this.documentValue,
      this.images, this.bdm, this.trigger);

  @override
  DocumentTextFieldState createState() {
    return DocumentTextFieldState();
  }
}

class DocumentTextFieldState extends State<DocumentTextField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
          if (accessState is AccessDetermined) {
            return _buildExcludeDocument(accessState, context);
          } else {
            return progressIndicator(widget.app, context);
          }
        });
  }

  Widget _buildExcludeDocument(AccessState accessState, BuildContext context) {
    return button(widget.app, context,
            label: widget.label,
            icon: Icon(Icons.fullscreen),
            onPressed: () => _fullScreen(widget.app, accessState));
  }


  void _fullScreen(AppModel app, AccessState appState) async {
    if (appState is AccessDetermined) {
      await Navigator.of(context).push(pageRouteBuilder(app,
          page: DocumentTextFieldFullScreen(app,
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
  final AppModel app;
  final String label;
  final DocumentRenderer? documentRenderer;
  final String? documentValue;
  final List<DocumentItemModel>? images;
  final BackgroundModel? bdm;
  final DocumentTextFieldTrigger trigger;

  DocumentTextFieldFullScreen(this.app, this.label, this.documentRenderer,
      this.documentValue, this.images, this.bdm, this.trigger);

  @override
  DocumentTextFieldFullScreenState createState() {
    return DocumentTextFieldFullScreenState();
  }
}

class DocumentTextFieldFullScreenState
    extends State<DocumentTextFieldFullScreen> {
  String? value;

  @override
  void initState() {
    value = widget.documentValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (context, accessState) {
          if (accessState is AccessDetermined) {
            return tabs(accessState);
          } else {
            return progressIndicator(widget.app, context);
          }
        });
  }

  Widget _document(AppModel app, MemberModel? member) {
    var w = DocumentRendererTool().render(app,
        context, member, widget.documentRenderer, value!, widget.images, widget.bdm);
    return ListView(children: <Widget>[w]);
  }

  Widget tabs(AccessDetermined accessState) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                flexibleSpace: null,
                title: Text(widget.label),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(icon: Icon(Icons.create, color: Colors.red)),
                    Tab(icon: Icon(Icons.remove_red_eye, color: Colors.red)),
                  ],
                )),
            body: TabBarView(
              children: <Widget>[
                TextFormField(
                  readOnly: !accessState.memberIsOwner(widget.app.documentID),
                  style: TextStyle(color: Colors.black),
                  initialValue: value,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                  ),
                  onChanged: _onChanged,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                _document(widget.app, accessState.getMember())
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
