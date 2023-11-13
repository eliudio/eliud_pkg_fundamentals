/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 simple_image_form.dart
                       
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

import 'package:eliud_core/model/internal_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/simple_image_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_form_state.dart';

class SimpleImageForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final SimpleImageModel? value;
  final ActionModel? submitAction;

  SimpleImageForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the SimpleImageForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<SimpleImageFormBloc>(
        create: (context) => SimpleImageFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseSimpleImageFormEvent(value: value)),
        child: _MySimpleImageForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<SimpleImageFormBloc>(
        create: (context) => SimpleImageFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseSimpleImageFormNoLoadEvent(value: value)),
        child: _MySimpleImageForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update SimpleImage'
                      : 'Add SimpleImage'),
          body: BlocProvider<SimpleImageFormBloc>(
            create: (context) => SimpleImageFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseSimpleImageFormEvent(value: value)
                : InitialiseNewSimpleImageFormEvent())),
            child: _MySimpleImageForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MySimpleImageForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MySimpleImageForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MySimpleImageForm> createState() =>
      _MySimpleImageFormState(formAction);
}

class _MySimpleImageFormState extends State<_MySimpleImageForm> {
  final FormAction? formAction;
  late SimpleImageFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _image;

  _MySimpleImageFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<SimpleImageFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<SimpleImageFormBloc, SimpleImageFormState>(
        builder: (context, state) {
      if (state is SimpleImageFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is SimpleImageFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _descriptionController.text = state.value!.description.toString();
        if (state.value!.image != null) {
          _image = state.value!.image!.documentID;
        } else {
          _image = "";
        }
      }
      if (state is SimpleImageFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

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
                validator: (_) => state is DocumentIDSimpleImageFormError
                    ? state.message
                    : null,
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
                validator: (_) => state is DescriptionSimpleImageFormError
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
                .groupTitle(widget.app, context, 'Image')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "platformMediums",
              value: _image,
              trigger: (value, privilegeLevel) => _onImageSelected(value),
              optional: false),
        );

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
                        if (state is SimpleImageFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<SimpleImageListBloc>(context)
                                .add(UpdateSimpleImageList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              image: state.value!.image,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<SimpleImageListBloc>(context)
                                .add(AddSimpleImageList(
                                    value: SimpleImageModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              image: state.value!.image,
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
        .add(ChangedSimpleImageDocumentID(value: _documentIDController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc
        .add(ChangedSimpleImageDescription(value: _descriptionController.text));
  }

  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedSimpleImageImage(value: val));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, SimpleImageFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
