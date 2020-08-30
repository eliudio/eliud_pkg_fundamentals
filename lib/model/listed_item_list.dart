/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

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

import 'listed_item_list_event.dart';
import 'listed_item_list_state.dart';
import 'listed_item_list_bloc.dart';
import 'listed_item_model.dart';

import 'listed_item_form.dart';
class ListedItemListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  ListedItemListWidgetState state;

  ListedItemListWidget({ Key key, this.readOnly, this.form }): super(key: key);

  @override
  ListedItemListWidgetState createState() {
    state ??= ListedItemListWidgetState();
    return state;
  }

  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= ListedItemListWidgetState();
    return state.fab(context);
  }
}

class ListedItemListWidgetState extends State<ListedItemListWidget> {
  ListedItemListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<ListedItemListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose () {
    if (bloc != null) bloc.close();
    super.dispose();
  }

  @override
  Widget fab(BuildContext aContext) {
    return !GlobalData.memberIsOwner()  
        ? null
        :FloatingActionButton(
      heroTag: "ListedItemFloatBtnTag",
      foregroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonForegroundColor),
      backgroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonBackgroundColor),
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(page: BlocProvider.value(
              value: bloc,
              child: ListedItemForm(
                  value: null,
                  formAction: FormAction.AddAction)
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListedItemListBloc, ListedItemListState>(builder: (context, state) {
      if (state is ListedItemListLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ListedItemListLoaded) {
        final values = state.values;
        return Container(
                 decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().listBackground),
                 child: ListView.separated(
                   separatorBuilder: (context, index) => Divider(
                     color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)
                   ),
                   shrinkWrap: true,
                   physics: ScrollPhysics(),
                   itemCount: values.length,
                   itemBuilder: (context, index) {
                     final value = values[index];
                     return ListedItemListItem(
                       value: value,
                       onDismissed: (direction) {
                         BlocProvider.of<ListedItemListBloc>(context)
                             .add(DeleteListedItemList(value: value));
                         Scaffold.of(context).showSnackBar(DeleteSnackBar(
                           message: "ListedItem " + value.documentID,
                           onUndo: () => BlocProvider.of<ListedItemListBloc>(context)
                               .add(AddListedItemList(value: value)),
                         ));
                       },
                       onTap: () async {
                                             final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(page: BlocProvider.value(
                              value: BlocProvider.of<ListedItemListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "ListedItem " + value.documentID,
                            onUndo: () => BlocProvider.of<ListedItemListBloc>(context)
                                .add(AddListedItemList(value: value)),
                          ),
                        );
                      }

                       },
                     );
                   }
               ));
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
  
  Widget getForm(value, action) {
    if (widget.form == null) {
      return ListedItemForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class ListedItemListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ListedItemModel value;

  ListedItemListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__ListedItem_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__ListedItemheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value.description,
              style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
            )),
          ),
        ),
        subtitle: (value.description != null) && (value.description.isNotEmpty)
            ? Center( child: Text(
          value.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
        ))
            : null,
      ),
    );
  }
}

