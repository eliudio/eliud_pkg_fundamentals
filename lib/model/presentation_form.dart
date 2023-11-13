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

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/style/style_registry.dart';

import 'package:eliud_core/model/internal_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/presentation_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_form_state.dart';

class PresentationForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final PresentationModel? value;
  final ActionModel? submitAction;

  PresentationForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the PresentationForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<PresentationFormBloc>(
        create: (context) => PresentationFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePresentationFormEvent(value: value)),
        child: _MyPresentationForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<PresentationFormBloc>(
        create: (context) => PresentationFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePresentationFormNoLoadEvent(value: value)),
        child: _MyPresentationForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Presentation'
                      : 'Add Presentation'),
          body: BlocProvider<PresentationFormBloc>(
            create: (context) => PresentationFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialisePresentationFormEvent(value: value)
                : InitialiseNewPresentationFormEvent())),
            child: _MyPresentationForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyPresentationForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyPresentationForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyPresentationForm> createState() =>
      _MyPresentationFormState(formAction);
}

class _MyPresentationFormState extends State<_MyPresentationForm> {
  final FormAction? formAction;
  late PresentationFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _image;
  int? _imagePositionRelativeSelectedRadioTile;
  int? _imageAlignmentSelectedRadioTile;
  final TextEditingController _imageWidthController = TextEditingController();

  _MyPresentationFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PresentationFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _imagePositionRelativeSelectedRadioTile = 0;
    _imageAlignmentSelectedRadioTile = 0;
    _imageWidthController.addListener(_onImageWidthChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<PresentationFormBloc, PresentationFormState>(
        builder: (context, state) {
      if (state is PresentationFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is PresentationFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _descriptionController.text = state.value!.description.toString();
        if (state.value!.image != null) {
          _image = state.value!.image!.documentID;
        } else {
          _image = "";
        }
        if (state.value!.imagePositionRelative != null) {
          _imagePositionRelativeSelectedRadioTile =
              state.value!.imagePositionRelative!.index;
        } else {
          _imagePositionRelativeSelectedRadioTile = 0;
        }
        if (state.value!.imageAlignment != null) {
          _imageAlignmentSelectedRadioTile = state.value!.imageAlignment!.index;
        } else {
          _imageAlignmentSelectedRadioTile = 0;
        }
        _imageWidthController.text = state.value!.imageWidth.toString();
      }
      if (state is PresentationFormInitialized) {
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
                validator: (_) => state is DocumentIDPresentationFormError
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
                validator: (_) => state is DescriptionPresentationFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Image Width (% of screen width)',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _imageWidthController,
                keyboardType: TextInputType.number,
                validator: (_) => state is ImageWidthPresentationFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

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
                .groupTitle(widget.app, context, 'Components')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: bodyComponentsList(widget.app, context,
                state.value!.bodyComponents, _onBodyComponentsChanged)));

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
                .groupTitle(widget.app, context, 'Optional Image')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "platformMediums",
              value: _image,
              trigger: (value, privilegeLevel) => _onImageSelected(value),
              optional: true),
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
                .groupTitle(
                    widget.app, context, 'Relative position of the image')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _imagePositionRelativeSelectedRadioTile,
                'behind',
                'behind',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionImagePositionRelative(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _imagePositionRelativeSelectedRadioTile,
                'inFront',
                'inFront',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionImagePositionRelative(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _imagePositionRelativeSelectedRadioTile,
                'below',
                'below',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionImagePositionRelative(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _imagePositionRelativeSelectedRadioTile,
                'above',
                'above',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionImagePositionRelative(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _imagePositionRelativeSelectedRadioTile,
                'aside',
                'aside',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionImagePositionRelative(val)));

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
                .groupTitle(widget.app, context, 'Alignment of the image')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _imageAlignmentSelectedRadioTile,
                'left',
                'left',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionImageAlignment(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _imageAlignmentSelectedRadioTile,
                'center',
                'center',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionImageAlignment(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _imageAlignmentSelectedRadioTile,
                'right',
                'right',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionImageAlignment(val)));

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
                        if (state is PresentationFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<PresentationListBloc>(context)
                                .add(UpdatePresentationList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              bodyComponents: state.value!.bodyComponents,
                              image: state.value!.image,
                              imagePositionRelative:
                                  state.value!.imagePositionRelative,
                              imageAlignment: state.value!.imageAlignment,
                              imageWidth: state.value!.imageWidth,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<PresentationListBloc>(context)
                                .add(AddPresentationList(
                                    value: PresentationModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              bodyComponents: state.value!.bodyComponents,
                              image: state.value!.image,
                              imagePositionRelative:
                                  state.value!.imagePositionRelative,
                              imageAlignment: state.value!.imageAlignment,
                              imageWidth: state.value!.imageWidth,
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
        .add(ChangedPresentationDocumentID(value: _documentIDController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(
        ChangedPresentationDescription(value: _descriptionController.text));
  }

  void _onBodyComponentsChanged(value) {
    _myFormBloc.add(ChangedPresentationBodyComponents(value: value));
    setState(() {});
  }

  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedPresentationImage(value: val));
  }

  void setSelectionImagePositionRelative(int? val) {
    setState(() {
      _imagePositionRelativeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPresentationImagePositionRelative(
        value: toPresentationRelativeImagePosition(val)));
  }

  void setSelectionImageAlignment(int? val) {
    setState(() {
      _imageAlignmentSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPresentationImageAlignment(
        value: toPresentationImageAlignment(val)));
  }

  void _onImageWidthChanged() {
    _myFormBloc
        .add(ChangedPresentationImageWidth(value: _imageWidthController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    _imageWidthController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, PresentationFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
