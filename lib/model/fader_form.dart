/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 fader_form.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/fader_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/fader_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/fader_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/fader_form_state.dart';


class FaderForm extends StatelessWidget {
  FormAction formAction;
  FaderModel? value;
  ActionModel? submitAction;

  FaderForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<FaderFormBloc >(
            create: (context) => FaderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseFaderFormEvent(value: value)),
  
        child: MyFaderForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<FaderFormBloc >(
            create: (context) => FaderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialiseFaderFormNoLoadEvent(value: value)),
  
        child: MyFaderForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().constructAppBar(context, formAction == FormAction.UpdateAction ? 'Update Fader' : 'Add Fader'),
        body: BlocProvider<FaderFormBloc >(
            create: (context) => FaderFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseFaderFormEvent(value: value) : InitialiseNewFaderFormEvent())),
  
        child: MyFaderForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyFaderForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyFaderForm({this.formAction, this.submitAction});

  _MyFaderFormState createState() => _MyFaderFormState(this.formAction);
}


class _MyFaderFormState extends State<MyFaderForm> {
  final FormAction? formAction;
  late FaderFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _animationMillisecondsController = TextEditingController();
  final TextEditingController _imageSecondsController = TextEditingController();


  _MyFaderFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FaderFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _nameController.addListener(_onNameChanged);
    _animationMillisecondsController.addListener(_onAnimationMillisecondsChanged);
    _imageSecondsController.addListener(_onImageSecondsChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<FaderFormBloc, FaderFormState>(builder: (context, state) {
      if (state is FaderFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is FaderFormLoaded) {
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
        if (state.value!.animationMilliseconds != null)
          _animationMillisecondsController.text = state.value!.animationMilliseconds.toString();
        else
          _animationMillisecondsController.text = "";
        if (state.value!.imageSeconds != null)
          _imageSecondsController.text = state.value!.imageSeconds.toString();
        else
          _imageSecondsController.text = "";
      }
      if (state is FaderFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Document ID', Icons.vpn_key, (formAction == FormAction.UpdateAction), _documentIDController, FieldType.String, validator: (_) => state is DocumentIDFaderFormError ? state.message : null, hintText: 'null')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Name', Icons.text_format, _readOnly(accessState, state), _nameController, FieldType.String, validator: (_) => state is NameFaderFormError ? state.message : null, hintText: 'null')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Images')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: listedItemsList(context, state.value!.items, _onItemsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Access Rights')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Animation Times')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Animation Time (millisec)', Icons.text_format, _readOnly(accessState, state), _animationMillisecondsController, FieldType.Int, validator: (_) => state is AnimationMillisecondsFaderFormError ? state.message : null, hintText: 'The duration of the transition between the images')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Image time (seconds)', Icons.text_format, _readOnly(accessState, state), _imageSecondsController, FieldType.Int, validator: (_) => state is ImageSecondsFaderFormError ? state.message : null, hintText: 'The time to display 1 image')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Conditions')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().submitButton(context, 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is FaderFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<FaderListBloc>(context).add(
                          UpdateFaderList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              animationMilliseconds: state.value!.animationMilliseconds, 
                              imageSeconds: state.value!.imageSeconds, 
                              items: state.value!.items, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<FaderListBloc>(context).add(
                          AddFaderList(value: FaderModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              animationMilliseconds: state.value!.animationMilliseconds, 
                              imageSeconds: state.value!.imageSeconds, 
                              items: state.value!.items, 
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

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return DelayedCircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedFaderDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedFaderAppId(value: _appIdController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedFaderName(value: _nameController.text));
  }


  void _onAnimationMillisecondsChanged() {
    _myFormBloc.add(ChangedFaderAnimationMilliseconds(value: _animationMillisecondsController.text));
  }


  void _onImageSecondsChanged() {
    _myFormBloc.add(ChangedFaderImageSeconds(value: _imageSecondsController.text));
  }


  void _onItemsChanged(value) {
    _myFormBloc.add(ChangedFaderItems(value: value));
    setState(() {});
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _nameController.dispose();
    _animationMillisecondsController.dispose();
    _imageSecondsController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, FaderFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



