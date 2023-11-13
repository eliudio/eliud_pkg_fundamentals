/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 tutorial_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_pkg_fundamentals/model/embedded_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/tutorial_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_model.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/tutorial_form_state.dart';

class TutorialForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final TutorialModel? value;
  final ActionModel? submitAction;

  TutorialForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the TutorialForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<TutorialFormBloc>(
        create: (context) => TutorialFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseTutorialFormEvent(value: value)),
        child: _MyTutorialForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<TutorialFormBloc>(
        create: (context) => TutorialFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseTutorialFormNoLoadEvent(value: value)),
        child: _MyTutorialForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Tutorial'
                      : 'Add Tutorial'),
          body: BlocProvider<TutorialFormBloc>(
            create: (context) => TutorialFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseTutorialFormEvent(value: value)
                : InitialiseNewTutorialFormEvent())),
            child: _MyTutorialForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyTutorialForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyTutorialForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyTutorialForm> createState() => _MyTutorialFormState(formAction);
}

class _MyTutorialFormState extends State<_MyTutorialForm> {
  final FormAction? formAction;
  late TutorialFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  _MyTutorialFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<TutorialFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<TutorialFormBloc, TutorialFormState>(
        builder: (context, state) {
      if (state is TutorialFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is TutorialFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _nameController.text = state.value!.name.toString();
        _titleController.text = state.value!.title.toString();
        _descriptionController.text = state.value!.description.toString();
      }
      if (state is TutorialFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DocumentIDTutorialFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Name',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _nameController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is NameTutorialFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Title',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _titleController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is TitleTutorialFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Description',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionTutorialFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Tutorial Entries')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: tutorialEntrysList(widget.app, context,
                state.value!.tutorialEntries, _onTutorialEntriesChanged)));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Conditions')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(accessState, state)
                    ? null
                    : () {
                        if (state is TutorialFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<TutorialListBloc>(context)
                                .add(UpdateTutorialList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              title: state.value!.title,
                              description: state.value!.description,
                              tutorialEntries: state.value!.tutorialEntries,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<TutorialListBloc>(context)
                                .add(AddTutorialList(
                                    value: TutorialModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              title: state.value!.title,
                              description: state.value!.description,
                              tutorialEntries: state.value!.tutorialEntries,
                              conditions: state.value!.conditions,
                            )));
                          }
                          if (widget.submitAction != null) {
                            eliudrouter.Router.navigateTo(
                                context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc
        .add(ChangedTutorialDocumentID(value: _documentIDController.text));
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedTutorialName(value: _nameController.text));
  }

  void _onTitleChanged() {
    _myFormBloc.add(ChangedTutorialTitle(value: _titleController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc
        .add(ChangedTutorialDescription(value: _descriptionController.text));
  }

  void _onTutorialEntriesChanged(value) {
    _myFormBloc.add(ChangedTutorialTutorialEntries(value: value));
    setState(() {});
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, TutorialFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
