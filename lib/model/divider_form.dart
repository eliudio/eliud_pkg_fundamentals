/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 divider_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';

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

import 'package:eliud_pkg_fundamentals/model/divider_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/divider_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/divider_model.dart';
import 'package:eliud_pkg_fundamentals/model/divider_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/divider_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/divider_form_state.dart';


class DividerForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  DividerModel? value;
  ActionModel? submitAction;

  DividerForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<DividerFormBloc >(
            create: (context) => DividerFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseDividerFormEvent(value: value)),
  
        child: MyDividerForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<DividerFormBloc >(
            create: (context) => DividerFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseDividerFormNoLoadEvent(value: value)),
  
        child: MyDividerForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Divider' : 'Add Divider'),
        body: BlocProvider<DividerFormBloc >(
            create: (context) => DividerFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseDividerFormEvent(value: value) : InitialiseNewDividerFormEvent())),
  
        child: MyDividerForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyDividerForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDividerForm({required this.app, this.formAction, this.submitAction});

  _MyDividerFormState createState() => _MyDividerFormState(this.formAction);
}


class _MyDividerFormState extends State<MyDividerForm> {
  final FormAction? formAction;
  late DividerFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _thicknessController = TextEditingController();
  final TextEditingController _indentController = TextEditingController();
  final TextEditingController _endIndentController = TextEditingController();


  _MyDividerFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DividerFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _heightController.addListener(_onHeightChanged);
    _thicknessController.addListener(_onThicknessChanged);
    _indentController.addListener(_onIndentChanged);
    _endIndentController.addListener(_onEndIndentChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DividerFormBloc, DividerFormState>(builder: (context, state) {
      if (state is DividerFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is DividerFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.height != null)
          _heightController.text = state.value!.height.toString();
        else
          _heightController.text = "";
        if (state.value!.thickness != null)
          _thicknessController.text = state.value!.thickness.toString();
        else
          _thicknessController.text = "";
        if (state.value!.indent != null)
          _indentController.text = state.value!.indent.toString();
        else
          _indentController.text = "";
        if (state.value!.endIndent != null)
          _endIndentController.text = state.value!.endIndent.toString();
        else
          _endIndentController.text = "";
      }
      if (state is DividerFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDDividerFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionDividerFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Shape')
                ));

        children.add(

                RgbField(widget.app, "Color", state.value!.color, _onColorChanged)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Height', icon: Icons.vertical_align_top, readOnly: _readOnly(accessState, state), textEditingController: _heightController, keyboardType: TextInputType.number, validator: (_) => state is HeightDividerFormError ? state.message : null, hintText: 'field.remark')
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Thickness', icon: Icons.vertical_align_center, readOnly: _readOnly(accessState, state), textEditingController: _thicknessController, keyboardType: TextInputType.number, validator: (_) => state is ThicknessDividerFormError ? state.message : null, hintText: 'field.remark')
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Indent', icon: Icons.format_indent_increase, readOnly: _readOnly(accessState, state), textEditingController: _indentController, keyboardType: TextInputType.number, validator: (_) => state is IndentDividerFormError ? state.message : null, hintText: 'field.remark')
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'End Indent', icon: Icons.format_indent_decrease, readOnly: _readOnly(accessState, state), textEditingController: _endIndentController, keyboardType: TextInputType.number, validator: (_) => state is EndIndentDividerFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Conditions')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is DividerFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<DividerListBloc>(context).add(
                          UpdateDividerList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              color: state.value!.color, 
                              height: state.value!.height, 
                              thickness: state.value!.thickness, 
                              indent: state.value!.indent, 
                              endIndent: state.value!.endIndent, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<DividerListBloc>(context).add(
                          AddDividerList(value: DividerModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              color: state.value!.color, 
                              height: state.value!.height, 
                              thickness: state.value!.thickness, 
                              indent: state.value!.indent, 
                              endIndent: state.value!.endIndent, 
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
                ));

        return StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().container(widget.app, context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedDividerDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedDividerAppId(value: _appIdController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedDividerDescription(value: _descriptionController.text));
  }


  void _onColorChanged(value) {
    _myFormBloc.add(ChangedDividerColor(value: value));
    
  }


  void _onHeightChanged() {
    _myFormBloc.add(ChangedDividerHeight(value: _heightController.text));
  }


  void _onThicknessChanged() {
    _myFormBloc.add(ChangedDividerThickness(value: _thicknessController.text));
  }


  void _onIndentChanged() {
    _myFormBloc.add(ChangedDividerIndent(value: _indentController.text));
  }


  void _onEndIndentChanged() {
    _myFormBloc.add(ChangedDividerEndIndent(value: _endIndentController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    _heightController.dispose();
    _thicknessController.dispose();
    _indentController.dispose();
    _endIndentController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, DividerFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID!));
  }
  

}



