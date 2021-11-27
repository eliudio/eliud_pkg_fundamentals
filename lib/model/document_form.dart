/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 document_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

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

import 'package:eliud_pkg_fundamentals/model/document_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/document_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_model.dart';
import 'package:eliud_pkg_fundamentals/model/document_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/document_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/document_form_state.dart';


class DocumentForm extends StatelessWidget {
  FormAction formAction;
  DocumentModel? value;
  ActionModel? submitAction;

  DocumentForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text("No app available");
    var appId = app.documentID!;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<DocumentFormBloc >(
            create: (context) => DocumentFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseDocumentFormEvent(value: value)),
  
        child: MyDocumentForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<DocumentFormBloc >(
            create: (context) => DocumentFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialiseDocumentFormNoLoadEvent(value: value)),
  
        child: MyDocumentForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update Document' : 'Add Document'),
        body: BlocProvider<DocumentFormBloc >(
            create: (context) => DocumentFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseDocumentFormEvent(value: value) : InitialiseNewDocumentFormEvent())),
  
        child: MyDocumentForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyDocumentForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyDocumentForm({this.formAction, this.submitAction});

  _MyDocumentFormState createState() => _MyDocumentFormState(this.formAction);
}


class _MyDocumentFormState extends State<MyDocumentForm> {
  final FormAction? formAction;
  late DocumentFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  int? _documentRendererSelectedRadioTile;
  final TextEditingController _paddingController = TextEditingController();
  String? _background;


  _MyDocumentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DocumentFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _nameController.addListener(_onNameChanged);
    _documentRendererSelectedRadioTile = 0;
    _paddingController.addListener(_onPaddingChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.currentApp(context);
    if (app == null) return Text('No app available');
    var appId = app.documentID!;
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<DocumentFormBloc, DocumentFormState>(builder: (context, state) {
      if (state is DocumentFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is DocumentFormLoaded) {
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
        if (state.value!.documentRenderer != null)
          _documentRendererSelectedRadioTile = state.value!.documentRenderer!.index;
        else
          _documentRendererSelectedRadioTile = 0;
        if (state.value!.padding != null)
          _paddingController.text = state.value!.padding.toString();
        else
          _paddingController.text = "";
        if (state.value!.background != null)
          _background= state.value!.background!.documentID;
        else
          _background= "";
      }
      if (state is DocumentFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDDocumentFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Name', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _nameController, keyboardType: TextInputType.text, validator: (_) => state is NameDocumentFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Contents')
                ));

        children.add(

                DocumentTextField('Document', state.value!.documentRenderer, state.value!.content, state.value!.images, state.value!.background, _onContentChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Renderer')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _documentRendererSelectedRadioTile, 'flutter_markdown', 'flutter_markdown', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionDocumentRenderer(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _documentRendererSelectedRadioTile, 'dynamic_widget', 'dynamic_widget', !accessState.memberIsOwner(AccessBloc.currentAppId(context)) ? null : (dynamic val) => setSelectionDocumentRenderer(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Layout')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Padding', icon: Icons.border_style, readOnly: _readOnly(accessState, state), textEditingController: _paddingController, keyboardType: TextInputType.number, validator: (_) => state is PaddingDocumentFormError ? state.message : null, hintText: 'field.remark')
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
                    child: documentItemsList(context, state.value!.images, _onImagesChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Background')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(appId: appId, id: "backgrounds", value: _background, trigger: _onBackgroundSelected, optional: true),
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
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is DocumentFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<DocumentListBloc>(context).add(
                          UpdateDocumentList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              documentRenderer: state.value!.documentRenderer, 
                              content: state.value!.content, 
                              padding: state.value!.padding, 
                              images: state.value!.images, 
                              background: state.value!.background, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<DocumentListBloc>(context).add(
                          AddDocumentList(value: DocumentModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              name: state.value!.name, 
                              documentRenderer: state.value!.documentRenderer, 
                              content: state.value!.content, 
                              padding: state.value!.padding, 
                              images: state.value!.images, 
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
        return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedDocumentDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedDocumentAppId(value: _appIdController.text));
  }


  void _onNameChanged() {
    _myFormBloc.add(ChangedDocumentName(value: _nameController.text));
  }


  void setSelectionDocumentRenderer(int? val) {
    setState(() {
      _documentRendererSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedDocumentDocumentRenderer(value: toDocumentRenderer(val)));
  }


  void _onContentChanged(value) {
    _myFormBloc.add(ChangedDocumentContent(value: value));
    
  }


  void _onPaddingChanged() {
    _myFormBloc.add(ChangedDocumentPadding(value: _paddingController.text));
  }


  void _onImagesChanged(value) {
    _myFormBloc.add(ChangedDocumentImages(value: value));
    setState(() {});
  }


  void _onBackgroundSelected(String? val) {
    setState(() {
      _background = val;
    });
    _myFormBloc.add(ChangedDocumentBackground(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _nameController.dispose();
    _paddingController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, DocumentFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(AccessBloc.currentAppId(context)));
  }
  

}



