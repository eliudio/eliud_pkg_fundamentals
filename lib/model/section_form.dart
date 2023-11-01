/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 section_form.dart
                       
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
import 'package:eliud_pkg_fundamentals/model/embedded_component.dart';

import 'package:eliud_core/tools/enums.dart';

import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_pkg_fundamentals/model/model_export.dart';

import 'package:eliud_pkg_fundamentals/model/section_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/section_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';
import 'package:eliud_pkg_fundamentals/model/section_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/section_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/section_form_state.dart';


class SectionForm extends StatelessWidget {
  final AppModel app;
  FormAction formAction;
  SectionModel? value;
  ActionModel? submitAction;

  SectionForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<SectionFormBloc >(
            create: (context) => SectionFormBloc(appId,
                                       
                                                )..add(InitialiseSectionFormEvent(value: value)),
  
        child: MySectionForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<SectionFormBloc >(
            create: (context) => SectionFormBloc(appId,
                                       
                                                )..add(InitialiseSectionFormNoLoadEvent(value: value)),
  
        child: MySectionForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Section' : 'Add Section'),
        body: BlocProvider<SectionFormBloc >(
            create: (context) => SectionFormBloc(appId,
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseSectionFormEvent(value: value) : InitialiseNewSectionFormEvent())),
  
        child: MySectionForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MySectionForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MySectionForm({required this.app, this.formAction, this.submitAction});

  _MySectionFormState createState() => _MySectionFormState(this.formAction);
}


class _MySectionFormState extends State<MySectionForm> {
  final FormAction? formAction;
  late SectionFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _image;
  int? _imagePositionRelativeSelectedRadioTile;
  int? _imageAlignmentSelectedRadioTile;
  final TextEditingController _imageWidthController = TextEditingController();


  _MySectionFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<SectionFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _imagePositionRelativeSelectedRadioTile = 0;
    _imageAlignmentSelectedRadioTile = 0;
    _imageWidthController.addListener(_onImageWidthChanged);
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<SectionFormBloc, SectionFormState>(builder: (context, state) {
      if (state is SectionFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
      );

      if (state is SectionFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.title != null)
          _titleController.text = state.value!.title.toString();
        else
          _titleController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
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
      if (state is SectionFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Title', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _titleController, keyboardType: TextInputType.text, validator: (_) => state is TitleSectionFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionSectionFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Image Width (% of screen width)', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _imageWidthController, keyboardType: TextInputType.number, validator: (_) => state is ImageWidthSectionFormError ? state.message : null, hintText: 'field.remark')
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
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Relative position of the image')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _imagePositionRelativeSelectedRadioTile, 'Behind', 'Behind', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionImagePositionRelative(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _imagePositionRelativeSelectedRadioTile, 'InFront', 'InFront', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionImagePositionRelative(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _imagePositionRelativeSelectedRadioTile, 'Below', 'Below', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionImagePositionRelative(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _imagePositionRelativeSelectedRadioTile, 'Above', 'Above', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionImagePositionRelative(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _imagePositionRelativeSelectedRadioTile, 'Aside', 'Aside', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionImagePositionRelative(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Alignment of the image')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _imageAlignmentSelectedRadioTile, 'Left', 'Left', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionImageAlignment(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _imageAlignmentSelectedRadioTile, 'Center', 'Center', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionImageAlignment(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _imageAlignmentSelectedRadioTile, 'Right', 'Right', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionImageAlignment(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Chapter Links')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: linksList(widget.app, context, state.value!.links, _onLinksChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is SectionFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<SectionListBloc>(context).add(
                          UpdateSectionList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              title: state.value!.title, 
                              description: state.value!.description, 
                              image: state.value!.image, 
                              imagePositionRelative: state.value!.imagePositionRelative, 
                              imageAlignment: state.value!.imageAlignment, 
                              imageWidth: state.value!.imageWidth, 
                              links: state.value!.links, 
                        )));
                      } else {
                        BlocProvider.of<SectionListBloc>(context).add(
                          AddSectionList(value: SectionModel(
                              documentID: state.value!.documentID, 
                              title: state.value!.title, 
                              description: state.value!.description, 
                              image: state.value!.image, 
                              imagePositionRelative: state.value!.imagePositionRelative, 
                              imageAlignment: state.value!.imageAlignment, 
                              imageWidth: state.value!.imageWidth, 
                              links: state.value!.links, 
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
    _myFormBloc.add(ChangedSectionDocumentID(value: _documentIDController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedSectionTitle(value: _titleController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedSectionDescription(value: _descriptionController.text));
  }


  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedSectionImage(value: val));
  }


  void setSelectionImagePositionRelative(int? val) {
    setState(() {
      _imagePositionRelativeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedSectionImagePositionRelative(value: toRelativeImagePosition(val)));
  }


  void setSelectionImageAlignment(int? val) {
    setState(() {
      _imageAlignmentSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedSectionImageAlignment(value: toSectionImageAlignment(val)));
  }


  void _onImageWidthChanged() {
    _myFormBloc.add(ChangedSectionImageWidth(value: _imageWidthController.text));
  }


  void _onLinksChanged(value) {
    _myFormBloc.add(ChangedSectionLinks(value: value));
    setState(() {});
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _imageWidthController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, SectionFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



