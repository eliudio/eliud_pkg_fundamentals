/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 photo_and_text_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_pkg_fundamentals/model/embedded_component.dart';
import 'package:eliud_pkg_fundamentals/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_pkg_fundamentals/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/photo_and_text_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_model.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/photo_and_text_form_state.dart';


class PhotoAndTextForm extends StatelessWidget {
  FormAction formAction;
  PhotoAndTextModel value;
  ActionModel submitAction;

  PhotoAndTextForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<PhotoAndTextFormBloc >(
            create: (context) => PhotoAndTextFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialisePhotoAndTextFormEvent(value: value)),
  
        child: MyPhotoAndTextForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<PhotoAndTextFormBloc >(
            create: (context) => PhotoAndTextFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialisePhotoAndTextFormNoLoadEvent(value: value)),
  
        child: MyPhotoAndTextForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update PhotoAndText", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add PhotoAndText", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<PhotoAndTextFormBloc >(
            create: (context) => PhotoAndTextFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialisePhotoAndTextFormEvent(value: value) : InitialiseNewPhotoAndTextFormEvent())),
  
        child: MyPhotoAndTextForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyPhotoAndTextForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyPhotoAndTextForm({this.formAction, this.submitAction});

  _MyPhotoAndTextFormState createState() => _MyPhotoAndTextFormState(this.formAction);
}


class _MyPhotoAndTextFormState extends State<MyPhotoAndTextForm> {
  final FormAction formAction;
  PhotoAndTextFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentsController = TextEditingController();
  String _image;
  int _imagePositionSelectedRadioTile;


  _MyPhotoAndTextFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PhotoAndTextFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _nameController.addListener(_onNameChanged);
    _titleController.addListener(_onTitleChanged);
    _contentsController.addListener(_onContentsChanged);
    _imagePositionSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<PhotoAndTextFormBloc, PhotoAndTextFormState>(builder: (context, state) {
      if (state is PhotoAndTextFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is PhotoAndTextFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.appId != null)
          _appIdController.text = state.value.appId.toString();
        else
          _appIdController.text = "";
        if (state.value.name != null)
          _nameController.text = state.value.name.toString();
        else
          _nameController.text = "";
        if (state.value.title != null)
          _titleController.text = state.value.title.toString();
        else
          _titleController.text = "";
        if (state.value.contents != null)
          _contentsController.text = state.value.contents.toString();
        else
          _contentsController.text = "";
        if (state.value.image != null)
          _image= state.value.image.documentID;
        else
          _image= "";
        if (state.value.imagePosition != null)
          _imagePositionSelectedRadioTile = state.value.imagePosition.index;
        else
          _imagePositionSelectedRadioTile = 0;
      }
      if (state is PhotoAndTextFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _titleController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Text',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is TitlePhotoAndTextFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _contentsController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Contents',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is ContentsPhotoAndTextFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberMediums", value: _image, trigger: _onImageSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: (formAction == FormAction.UpdateAction),
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Document ID',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDPhotoAndTextFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _nameController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is NamePhotoAndTextFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font Title',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font Text',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Sections',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Conditions',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));



        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Conditions',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _imagePositionSelectedRadioTile,
                    title: Text("Left", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Left", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionImagePosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _imagePositionSelectedRadioTile,
                    title: Text("Right", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Right", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionImagePosition(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is PhotoAndTextFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<PhotoAndTextListBloc>(context).add(
                          UpdatePhotoAndTextList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              name: state.value.name, 
                              title: state.value.title, 
                              contents: state.value.contents, 
                              image: state.value.image, 
                              imagePosition: state.value.imagePosition, 
                              conditions: state.value.conditions, 
                        )));
                      } else {
                        BlocProvider.of<PhotoAndTextListBloc>(context).add(
                          AddPhotoAndTextList(value: PhotoAndTextModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              name: state.value.name, 
                              title: state.value.title, 
                              contents: state.value.contents, 
                              image: state.value.image, 
                              imagePosition: state.value.imagePosition, 
                              conditions: state.value.conditions, 
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
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: app.formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(accessState, app.formBackground),
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
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedPhotoAndTextDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedPhotoAndTextAppId(value: _appIdController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedPhotoAndTextName(value: _nameController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedPhotoAndTextTitle(value: _titleController.text));
  }


  void _onContentsChanged() {
    _myFormBloc.add(ChangedPhotoAndTextContents(value: _contentsController.text));
  }


  void _onImageSelected(String val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedPhotoAndTextImage(value: val));
  }


  void setSelectionImagePosition(int val) {
    setState(() {
      _imagePositionSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPhotoAndTextImagePosition(value: toPhotoAndTextImagePosition(val)));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _nameController.dispose();
    _titleController.dispose();
    _contentsController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, PhotoAndTextFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



