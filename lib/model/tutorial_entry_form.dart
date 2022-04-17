/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_entry_form.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/tutorial_entry_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_entry_form_state.dart';


class TutorialEntryForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  TutorialEntryModel? value;
  ActionModel? submitAction;

  TutorialEntryForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<TutorialEntryFormBloc >(
            create: (context) => TutorialEntryFormBloc(appId,
                                       
                                                )..add(InitialiseTutorialEntryFormEvent(value: value)),
  
        child: MyTutorialEntryForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<TutorialEntryFormBloc >(
            create: (context) => TutorialEntryFormBloc(appId,
                                       
                                                )..add(InitialiseTutorialEntryFormNoLoadEvent(value: value)),
  
        child: MyTutorialEntryForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update TutorialEntry' : 'Add TutorialEntry'),
        body: BlocProvider<TutorialEntryFormBloc >(
            create: (context) => TutorialEntryFormBloc(appId,
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseTutorialEntryFormEvent(value: value) : InitialiseNewTutorialEntryFormEvent())),
  
        child: MyTutorialEntryForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyTutorialEntryForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyTutorialEntryForm({required this.app, this.formAction, this.submitAction});

  _MyTutorialEntryFormState createState() => _MyTutorialEntryFormState(this.formAction);
}


class _MyTutorialEntryFormState extends State<MyTutorialEntryForm> {
  final FormAction? formAction;
  late TutorialEntryFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _image;
  final TextEditingController _codeController = TextEditingController();


  _MyTutorialEntryFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<TutorialEntryFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _codeController.addListener(_onCodeChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<TutorialEntryFormBloc, TutorialEntryFormState>(builder: (context, state) {
      if (state is TutorialEntryFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is TutorialEntryFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.image != null)
          _image= state.value!.image!.documentID;
        else
          _image= "";
        if (state.value!.code != null)
          _codeController.text = state.value!.code.toString();
        else
          _codeController.text = "";
      }
      if (state is TutorialEntryFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionTutorialEntryFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Optional Image')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "platformMediums", value: _image, trigger: (value, privilegeLevel) => _onImageSelected(value), optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Optional Code')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Code', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _codeController, keyboardType: TextInputType.text, validator: (_) => state is CodeTutorialEntryFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is TutorialEntryFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<TutorialEntryListBloc>(context).add(
                          UpdateTutorialEntryList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              description: state.value!.description, 
                              image: state.value!.image, 
                              code: state.value!.code, 
                        )));
                      } else {
                        BlocProvider.of<TutorialEntryListBloc>(context).add(
                          AddTutorialEntryList(value: TutorialEntryModel(
                              documentID: state.value!.documentID, 
                              description: state.value!.description, 
                              image: state.value!.image, 
                              code: state.value!.code, 
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
    _myFormBloc.add(ChangedTutorialEntryDocumentID(value: _documentIDController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedTutorialEntryDescription(value: _descriptionController.text));
  }


  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedTutorialEntryImage(value: val));
  }


  void _onCodeChanged() {
    _myFormBloc.add(ChangedTutorialEntryCode(value: _codeController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, TutorialEntryFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID!));
  }
  

}



