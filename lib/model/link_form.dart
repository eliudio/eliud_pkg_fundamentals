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

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';




import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/link_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/link_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/link_model.dart';
import 'package:eliud_pkg_fundamentals/model/link_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/link_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/link_form_state.dart';


class LinkForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  LinkModel? value;
  ActionModel? submitAction;

  LinkForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<LinkFormBloc >(
            create: (context) => LinkFormBloc(appId,
                                       
                                                )..add(InitialiseLinkFormEvent(value: value)),
  
        child: MyLinkForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<LinkFormBloc >(
            create: (context) => LinkFormBloc(appId,
                                       
                                                )..add(InitialiseLinkFormNoLoadEvent(value: value)),
  
        child: MyLinkForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Link' : 'Add Link'),
        body: BlocProvider<LinkFormBloc >(
            create: (context) => LinkFormBloc(appId,
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseLinkFormEvent(value: value) : InitialiseNewLinkFormEvent())),
  
        child: MyLinkForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyLinkForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyLinkForm({required this.app, this.formAction, this.submitAction});

  _MyLinkFormState createState() => _MyLinkFormState(this.formAction);
}


class _MyLinkFormState extends State<MyLinkForm> {
  final FormAction? formAction;
  late LinkFormBloc _myFormBloc;

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
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<LinkFormBloc, LinkFormState>(builder: (context, state) {
      if (state is LinkFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is LinkFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.linkText != null)
          _linkTextController.text = state.value!.linkText.toString();
        else
          _linkTextController.text = "";
      }
      if (state is LinkFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Link text', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _linkTextController, keyboardType: TextInputType.text, validator: (_) => state is LinkTextLinkFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Action')
                ));

        children.add(

                ActionField(widget.app, state.value!.action, _onActionChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is LinkFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<LinkListBloc>(context).add(
                          UpdateLinkList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              linkText: state.value!.linkText, 
                              action: state.value!.action, 
                        )));
                      } else {
                        BlocProvider.of<LinkListBloc>(context).add(
                          AddLinkList(value: LinkModel(
                              documentID: state.value!.documentID, 
                              linkText: state.value!.linkText, 
                              action: state.value!.action, 
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
              children: children
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
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

  bool _readOnly(AccessState accessState, LinkFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



