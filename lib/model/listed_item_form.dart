/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 listed_item_form.dart
                       
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

import 'package:eliud_pkg_fundamentals/model/listed_item_list_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_list_event.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_form_bloc.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_form_event.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_form_state.dart';


class ListedItemForm extends StatelessWidget {
  FormAction formAction;
  ListedItemModel? value;
  ActionModel? submitAction;

  ListedItemForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<ListedItemFormBloc >(
            create: (context) => ListedItemFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseListedItemFormEvent(value: value)),
  
        child: MyListedItemForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<ListedItemFormBloc >(
            create: (context) => ListedItemFormBloc(AccessBloc.appId(context),
                                       
                                                )..add(InitialiseListedItemFormNoLoadEvent(value: value)),
  
        child: MyListedItemForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update ListedItem' : 'Add ListedItem'),
        body: BlocProvider<ListedItemFormBloc >(
            create: (context) => ListedItemFormBloc(AccessBloc.appId(context),
                                       
                                                )..add((formAction == FormAction.UpdateAction ? InitialiseListedItemFormEvent(value: value) : InitialiseNewListedItemFormEvent())),
  
        child: MyListedItemForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyListedItemForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyListedItemForm({this.formAction, this.submitAction});

  _MyListedItemFormState createState() => _MyListedItemFormState(this.formAction);
}


class _MyListedItemFormState extends State<MyListedItemForm> {
  final FormAction? formAction;
  late ListedItemFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _image;
  String? _posSize;


  _MyListedItemFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ListedItemFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<ListedItemFormBloc, ListedItemFormState>(builder: (context, state) {
      if (state is ListedItemFormUninitialized) return Center(
        child: DelayedCircularProgressIndicator(),
      );

      if (state is ListedItemFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.description != null)
          _descriptionController.text = state.value!.description.toString();
        else
          _descriptionController.text = "";
        if (state.value!.image != null)
          _image= state.value!.image!.documentID;
        else
          _image= "";
        if (state.value!.posSize != null)
          _posSize= state.value!.posSize!.documentID;
        else
          _posSize= "";
      }
      if (state is ListedItemFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'description', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _descriptionController, keyboardType: TextInputType.text, validator: (_) => state is DescriptionListedItemFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Action')
                ));

        children.add(

                ActionField(AccessBloc.appId(context), state.value!.action, _onActionChanged)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Image')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "memberMediums", value: _image, trigger: _onImageSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Position and Size')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "posSizes", value: _posSize, trigger: _onPosSizeSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is ListedItemFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<ListedItemListBloc>(context).add(
                          UpdateListedItemList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              description: state.value!.description, 
                              action: state.value!.action, 
                              image: state.value!.image, 
                              posSize: state.value!.posSize, 
                        )));
                      } else {
                        BlocProvider.of<ListedItemListBloc>(context).add(
                          AddListedItemList(value: ListedItemModel(
                              documentID: state.value!.documentID, 
                              description: state.value!.description, 
                              action: state.value!.action, 
                              image: state.value!.image, 
                              posSize: state.value!.posSize, 
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
    _myFormBloc.add(ChangedListedItemDocumentID(value: _documentIDController.text));
  }


  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedListedItemDescription(value: _descriptionController.text));
  }


  void _onActionChanged(value) {
    _myFormBloc.add(ChangedListedItemAction(value: value));
    
  }


  void _onImageSelected(String? val) {
    setState(() {
      _image = val;
    });
    _myFormBloc.add(ChangedListedItemImage(value: val));
  }


  void _onPosSizeSelected(String? val) {
    setState(() {
      _posSize = val;
    });
    _myFormBloc.add(ChangedListedItemPosSize(value: val));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, ListedItemFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



