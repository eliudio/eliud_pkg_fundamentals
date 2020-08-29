/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 booklet_list.dart
                       
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
import 'package:eliud_core/core/eliud.dart';

import 'booklet_list_event.dart';
import 'booklet_list_state.dart';
import 'booklet_list_bloc.dart';
import 'booklet_model.dart';

import 'booklet_form.dart';
class BookletListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  BookletListWidgetState state;

  BookletListWidget({ Key key, this.readOnly, this.form }): super(key: key);

  @override
  BookletListWidgetState createState() {
    state ??= BookletListWidgetState();
    return state;
  }

  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= BookletListWidgetState();
    return state.fab(context);
  }
}

class BookletListWidgetState extends State<BookletListWidget> {
  BookletListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<BookletListBloc>(context);
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
      heroTag: "BookletFloatBtnTag",
      foregroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonForegroundColor),
      backgroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonBackgroundColor),
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(page: BlocProvider.value(
              value: bloc,
              child: BookletForm(
                  value: null,
                  formAction: FormAction.AddAction)
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookletListBloc, BookletListState>(builder: (context, state) {
      if (state is BookletListLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is BookletListLoaded) {
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
                     return BookletListItem(
                       value: value,
                       onDismissed: (direction) {
                         BlocProvider.of<BookletListBloc>(context)
                             .add(DeleteBookletList(value: value));
                         Scaffold.of(context).showSnackBar(DeleteSnackBar(
                           message: "Booklet " + value.documentID,
                           onUndo: () => BlocProvider.of<BookletListBloc>(context)
                               .add(AddBookletList(value: value)),
                         ));
                       },
                       onTap: () async {
                                             final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(page: BlocProvider.value(
                              value: BlocProvider.of<BookletListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "Booklet " + value.documentID,
                            onUndo: () => BlocProvider.of<BookletListBloc>(context)
                                .add(AddBookletList(value: value)),
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
      return BookletForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class BookletListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final BookletModel value;

  BookletListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__Booklet_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__BookletheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value.documentID,
              style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
            )),
          ),
        ),
        subtitle: (value.name != null) && (value.name.isNotEmpty)
            ? Center( child: Text(
          value.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().listTextItemColor)),
        ))
            : null,
      ),
    );
  }
}

