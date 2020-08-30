/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_list.dart
                       
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

import 'tutorial_list_event.dart';
import 'tutorial_list_state.dart';
import 'tutorial_list_bloc.dart';
import 'tutorial_model.dart';

import 'tutorial_form.dart';
class TutorialListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  TutorialListWidgetState state;

  TutorialListWidget({ Key key, this.readOnly, this.form }): super(key: key);

  @override
  TutorialListWidgetState createState() {
    state ??= TutorialListWidgetState();
    return state;
  }

  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= TutorialListWidgetState();
    return state.fab(context);
  }
}

class TutorialListWidgetState extends State<TutorialListWidget> {
  TutorialListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<TutorialListBloc>(context);
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
      heroTag: "TutorialFloatBtnTag",
      foregroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonForegroundColor),
      backgroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonBackgroundColor),
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(page: BlocProvider.value(
              value: bloc,
              child: TutorialForm(
                  value: null,
                  formAction: FormAction.AddAction)
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorialListBloc, TutorialListState>(builder: (context, state) {
      if (state is TutorialListLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is TutorialListLoaded) {
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
                     return TutorialListItem(
                       value: value,
                       onDismissed: (direction) {
                         BlocProvider.of<TutorialListBloc>(context)
                             .add(DeleteTutorialList(value: value));
                         Scaffold.of(context).showSnackBar(DeleteSnackBar(
                           message: "Tutorial " + value.documentID,
                           onUndo: () => BlocProvider.of<TutorialListBloc>(context)
                               .add(AddTutorialList(value: value)),
                         ));
                       },
                       onTap: () async {
                                             final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(page: BlocProvider.value(
                              value: BlocProvider.of<TutorialListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "Tutorial " + value.documentID,
                            onUndo: () => BlocProvider.of<TutorialListBloc>(context)
                                .add(AddTutorialList(value: value)),
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
      return TutorialForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class TutorialListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final TutorialModel value;

  TutorialListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__Tutorial_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__TutorialheroTag',
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

