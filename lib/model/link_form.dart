/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 link_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_core/model/embedded_component.dart';
import '../model/embedded_component.dart';
import '../tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'link_list_bloc.dart';
import 'link_list_event.dart';
import 'link_model.dart';
import 'link_form_bloc.dart';
import 'link_form_event.dart';
import 'link_form_state.dart';


class LinkForm extends StatelessWidget {
  FormAction formAction;
  LinkModel value;
  ActionModel submitAction;

  LinkForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formAction == FormAction.ShowData) {
      return BlocProvider<LinkFormBloc >(
            create: (context) => LinkFormBloc(
                                       
                                                )..add(InitialiseLinkFormEvent(value: value)),
  
        child: MyLinkForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<LinkFormBloc >(
            create: (context) => LinkFormBloc(
                                       
                                                )..add(InitialiseLinkFormNoLoadEvent(value: value)),
  
        child: MyLinkForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Link", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Link", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                ),
        body: BlocProvider<LinkFormBloc >(
            create: (context) => LinkFormBloc(
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseLinkFormEvent(value: value) : InitialiseNewLinkFormEvent())),
  
        child: MyLinkForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyLinkForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyLinkForm({this.formAction, this.submitAction});

  _MyLinkFormState createState() => _MyLinkFormState(this.formAction);
}


class _MyLinkFormState extends State<MyLinkForm> {
  final FormAction formAction;
  LinkFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _linkTextController = TextEditingController();


  _MyLinkFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<LinkFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _linkTextController.addListener(_onLinkTextChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LinkFormBloc, LinkFormState>(builder: (context, state) {
      if (state is LinkFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is LinkFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.linkText != null)
          _linkTextController.text = state.value.linkText.toString();
        else
          _linkTextController.text = "";
      }
      if (state is LinkFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _linkTextController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Link text',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is LinkTextLinkFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Action',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                ActionField(state.value.action, _onActionChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: _readOnly(state) ? null : () {
                    if (state is LinkFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<LinkListBloc>(context).add(
                          UpdateLinkList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              linkText: state.value.linkText, 
                              action: state.value.action, 
                        )));
                      } else {
                        BlocProvider.of<LinkListBloc>(context).add(
                          AddLinkList(value: LinkModel(
                              documentID: state.value.documentID, 
                              linkText: state.value.linkText, 
                              action: state.value.action, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction);
                      } else {
                        Navigator.pop(context);
                      }
                      return true;
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(GlobalData.app().formBackground),
          padding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children
            ),
          )
        );
      } else {
        return CircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedLinkDocumentID(value: _documentIDController.text));
  }


  void _onLinkTextChanged() {
    _myFormBloc.add(ChangedLinkLinkText(value: _linkTextController.text));
  }


  void _onActionChanged(value) {
    _myFormBloc.add(ChangedLinkAction(value: value));
    
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _linkTextController.dispose();
    super.dispose();
  }

  bool _readOnly(LinkFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!GlobalData.memberIsOwner());
  }
  

}



