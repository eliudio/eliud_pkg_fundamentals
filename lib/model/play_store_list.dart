/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 play_store_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

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

import 'package:eliud_pkg_fundamentals/model/play_store_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_list_state.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/play_store_model.dart';

import 'package:eliud_core/model/app_model.dart';

import 'play_store_form.dart';
class PlayStoreListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  PlayStoreListWidgetState state;
  bool isEmbedded;

  PlayStoreListWidget({ Key key, this.readOnly, this.form, this.isEmbedded }): super(key: key);

  @override
  PlayStoreListWidgetState createState() {
    state ??= PlayStoreListWidgetState();
    return state;
  }

  @override
  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= PlayStoreListWidgetState();
    var accessState = AccessBloc.getState(context);
    return state.fab(context, accessState);
  }
}

class PlayStoreListWidgetState extends State<PlayStoreListWidget> {
  PlayStoreListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<PlayStoreListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose () {
    if (bloc != null) bloc.close();
    super.dispose();
  }

  @override
  Widget fab(BuildContext aContext, AccessState accessState) {
    if (accessState is AppLoaded) {
      return !accessState.memberIsOwner() 
        ? null
        :FloatingActionButton(
        heroTag: "PlayStoreFloatBtnTag",
        foregroundColor: RgbHelper.color(rgbo: accessState.app.floatingButtonForegroundColor),
        backgroundColor: RgbHelper.color(rgbo: accessState.app.floatingButtonBackgroundColor),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            pageRouteBuilder(accessState.app, page: BlocProvider.value(
                value: bloc,
                child: PlayStoreForm(
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
    var accessState = AccessBloc.getState(context);
    if (accessState is AppLoaded) {
      return BlocBuilder<PlayStoreListBloc, PlayStoreListState>(builder: (context, state) {
        if (state is PlayStoreListLoading) {
          return Center(
            child: DelayedCircularProgressIndicator(),
          );
        } else if (state is PlayStoreListLoaded) {
          final values = state.values;
          if ((widget.isEmbedded != null) && (widget.isEmbedded)) {
            List<Widget> children = List();
            children.add(theList(context, values, accessState));
            children.add(RaisedButton(
                    color: RgbHelper.color(rgbo: accessState.app.formSubmitButtonColor),
                    onPressed: () {
                      Navigator.of(context).push(
                                pageRouteBuilder(accessState.app, page: BlocProvider.value(
                                    value: bloc,
                                    child: PlayStoreForm(
                                        value: null,
                                        formAction: FormAction.AddAction)
                                )),
                              );
                    },
                    child: Text('Add', style: TextStyle(color: RgbHelper.color(rgbo: accessState.app.formSubmitButtonTextColor))),
                  ));
            return ListView(
              padding: const EdgeInsets.all(8),
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: children
            );
          } else {
            return theList(context, values, accessState);
          }
        } else {
          return Center(
            child: DelayedCircularProgressIndicator(),
          );
        }
      });
    } else {
      return Text("App not loaded");
    } 
  }
  
  Widget theList(BuildContext context, values, AppLoaded accessState) {
    return Container(
      decoration: BoxDecorationHelper.boxDecoration(accessState, accessState.app.listBackground),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: RgbHelper.color(rgbo: accessState.app.dividerColor)
        ),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          return PlayStoreListItem(
            value: value,
            app: accessState.app,
            onDismissed: (direction) {
              BlocProvider.of<PlayStoreListBloc>(context)
                  .add(DeletePlayStoreList(value: value));
              Scaffold.of(context).showSnackBar(DeleteSnackBar(
                message: "PlayStore " + value.documentID,
                onUndo: () => BlocProvider.of<PlayStoreListBloc>(context)
                    .add(AddPlayStoreList(value: value)),
              ));
            },
            onTap: () async {
                                   final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(accessState.app, page: BlocProvider.value(
                              value: BlocProvider.of<PlayStoreListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "PlayStore " + value.documentID,
                            onUndo: () => BlocProvider.of<PlayStoreListBloc>(context)
                                .add(AddPlayStoreList(value: value)),
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
      return PlayStoreForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class PlayStoreListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final AppModel app;
  final PlayStoreModel value;

  PlayStoreListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
    @required this.app,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__PlayStore_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__PlayStoreheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value.documentID,
              style: TextStyle(color: RgbHelper.color(rgbo: app.listTextItemColor)),
            )),
          ),
        ),
        subtitle: (value.description != null) && (value.description.isNotEmpty)
            ? Center( child: Text(
          value.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: RgbHelper.color(rgbo: app.listTextItemColor)),
        ))
            : null,
      ),
    );
  }
}

