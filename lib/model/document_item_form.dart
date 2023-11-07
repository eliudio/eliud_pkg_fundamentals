/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_item_form.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/document_item_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_item_form_state.dart';

class DocumentItemForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final DocumentItemModel? value;
  final ActionModel? submitAction;

  DocumentItemForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the DocumentItemForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<DocumentItemFormBloc>(
        create: (context) => DocumentItemFormBloc(
          appId,
        )..add(InitialiseDocumentItemFormEvent(value: value)),
        child: MyDocumentItemForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<DocumentItemFormBloc>(
        create: (context) => DocumentItemFormBloc(
          appId,
        )..add(InitialiseDocumentItemFormNoLoadEvent(value: value)),
        child: MyDocumentItemForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update DocumentItem'
                      : 'Add DocumentItem'),
          body: BlocProvider<DocumentItemFormBloc>(
            create: (context) => DocumentItemFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseDocumentItemFormEvent(value: value)
                : InitialiseNewDocumentItemFormEvent())),
            child: MyDocumentItemForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class MyDocumentItemForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDocumentItemForm({required this.app, this.formAction, this.submitAction});

  @override
  State<MyDocumentItemForm> createState() =>
      _MyDocumentItemFormState(formAction);
}

class _MyDocumentItemFormState extends State<MyDocumentItemForm> {
  final FormAction? formAction;
  late DocumentItemFormBloc _myFormBloc;

  final TextEditingController _referenceController = TextEditingController();
  String? _image;

  _MyDocumentItemFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DocumentItemFormBloc>(context);
    _referenceController.addListener(_onReferenceChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DocumentItemFormBloc, DocumentItemFormState>(
        builder: (context, state) {
      if (state is DocumentItemFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is DocumentItemFormLoaded) {
        _referenceController.text = state.value!.reference.toString();
        if (state.value!.image != null) {
          _image = state.value!.image!.documentID;
        } else {
          _image = "";
        }
      }
      if (state is DocumentItemFormInitialized) {
        List<Widget> children = [];
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document Reference',
                icon: Icons.vpn_key,
                readOnly: _readOnly(accessState, state),
                textEditingController: _referenceController,
                keyboardType: TextInputType.text,
                validator: (_) => state is ReferenceDocumentItemFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "platformMediums",
              value: _image,
              trigger: (value, privilegeLevel) => _onImageSelected(value),
              optional: false),
        );

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
                        if (state is DocumentItemFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<DocumentItemListBloc>(context)
                                .add(UpdateDocumentItemList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              reference: state.value!.reference,
                              image: state.value!.image,
                            )));
                          } else {
                            BlocProvider.of<DocumentItemListBloc>(context)
                                .add(AddDocumentItemList(
                                    value: DocumentItemModel(
                              documentID: state.value!.documentID,
                              reference: state.value!.reference,
                              image: state.value!.image,
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

  void _onReferenceChanged() {
    _myFormBloc
        .add(ChangedDocumentItemReference(value: _referenceController.text));
  }

  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedDocumentItemImage(value: val));
  }

  @override
  void dispose() {
    _referenceController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(AccessState accessState, DocumentItemFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!accessState.memberIsOwner(widget.app.documentID));
  }
}
