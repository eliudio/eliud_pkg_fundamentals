/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/app/app_bloc.dart';
import 'package:eliud_core/core/app/app_state.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';

import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/tools/screen_size.dart';

import 'package:eliud_core/tools/delete_snackbar.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/eliud.dart';

import 'package:eliud_pkg_fundamentals/model/link_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/link_list_state.dart';
import 'package:eliud_pkg_fundamentals/model/link_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/link_model.dart';

import 'package:eliud_core/model/app_model.dart';

import 'link_form.dart';
class LinkListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  LinkListWidgetState state;
  bool isEmbedded;

  LinkListWidget({ Key key, this.readOnly, this.form, this.isEmbedded }): super(key: key);

  @override
  LinkListWidgetState createState() {
    state ??= LinkListWidgetState();
    return state;
  }

  @override
  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= LinkListWidgetState();
    var accessState = AccessBloc.getState(context);
    var appState = AppBloc.getState(context);
    return state.fab(context, accessState, appState);
  }
}

class LinkListWidgetState extends State<LinkListWidget> {
  LinkListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<LinkListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose () {
    if (bloc != null) bloc.close();
    super.dispose();
  }

  @override
  Widget fab(BuildContext aContext, AccessState accessState, AppLoaded appState) {
    if (appState is AppLoaded) {
      return !accessState.memberIsOwner(appState) 
        ? null
        :FloatingActionButton(
        heroTag: "LinkFloatBtnTag",
        foregroundColor: RgbHelper.color(rgbo: appState.app.floatingButtonForegroundColor),
        backgroundColor: RgbHelper.color(rgbo: appState.app.floatingButtonBackgroundColor),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            pageRouteBuilder(appState.app, page: BlocProvider.value(
                value: bloc,
                child: LinkForm(
                    value: null,
                    formAction: FormAction.AddAction)
            )),
          );
        },
      );
    } else {
      return Text('App not loaded');
    }
  }

  @override
  Widget build(BuildContext context) {
    var appState = AppBloc.getState(context);
    var accessState = AccessBloc.getState(context);
    if (appState is AppLoaded) {
      return BlocBuilder<LinkListBloc, LinkListState>(builder: (context, state) {
        if (state is LinkListLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LinkListLoaded) {
          final values = state.values;
          if ((widget.isEmbedded != null) && (widget.isEmbedded)) {
            List<Widget> children = List();
            children.add(theList(context, values, appState, accessState));
            children.add(RaisedButton(
                    color: RgbHelper.color(rgbo: appState.app.formSubmitButtonColor),
                    onPressed: () {
                      Navigator.of(context).push(
                                pageRouteBuilder(appState.app, page: BlocProvider.value(
                                    value: bloc,
                                    child: LinkForm(
                                        value: null,
                                        formAction: FormAction.AddAction)
                                )),
                              );
                    },
                    child: Text('Add', style: TextStyle(color: RgbHelper.color(rgbo: appState.app.formSubmitButtonTextColor))),
                  ));
            return ListView(
              padding: const EdgeInsets.all(8),
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: children
            );
          } else {
            return theList(context, values, appState, accessState);
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
    } else {
      return Text("App not loaded");
    } 
  }
  
  Widget theList(BuildContext context, values, AppLoaded appState, AccessState accessState) {
    return Container(
      decoration: BoxDecorationHelper.boxDecoration(accessState, appState.app.listBackground),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: RgbHelper.color(rgbo: appState.app.dividerColor)
        ),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          return LinkListItem(
            value: value,
            app: appState.app,
            onDismissed: (direction) {
              BlocProvider.of<LinkListBloc>(context)
                  .add(DeleteLinkList(value: value));
              Scaffold.of(context).showSnackBar(DeleteSnackBar(
                message: "Link " + value.documentID,
                onUndo: () => BlocProvider.of<LinkListBloc>(context)
                    .add(AddLinkList(value: value)),
              ));
            },
            onTap: () async {
                                   final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(appState.app, page: BlocProvider.value(
                              value: BlocProvider.of<LinkListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "Link " + value.documentID,
                            onUndo: () => BlocProvider.of<LinkListBloc>(context)
                                .add(AddLinkList(value: value)),
                          ),
                        );
                      }

            },
          );
        }
      ));
  }
  
  
  Widget getForm(value, action) {
    if (widget.form == null) {
      return LinkForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class LinkListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final AppModel app;
  final LinkModel value;

  LinkListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
    @required this.app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__Link_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__LinkheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value.linkText,
              style: TextStyle(color: RgbHelper.color(rgbo: app.listTextItemColor)),
            )),
          ),
        ),
      ),
    );
  }
}

