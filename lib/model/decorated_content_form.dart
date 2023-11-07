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

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/decorated_content_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_model.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/decorated_content_form_state.dart';

class DecoratedContentForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final DecoratedContentModel? value;
  final ActionModel? submitAction;

  DecoratedContentForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the DecoratedContentForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<DecoratedContentFormBloc>(
        create: (context) => DecoratedContentFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseDecoratedContentFormEvent(value: value)),
        child: MyDecoratedContentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<DecoratedContentFormBloc>(
        create: (context) => DecoratedContentFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseDecoratedContentFormNoLoadEvent(value: value)),
        child: MyDecoratedContentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update DecoratedContent'
                      : 'Add DecoratedContent'),
          body: BlocProvider<DecoratedContentFormBloc>(
            create: (context) => DecoratedContentFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseDecoratedContentFormEvent(value: value)
                : InitialiseNewDecoratedContentFormEvent())),
            child: MyDecoratedContentForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyDecoratedContentForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDecoratedContentForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<MyDecoratedContentForm> createState() =>
      _MyDecoratedContentFormState(formAction);
}

class _MyDecoratedContentFormState extends State<MyDecoratedContentForm> {
  final FormAction? formAction;
  late DecoratedContentFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? _decorationComponentPositionSelectedRadioTile;
  final TextEditingController _percentageDecorationVisibleController =
      TextEditingController();

  _MyDecoratedContentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DecoratedContentFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _decorationComponentPositionSelectedRadioTile = 0;
    _percentageDecorationVisibleController
        .addListener(_onPercentageDecorationVisibleChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DecoratedContentFormBloc, DecoratedContentFormState>(
        builder: (context, state) {
      if (state is DecoratedContentFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is DecoratedContentFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _descriptionController.text = state.value!.description.toString();
        if (state.value!.decorationComponentPosition != null) {
          _decorationComponentPositionSelectedRadioTile =
              state.value!.decorationComponentPosition!.index;
        } else {
          _decorationComponentPositionSelectedRadioTile = 0;
        }
        _percentageDecorationVisibleController.text =
            state.value!.percentageDecorationVisible.toString();
      }
      if (state is DecoratedContentFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(ExtensionTypeField(
            widget.app,
            state.value!.decoratingComponentName,
            _onDecoratingComponentNameChanged));

        children.add(ComponentIdField(widget.app,
            componentName: state.value!.decoratingComponentName,
            originalValue: state.value!.decoratingComponentId,
            trigger: (value, _) => _onDecoratingComponentIdChanged(value)));

        children.add(ExtensionTypeField(widget.app,
            state.value!.contentComponentName, _onContentComponentNameChanged));

        children.add(ComponentIdField(widget.app,
            componentName: state.value!.contentComponentName,
            originalValue: state.value!.contentComponentId,
            trigger: (value, _) => _onContentComponentIdChanged(value)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Percentage Decoration Visible',
                icon: Icons.text_format,
                readOnly: _readOnly(accessState, state),
                textEditingController: _percentageDecorationVisibleController,
                keyboardType: TextInputType.number,
                validator: (_) => state
                        is PercentageDecorationVisibleDecoratedContentFormError
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
                validator: (_) => state is DocumentIDDecoratedContentFormError
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
                validator: (_) => state is DescriptionDecoratedContentFormError
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
                .groupTitle(widget.app, context, 'Conditions')));

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

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _decorationComponentPositionSelectedRadioTile,
                'leftIfSpaceAvailableOtherwiseTop',
                'leftIfSpaceAvailableOtherwiseTop',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) =>
                        setSelectionDecorationComponentPosition(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _decorationComponentPositionSelectedRadioTile,
                'leftIfSpaceAvailableOtherwiseDrop',
                'leftIfSpaceAvailableOtherwiseDrop',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) =>
                        setSelectionDecorationComponentPosition(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _decorationComponentPositionSelectedRadioTile,
                'leftIfSpaceAvailableOtherwiseBottom',
                'leftIfSpaceAvailableOtherwiseBottom',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) =>
                        setSelectionDecorationComponentPosition(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _decorationComponentPositionSelectedRadioTile,
                'rightIfSpaceAvailableOtherwiseTop',
                'rightIfSpaceAvailableOtherwiseTop',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) =>
                        setSelectionDecorationComponentPosition(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _decorationComponentPositionSelectedRadioTile,
                'rightIfSpaceAvailableOtherwiseDrop',
                'rightIfSpaceAvailableOtherwiseDrop',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) =>
                        setSelectionDecorationComponentPosition(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _decorationComponentPositionSelectedRadioTile,
                'rightIfSpaceAvailableOtherwiseBottom',
                'rightIfSpaceAvailableOtherwiseBottom',
                !accessState.memberIsOwner(widget.app.documentID)
                    ? null
                    : (dynamic val) =>
                        setSelectionDecorationComponentPosition(val)));

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
                        if (state is DecoratedContentFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<DecoratedContentListBloc>(context)
                                .add(UpdateDecoratedContentList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              decoratingComponentName:
                                  state.value!.decoratingComponentName,
                              decoratingComponentId:
                                  state.value!.decoratingComponentId,
                              contentComponentName:
                                  state.value!.contentComponentName,
                              contentComponentId:
                                  state.value!.contentComponentId,
                              decorationComponentPosition:
                                  state.value!.decorationComponentPosition,
                              percentageDecorationVisible:
                                  state.value!.percentageDecorationVisible,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<DecoratedContentListBloc>(context)
                                .add(AddDecoratedContentList(
                                    value: DecoratedContentModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              decoratingComponentName:
                                  state.value!.decoratingComponentName,
                              decoratingComponentId:
                                  state.value!.decoratingComponentId,
                              contentComponentName:
                                  state.value!.contentComponentName,
                              contentComponentId:
                                  state.value!.contentComponentId,
                              decorationComponentPosition:
                                  state.value!.decorationComponentPosition,
                              percentageDecorationVisible:
                                  state.value!.percentageDecorationVisible,
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
    _myFormBloc.add(
        ChangedDecoratedContentDocumentID(value: _documentIDController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(
        ChangedDecoratedContentDescription(value: _descriptionController.text));
  }

  void _onDecoratingComponentNameChanged(value) {
    _myFormBloc
        .add(ChangedDecoratedContentDecoratingComponentName(value: value));
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
    _myFormBloc.add(ChangedDecoratedContentDecorationComponentPosition(
        value: toDecorationComponentPosition(val)));
  }

  void _onPercentageDecorationVisibleChanged() {
    _myFormBloc.add(ChangedDecoratedContentPercentageDecorationVisible(
        value: _percentageDecorationVisibleController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    _percentageDecorationVisibleController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(
      AccessState accessState, DecoratedContentFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
