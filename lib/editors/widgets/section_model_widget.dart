import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/state/access_determined.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core/core/registry.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:eliud_pkg_fundamentals/editors/bloc/section_bloc.dart';
import 'package:eliud_pkg_fundamentals/editors/widgets/relative_image_position.dart';
import 'package:eliud_pkg_fundamentals/editors/widgets/section_image_alignment.dart';
import 'package:eliud_pkg_fundamentals/model/link_model.dart';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'link_model_widget.dart';

typedef void SectionModelCallback(SectionModel sectionModel);

class SectionModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  //final SectionModel sectionModel;
  final SectionModelCallback sectionModelCallback;
  final int containerPrivilege;

  SectionModelWidget._({
    Key? key,
    required this.app,
    required this.create,
    required this.widgetWidth,
    required this.widgetHeight,
//    required this.sectionModel,
    required this.sectionModelCallback,
    required this.containerPrivilege,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SectionModelWidgetState();
  }

  static Widget getIt(
      BuildContext context,
      AppModel app,
      bool create,
      double widgetWidth,
      double widgetHeight,
      SectionModel sectionModel,
      SectionModelCallback sectionModelCallback,
      int containerPrivilege) {
    //var copyOf = sectionModel.copyWith();
    return SectionModelWidget._(
      app: app,
      create: create,
      widgetWidth: widgetWidth,
      widgetHeight: widgetHeight,
      //sectionModel: copyOf,
      sectionModelCallback: sectionModelCallback,
      containerPrivilege: containerPrivilege,
    );
  }
}

class _SectionModelWidgetState extends State<SectionModelWidget> {
  int? currentPrivilegeLevel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessBloc, AccessState>(
        builder: (aContext, accessState) {
      if (accessState is AccessDetermined) {
        return BlocBuilder<SectionBloc, ExtEditorBaseState<SectionModel>>(
            builder: (ppContext, sectionState) {
          if (sectionState is ExtEditorBaseInitialised<SectionModel, dynamic>) {
            return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HeaderWidget(
                    app: widget.app,
                    cancelAction: () async {
                      return true;
                    },
                    okAction: () async {
                      widget.sectionModelCallback(sectionState.model);
                      return true;
                    },
                    title: 'Section',
                  ),
                  divider(widget.app, context),
                  topicContainer(widget.app, context,
                      title: 'General',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        getListTile(context, widget.app,
                            leading: Icon(Icons.vpn_key),
                            title: text(widget.app, context,
                                sectionState.model.documentID!)),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: sectionState.model.title,
                              valueChanged: (value) {
                                sectionState.model.title = value;
                              },
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Title',
                                labelText: 'Title',
                              ),
                            )),
                        getListTile(context, widget.app,
                            leading: Icon(Icons.description),
                            title: dialogField(
                              widget.app,
                              context,
                              initialValue: sectionState.model.description,
                              valueChanged: (value) {
                                sectionState.model.description = value;
                              },
                              maxLines: 5,
                              decoration: const InputDecoration(
                                hintText: 'Description',
                                labelText: 'Description',
                              ),
                            )),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Links',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        _links(sectionState),
                      ]),
                  topicContainer(widget.app, context,
                      title: 'Image',
                      collapsible: true,
                      collapsed: true,
                      children: [
                        topicContainer(widget.app, context,
                            title: 'Image',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              Registry.registry()!
                                  .getMediumApi()
                                  .getPlatformPhotoWidget(
                                    context: context,
                                    feedbackFunction: (mediumModel) {
                                      setState(() {
                                        sectionState.model.image = mediumModel;
                                      });
                                    },
                                    app: widget.app,
                                    initialImage: sectionState.model.image,
                                  ),
                            ]),
                        topicContainer(widget.app, context,
                            title: 'Relative position',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              RelativeImagePositionWidget(
                                relativeImagePosition:
                                    sectionState.model.imagePositionRelative ??
                                        RelativeImagePosition.Behind,
                                relativeImagePositionCallback:
                                    (RelativeImagePosition
                                        relativeImagePosition) {
                                  sectionState.model.imagePositionRelative =
                                      relativeImagePosition;
                                },
                                app: widget.app,
                              ),
                            ]),
                        topicContainer(widget.app, context,
                            title: 'Alignment',
                            collapsible: true,
                            collapsed: true,
                            children: [
                              SectionImageAlignmentWidget(
                                sectionImageAlignment:
                                    sectionState.model.imageAlignment ??
                                        SectionImageAlignment.Center,
                                sectionImageAlignmentCallback:
                                    (SectionImageAlignment value) {
                                  sectionState.model.imageAlignment = value;
                                },
                                app: widget.app,
                              ),
                            ]),
                      ]),
                ]);
          } else {
            return progressIndicator(widget.app, context);
          }
        });
      } else {
        return progressIndicator(widget.app, context);
      }
    });
  }

  Widget _links(ExtEditorBaseInitialised<SectionModel, dynamic> state) {
    List<LinkModel> items = state.model.links != null ? state.model.links! : [];
    return Container(
      height: 150,
      child: ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
        Container(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                //separatorBuilder: (context, index) => divider(widget.app, context),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final value = items[index];
                  return getListTile(
                    context,
                    widget.app,
                    title: text(
                        widget.app,
                        context,
                        (value.documentID ?? 'no documentID') +
                            ' - ' +
                            (value.linkText ?? ' no text')),
                    trailing: popupMenuButton<int>(
                        widget.app, context,
                        child: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                              popupMenuItem(
                                widget.app, context,
                                value: 1,
                                label: 'Update',
                              ),
                              popupMenuItem(
                                widget.app, context,
                                value: 2,
                                label: 'Delete',
                              ),
                            ],
                        onSelected: (selectedValue) {
                          if (selectedValue == 1) {
                            open(
                                value,
                                (newItem) =>
                                    BlocProvider.of<SectionBloc>(context).add(
                                        UpdateItemEvent<SectionModel,
                                                LinkModel>(
                                            oldItem: value, newItem: newItem)),
                                widget.containerPrivilege);
                          } else if (selectedValue == 2) {
                            BlocProvider.of<SectionBloc>(context).add(
                                DeleteItemEvent<SectionModel, LinkModel>(
                                    itemModel: value));
                          }
                        }),
                  );
                })),
        divider(
          widget.app,
          context,
        ),
        Row(children: [
          Spacer(),
          button(
            widget.app,
            context,
            icon: Icon(
              Icons.add,
            ),
            label: 'Add',
            onPressed: () {
              open(
                  LinkModel(
                    documentID: newRandomKey(),
                  ),
                  (newItem) => BlocProvider.of<SectionBloc>(context)
                      .add(AddItemEvent(itemModel: newItem)),
                  widget.containerPrivilege);
            },
          ),
          Spacer(),
        ])
      ]),
    );
  }

  void open(LinkModel value, LinkModelCallback memberActionModelCallback,
      int privilegeContainer) {
    openFlexibleDialog(
      widget.app,
      context,
      widget.app.documentID! + '/_linkmodel',
      includeHeading: false,
      widthFraction: .8,
      child: LinkModelWidget.getIt(
          context,
          widget.app,
          false,
          fullScreenWidth(context) * .8,
          fullScreenHeight(context) - 100,
          value,
          memberActionModelCallback,
          privilegeContainer),
    );
  }
}
