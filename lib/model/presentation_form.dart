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

import 'package:eliud_pkg_fundamentals/model/presentation_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_model.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/presentation_form_state.dart';


class PresentationForm extends StatelessWidget {
  FormAction formAction;
  PresentationModel? value;
  ActionModel? submitAction;

  PresentationForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<PresentationFormBloc >(
            create: (context) => PresentationFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialisePresentationFormEvent(value: value)),
  
        child: MyPresentationForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<PresentationFormBloc >(
            create: (context) => PresentationFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialisePresentationFormNoLoadEvent(value: value)),
  
        child: MyPresentationForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().constructAppBar(context, formAction == FormAction.UpdateAction ? 'Update Presentation' : 'Add Presentation'),
        body: BlocProvider<PresentationFormBloc >(
            create: (context) => PresentationFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialisePresentationFormEvent(value: value) : InitialiseNewPresentationFormEvent())),
  
        child: MyPresentationForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyPresentationForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyPresentationForm({this.formAction, this.submitAction});

  _MyPresentationFormState createState() => _MyPresentationFormState(this.formAction);
}


class _MyPresentationFormState extends State<MyPresentationForm> {
  final FormAction? formAction;
  late PresentationFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
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
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _imagePositionRelativeSelectedRadioTile = 0;
    _imageAlignmentSelectedRadioTile = 0;
    _imageWidthController.addListener(_onImageWidthChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<PresentationFormBloc, PresentationFormState>(builder: (context, state) {
      if (state is PresentationFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is PresentationFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.title != null)
          _titleController.text = state.value!.title.toString();
        else
          _titleController.text = "";
        if (state.value!.image != null)
          _image= state.value!.image!.documentID;
        else
          _image= "";
        if (state.value!.imagePositionRelative != null)
          _imagePositionRelativeSelectedRadioTile = state.value!.imagePositionRelative!.index;
        else
          _imagePositionRelativeSelectedRadioTile = 0;
        if (state.value!.imageAlignment != null)
          _imageAlignmentSelectedRadioTile = state.value!.imageAlignment!.index;
        else
          _imageAlignmentSelectedRadioTile = 0;
        if (state.value!.imageWidth != null)
          _imageWidthController.text = state.value!.imageWidth.toString();
        else
          _imageWidthController.text = "";
      }
      if (state is PresentationFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Document ID', Icons.vpn_key, (formAction == FormAction.UpdateAction), _documentIDController, FieldType.String, validator: (_) => state is DocumentIDPresentationFormError ? state.message : null, hintText: 'null')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Title', Icons.text_format, _readOnly(accessState, state), _titleController, FieldType.String, validator: (_) => state is TitlePresentationFormError ? state.message : null, hintText: 'null')
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, 'Image Width (% of screen width)', Icons.text_format, _readOnly(accessState, state), _imageWidthController, FieldType.Double, validator: (_) => state is ImageWidthPresentationFormError ? state.message : null, hintText: 'Width of the image')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Components')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: bodyComponentsList(context, state.value!.bodyComponents, _onBodyComponentsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Optional Image')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberMediums", value: _image, trigger: _onImageSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Relative position of the image')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _imagePositionRelativeSelectedRadioTile, 'Behind', 'Behind', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionImagePositionRelative(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _imagePositionRelativeSelectedRadioTile, 'InFront', 'InFront', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionImagePositionRelative(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _imagePositionRelativeSelectedRadioTile, 'Below', 'Below', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionImagePositionRelative(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _imagePositionRelativeSelectedRadioTile, 'Above', 'Above', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionImagePositionRelative(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _imagePositionRelativeSelectedRadioTile, 'Aside', 'Aside', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionImagePositionRelative(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Alignment of the image')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _imageAlignmentSelectedRadioTile, 'Left', 'Left', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionImageAlignment(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _imageAlignmentSelectedRadioTile, 'Center', 'Center', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionImageAlignment(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _imageAlignmentSelectedRadioTile, 'Right', 'Right', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionImageAlignment(val))
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
                    if (state is PresentationFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<PresentationListBloc>(context).add(
                          UpdatePresentationList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              bodyComponents: state.value!.bodyComponents, 
                              image: state.value!.image, 
                              imagePositionRelative: state.value!.imagePositionRelative, 
                              imageAlignment: state.value!.imageAlignment, 
                              imageWidth: state.value!.imageWidth, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<PresentationListBloc>(context).add(
                          AddPresentationList(value: PresentationModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              bodyComponents: state.value!.bodyComponents, 
                              image: state.value!.image, 
                              imagePositionRelative: state.value!.imagePositionRelative, 
                              imageAlignment: state.value!.imageAlignment, 
                              imageWidth: state.value!.imageWidth, 
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
    _myFormBloc.add(ChangedPresentationDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedPresentationAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedPresentationTitle(value: _titleController.text));
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
    _myFormBloc.add(ChangedPresentationImagePositionRelative(value: toPresentationRelativeImagePosition(val)));
  }


  void setSelectionImageAlignment(int? val) {
    setState(() {
      _imageAlignmentSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPresentationImageAlignment(value: toPresentationImageAlignment(val)));
  }


  void _onImageWidthChanged() {
    _myFormBloc.add(ChangedPresentationImageWidth(value: _imageWidthController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    _imageWidthController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, PresentationFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



