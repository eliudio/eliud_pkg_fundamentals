/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 presentation_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/tools/action_model.dart';
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
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';
import 'package:eliud_core/model/entity_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_pkg_fundamentals/model/entity_export.dart';

import 'package:eliud_pkg_fundamentals/model/presentation_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_form_state.dart';


class PresentationForm extends StatelessWidget {
  FormAction formAction;
  PresentationModel value;
  ActionModel submitAction;

  PresentationForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<PresentationFormBloc >(
            create: (context) => PresentationFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialisePresentationFormEvent(value: value)),
  
        child: MyPresentationForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<PresentationFormBloc >(
            create: (context) => PresentationFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialisePresentationFormNoLoadEvent(value: value)),
  
        child: MyPresentationForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Presentation", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Presentation", style: TextStyle(color: RgbHelper.color(rgbo: app.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app.formAppBarBackground)),
                ),
        body: BlocProvider<PresentationFormBloc >(
            create: (context) => PresentationFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialisePresentationFormEvent(value: value) : InitialiseNewPresentationFormEvent())),
  
        child: MyPresentationForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyPresentationForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyPresentationForm({this.formAction, this.submitAction});

  _MyPresentationFormState createState() => _MyPresentationFormState(this.formAction);
}


class _MyPresentationFormState extends State<MyPresentationForm> {
  final FormAction formAction;
  PresentationFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  String _image;
  int _imagePositionRelativeSelectedRadioTile;
  int _imageAlignmentSelectedRadioTile;
  final TextEditingController _imageWidthController = TextEditingController();


  _MyPresentationFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PresentationFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _imagePositionRelativeSelectedRadioTile = 0;
    _imageAlignmentSelectedRadioTile = 0;
    _imageWidthController.addListener(_onImageWidthChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<PresentationFormBloc, PresentationFormState>(builder: (context, state) {
      if (state is PresentationFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is PresentationFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.appId != null)
          _appIdController.text = state.value.appId.toString();
        else
          _appIdController.text = "";
        if (state.value.title != null)
          _titleController.text = state.value.title.toString();
        else
          _titleController.text = "";
        if (state.value.image != null)
          _image= state.value.image.documentID;
        else
          _image= "";
        if (state.value.imagePositionRelative != null)
          _imagePositionRelativeSelectedRadioTile = state.value.imagePositionRelative.index;
        else
          _imagePositionRelativeSelectedRadioTile = 0;
        if (state.value.imageAlignment != null)
          _imageAlignmentSelectedRadioTile = state.value.imageAlignment.index;
        else
          _imageAlignmentSelectedRadioTile = 0;
        if (state.value.imageWidth != null)
          _imageWidthController.text = state.value.imageWidth.toString();
        else
          _imageWidthController.text = "";
      }
      if (state is PresentationFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


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
                    return state is DocumentIDPresentationFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _titleController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Title',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is TitlePresentationFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _imageWidthController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Image Width (% of screen width)',
                    hintText: "Width of the image",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is ImageWidthPresentationFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Components',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: bodyComponentsList(state.value.bodyComponents, _onBodyComponentsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Optional Image',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "images", value: _image, trigger: _onImageSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Relative position of the image',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _imagePositionRelativeSelectedRadioTile,
                    title: Text("Behind", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Behind", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionImagePositionRelative(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _imagePositionRelativeSelectedRadioTile,
                    title: Text("InFront", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("InFront", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionImagePositionRelative(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _imagePositionRelativeSelectedRadioTile,
                    title: Text("Below", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Below", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionImagePositionRelative(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _imagePositionRelativeSelectedRadioTile,
                    title: Text("Above", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Above", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionImagePositionRelative(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _imagePositionRelativeSelectedRadioTile,
                    title: Text("Aside", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Aside", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionImagePositionRelative(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Alignment of the image',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _imageAlignmentSelectedRadioTile,
                    title: Text("Left", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Left", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionImageAlignment(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _imageAlignmentSelectedRadioTile,
                    title: Text("Center", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Center", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionImageAlignment(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: app.formFieldTextColor),
                    groupValue: _imageAlignmentSelectedRadioTile,
                    title: Text("Right", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    subtitle: Text("Right", style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (val) {
                      setSelectionImageAlignment(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('general',
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
                    return state is DocumentIDPresentationFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _titleController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Title',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is TitlePresentationFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _imageWidthController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app.formFieldHeaderColor)),
                    labelText: 'Image Width (% of screen width)',
                    hintText: "Width of the image",
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is ImageWidthPresentationFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is PresentationFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<PresentationListBloc>(context).add(
                          UpdatePresentationList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              title: state.value.title, 
                              bodyComponents: state.value.bodyComponents, 
                              image: state.value.image, 
                              imagePositionRelative: state.value.imagePositionRelative, 
                              imageAlignment: state.value.imageAlignment, 
                              imageWidth: state.value.imageWidth, 
                        )));
                      } else {
                        BlocProvider.of<PresentationListBloc>(context).add(
                          AddPresentationList(value: PresentationModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              title: state.value.title, 
                              bodyComponents: state.value.bodyComponents, 
                              image: state.value.image, 
                              imagePositionRelative: state.value.imagePositionRelative, 
                              imageAlignment: state.value.imageAlignment, 
                              imageWidth: state.value.imageWidth, 
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
    _myFormBloc.add(ChangedPresentationDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedPresentationAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedPresentationTitle(value: _titleController.text));
  }


  void _onBodyComponentsChanged(value) {
    _myFormBloc.add(ChangedPresentationBodyComponents(value: value));
    setState(() {});
  }


  void _onImageSelected(String val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedPresentationImage(value: val));
  }


  void setSelectionImagePositionRelative(int val) {
    setState(() {
      _imagePositionRelativeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPresentationImagePositionRelative(value: toPresentationRelativeImagePosition(val)));
  }


  void setSelectionImageAlignment(int val) {
    setState(() {
      _imageAlignmentSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPresentationImageAlignment(value: toPresentationImageAlignment(val)));
  }


  void _onImageWidthChanged() {
    _myFormBloc.add(ChangedPresentationImageWidth(value: _imageWidthController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    _imageWidthController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, PresentationFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



