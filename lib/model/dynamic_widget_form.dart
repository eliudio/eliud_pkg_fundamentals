/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dynamic_widget_form.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/dynamic_widget_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_model.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/dynamic_widget_form_state.dart';


class DynamicWidgetForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  DynamicWidgetModel? value;
  ActionModel? submitAction;

  DynamicWidgetForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<DynamicWidgetFormBloc >(
            create: (context) => DynamicWidgetFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseDynamicWidgetFormEvent(value: value)),
  
        child: MyDynamicWidgetForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<DynamicWidgetFormBloc >(
            create: (context) => DynamicWidgetFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseDynamicWidgetFormNoLoadEvent(value: value)),
  
        child: MyDynamicWidgetForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update DynamicWidget' : 'Add DynamicWidget'),
        body: BlocProvider<DynamicWidgetFormBloc >(
            create: (context) => DynamicWidgetFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseDynamicWidgetFormEvent(value: value) : InitialiseNewDynamicWidgetFormEvent())),
  
        child: MyDynamicWidgetForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyDynamicWidgetForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDynamicWidgetForm({required this.app, this.formAction, this.submitAction});

  _MyDynamicWidgetFormState createState() => _MyDynamicWidgetFormState(this.formAction);
}


class _MyDynamicWidgetFormState extends State<MyDynamicWidgetForm> {
  final FormAction? formAction;
  late DynamicWidgetFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();


  _MyDynamicWidgetFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DynamicWidgetFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _contentController.addListener(_onContentChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DynamicWidgetFormBloc, DynamicWidgetFormState>(builder: (context, state) {
      if (state is DynamicWidgetFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is DynamicWidgetFormLoaded) {
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
        if (state.value!.content != null)
          _contentController.text = state.value!.content.toString();
        else
          _contentController.text = "";
      }
      if (state is DynamicWidgetFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDDynamicWidgetFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionDynamicWidgetFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Contents')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Contents', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _contentController, keyboardType: TextInputType.text, validator: (_) => state is ContentDynamicWidgetFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Renderer')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Layout')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Images')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Background')
                ));



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
                    if (state is DynamicWidgetFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<DynamicWidgetListBloc>(context).add(
                          UpdateDynamicWidgetList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              content: state.value!.content, 
                              background: state.value!.background, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<DynamicWidgetListBloc>(context).add(
                          AddDynamicWidgetList(value: DynamicWidgetModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              description: state.value!.description, 
                              content: state.value!.content, 
                              background: state.value!.background, 
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
    _myFormBloc.add(ChangedDynamicWidgetDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedDynamicWidgetAppId(value: _appIdController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedDynamicWidgetDescription(value: _descriptionController.text));
  }


  void _onContentChanged() {
    _myFormBloc.add(ChangedDynamicWidgetContent(value: _contentController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, DynamicWidgetFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}


