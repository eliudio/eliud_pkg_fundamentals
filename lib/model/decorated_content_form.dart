/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decorated_content_form.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/decorated_content_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_model.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_form_state.dart';


class DecoratedContentForm extends StatelessWidget {
  FormAction formAction;
  DecoratedContentModel? value;
  ActionModel? submitAction;

  DecoratedContentForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (formAction == FormAction.ShowData) {
      return BlocProvider<DecoratedContentFormBloc >(
            create: (context) => DecoratedContentFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseDecoratedContentFormEvent(value: value)),
  
        child: MyDecoratedContentForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<DecoratedContentFormBloc >(
            create: (context) => DecoratedContentFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseDecoratedContentFormNoLoadEvent(value: value)),
  
        child: MyDecoratedContentForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update DecoratedContent", style: TextStyle(color: RgbHelper.color(rgbo: app!.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app!.formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add DecoratedContent", style: TextStyle(color: RgbHelper.color(rgbo: app!.formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(accessState, app!.formAppBarBackground)),
                ),
        body: BlocProvider<DecoratedContentFormBloc >(
            create: (context) => DecoratedContentFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseDecoratedContentFormEvent(value: value) : InitialiseNewDecoratedContentFormEvent())),
  
        child: MyDecoratedContentForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyDecoratedContentForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDecoratedContentForm({this.formAction, this.submitAction});

  _MyDecoratedContentFormState createState() => _MyDecoratedContentFormState(this.formAction);
}


class _MyDecoratedContentFormState extends State<MyDecoratedContentForm> {
  final FormAction? formAction;
  late DecoratedContentFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  int? _decorationComponentPositionSelectedRadioTile;
  final TextEditingController _percentageDecorationVisibleController = TextEditingController();


  _MyDecoratedContentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DecoratedContentFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _nameController.addListener(_onNameChanged);
    _decorationComponentPositionSelectedRadioTile = 0;
    _percentageDecorationVisibleController.addListener(_onPercentageDecorationVisibleChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DecoratedContentFormBloc, DecoratedContentFormState>(builder: (context, state) {
      if (state is DecoratedContentFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is DecoratedContentFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.name != null)
          _nameController.text = state.value!.name.toString();
        else
          _nameController.text = "";
        if (state.value!.decorationComponentPosition != null)
          _decorationComponentPositionSelectedRadioTile = state.value!.decorationComponentPosition!.index;
        else
          _decorationComponentPositionSelectedRadioTile = 0;
        if (state.value!.percentageDecorationVisible != null)
          _percentageDecorationVisibleController.text = state.value!.percentageDecorationVisible.toString();
        else
          _percentageDecorationVisibleController.text = "";
      }
      if (state is DecoratedContentFormInitialized) {
        List<Widget?> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app!.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                ExtensionTypeField(state.value!.decoratingComponentName, _onDecoratingComponentNameChanged)
          );

        children.add(

                ComponentIdField(componentName: state.value!.decoratingComponentName, value: state.value!.decoratingComponentId, trigger: _onDecoratingComponentIdChanged)
          );

        children.add(

                ExtensionTypeField(state.value!.contentComponentName, _onContentComponentNameChanged)
          );

        children.add(

                ComponentIdField(componentName: state.value!.contentComponentName, value: state.value!.contentComponentId, trigger: _onContentComponentIdChanged)
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _percentageDecorationVisibleController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app!.formFieldHeaderColor)),
                    labelText: 'Percentage Decoration Visible',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is PercentageDecorationVisibleDecoratedContentFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app!.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app!.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor)),
                  readOnly: (formAction == FormAction.UpdateAction),
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: app!.formFieldHeaderColor)),
                    labelText: 'Document ID',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDDecoratedContentFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor)),
                  readOnly: _readOnly(accessState, state),
                  controller: _nameController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: app!.formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: app!.formFieldHeaderColor)),
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is NameDecoratedContentFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app!.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Conditions',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app!.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));



        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app!.dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Conditions',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: app!.formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: app!.formFieldTextColor),
                    groupValue: _decorationComponentPositionSelectedRadioTile,
                    title: Text("LeftIfSpaceAvailableOtherwiseTop", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    subtitle: Text("LeftIfSpaceAvailableOtherwiseTop", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionDecorationComponentPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: app!.formFieldTextColor),
                    groupValue: _decorationComponentPositionSelectedRadioTile,
                    title: Text("LeftIfSpaceAvailableOtherwiseDrop", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    subtitle: Text("LeftIfSpaceAvailableOtherwiseDrop", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionDecorationComponentPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: app!.formFieldTextColor),
                    groupValue: _decorationComponentPositionSelectedRadioTile,
                    title: Text("LeftIfSpaceAvailableOtherwiseBottom", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    subtitle: Text("LeftIfSpaceAvailableOtherwiseBottom", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionDecorationComponentPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: app!.formFieldTextColor),
                    groupValue: _decorationComponentPositionSelectedRadioTile,
                    title: Text("RightIfSpaceAvailableOtherwiseTop", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    subtitle: Text("RightIfSpaceAvailableOtherwiseTop", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionDecorationComponentPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: app!.formFieldTextColor),
                    groupValue: _decorationComponentPositionSelectedRadioTile,
                    title: Text("RightIfSpaceAvailableOtherwiseDrop", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    subtitle: Text("RightIfSpaceAvailableOtherwiseDrop", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionDecorationComponentPosition(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 5,
                    activeColor: RgbHelper.color(rgbo: app!.formFieldTextColor),
                    groupValue: _decorationComponentPositionSelectedRadioTile,
                    title: Text("RightIfSpaceAvailableOtherwiseBottom", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    subtitle: Text("RightIfSpaceAvailableOtherwiseBottom", style: TextStyle(color: RgbHelper.color(rgbo: app!.formFieldTextColor))),
                    onChanged: !accessState.memberIsOwner() ? null : (dynamic val) {
                      setSelectionDecorationComponentPosition(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: app!.dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: app!.formSubmitButtonColor),
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is DecoratedContentFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<DecoratedContentListBloc>(context).add(
                          UpdateDecoratedContentList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              decoratingComponentName: state.value!.decoratingComponentName, 
                              decoratingComponentId: state.value!.decoratingComponentId, 
                              contentComponentName: state.value!.contentComponentName, 
                              contentComponentId: state.value!.contentComponentId, 
                              decorationComponentPosition: state.value!.decorationComponentPosition, 
                              percentageDecorationVisible: state.value!.percentageDecorationVisible, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<DecoratedContentListBloc>(context).add(
                          AddDecoratedContentList(value: DecoratedContentModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              decoratingComponentName: state.value!.decoratingComponentName, 
                              decoratingComponentId: state.value!.decoratingComponentId, 
                              contentComponentName: state.value!.contentComponentName, 
                              contentComponentId: state.value!.contentComponentId, 
                              decorationComponentPosition: state.value!.decorationComponentPosition, 
                              percentageDecorationVisible: state.value!.percentageDecorationVisible, 
                              conditions: state.value!.conditions, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: app!.formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(accessState, app!.formBackground),
          padding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          )
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedDecoratedContentDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedDecoratedContentAppId(value: _appIdController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedDecoratedContentName(value: _nameController.text));
  }


  void _onDecoratingComponentNameChanged(value) {
    _myFormBloc.add(ChangedDecoratedContentDecoratingComponentName(value: value));
    
  }


  void _onDecoratingComponentIdChanged(value) {
    _myFormBloc.add(ChangedDecoratedContentDecoratingComponentId(value: value));
    
  }


  void _onContentComponentNameChanged(value) {
    _myFormBloc.add(ChangedDecoratedContentContentComponentName(value: value));
    
  }


  void _onContentComponentIdChanged(value) {
    _myFormBloc.add(ChangedDecoratedContentContentComponentId(value: value));
    
  }


  void setSelectionDecorationComponentPosition(int? val) {
    setState(() {
      _decorationComponentPositionSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedDecoratedContentDecorationComponentPosition(value: toDecorationComponentPosition(val)));
  }


  void _onPercentageDecorationVisibleChanged() {
    _myFormBloc.add(ChangedDecoratedContentPercentageDecorationVisible(value: _percentageDecorationVisibleController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _nameController.dispose();
    _percentageDecorationVisibleController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, DecoratedContentFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



