/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_list.dart
                       
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

import 'section_list_event.dart';
import 'section_list_state.dart';
import 'section_list_bloc.dart';
import 'section_model.dart';

import 'section_form.dart';
class SectionListWidget extends StatefulWidget with HasFab {
  bool readOnly;
  String form;
  SectionListWidgetState state;

  SectionListWidget({ Key key, this.readOnly, this.form }): super(key: key);

  @override
  SectionListWidgetState createState() {
    state ??= SectionListWidgetState();
    return state;
  }

  Widget fab(BuildContext context) {
    if ((readOnly != null) && readOnly) return null;
    state ??= SectionListWidgetState();
    return state.fab(context);
  }
}

class SectionListWidgetState extends State<SectionListWidget> {
  SectionListBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<SectionListBloc>(context);
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
      heroTag: "SectionFloatBtnTag",
      foregroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonForegroundColor),
      backgroundColor: RgbHelper.color(rgbo: GlobalData.app().floatingButtonBackgroundColor),
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(page: BlocProvider.value(
              value: bloc,
              child: SectionForm(
                  value: null,
                  formAction: FormAction.AddAction)
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionListBloc, SectionListState>(builder: (context, state) {
      if (state is SectionListLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is SectionListLoaded) {
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
                     return SectionListItem(
                       value: value,
                       onDismissed: (direction) {
                         BlocProvider.of<SectionListBloc>(context)
                             .add(DeleteSectionList(value: value));
                         Scaffold.of(context).showSnackBar(DeleteSnackBar(
                           message: "Section " + value.documentID,
                           onUndo: () => BlocProvider.of<SectionListBloc>(context)
                               .add(AddSectionList(value: value)),
                         ));
                       },
                       onTap: () async {
                                             final removedItem = await Navigator.of(context).push(
                        pageRouteBuilder(page: BlocProvider.value(
                              value: BlocProvider.of<SectionListBloc>(context),
                              child: getForm(value, FormAction.UpdateAction))));
                      if (removedItem != null) {
                        Scaffold.of(context).showSnackBar(
                          DeleteSnackBar(
                        message: "Section " + value.documentID,
                            onUndo: () => BlocProvider.of<SectionListBloc>(context)
                                .add(AddSectionList(value: value)),
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
      return SectionForm(value: value, formAction: action);
    } else {
      return null;
    }
  }
  
}


class SectionListItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final SectionModel value;

  SectionListItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__Section_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Hero(
          tag: '${value.documentID}__SectionheroTag',
          child: Container(
            width: fullScreenWidth(context),
            child: Center(child: Text(
              value.title,
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

