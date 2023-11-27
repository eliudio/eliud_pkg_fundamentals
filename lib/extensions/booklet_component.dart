import 'package:eliud_core/core/navigate/router.dart' as er;
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/platform_medium_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/booklet_component.dart';
import 'package:eliud_pkg_fundamentals_model/model/booklet_model.dart';
import 'package:eliud_pkg_fundamentals_model/model/section_model.dart';
import 'package:eliud_pkg_fundamentals_model/tools/document_processor_extended.dart';
import 'package:flutter/material.dart';

class BookletComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return BookletComponent(key: key, app: app, bookletId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await bookletRepository(appId: app.documentID)!.get(id);
}

class BookletComponent extends AbstractBookletComponent {
  BookletComponent({super.key, required super.app, required super.bookletId});

  Widget _aBitSpace() => SizedBox(height: 30);

  Widget _makeBox(List<Widget> widgets) {
    Widget groupThis = ConstrainedBox(
        constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 5.0),
        child: ListView(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                textBaseline: TextBaseline.alphabetic,
                textDirection: TextDirection.ltr,
                verticalDirection: VerticalDirection.down,
                children: widgets,
              )
            ]));
    return groupThis;
  }

  Align _toAlignment(
      SectionImageAlignment? sectionImageAlignment, Widget widget) {
    if (sectionImageAlignment == SectionImageAlignment.left) {
      return Align(child: widget, alignment: Alignment.topLeft);
    }
    if (sectionImageAlignment == SectionImageAlignment.right) {
      return Align(child: widget, alignment: Alignment.topRight);
    }

    // default center
    return Align(child: widget, alignment: Alignment.topCenter);
  }

  Widget _addImage(
      BuildContext context,
      List<Widget> widgets,
      PlatformMediumModel? image,
      RelativeImagePosition? relativeImagePosition,
      SectionImageAlignment? sectionImageAlignment,
      double? imageSize) {
    //var state = AccessBloc.getState(context);
    if (image == null) {
      return _makeBox(widgets);
    }

    if ((relativeImagePosition == null) ||
        (relativeImagePosition == RelativeImagePosition.unknown)) {
      relativeImagePosition = RelativeImagePosition.above;
    }
    if ((sectionImageAlignment == null) ||
        (sectionImageAlignment == SectionImageAlignment.unknown)) {
      sectionImageAlignment = SectionImageAlignment.left;
    }

    var widgetImage = Image.network(image.url!, scale: 1);

    if (relativeImagePosition == RelativeImagePosition.aside) {
      if (sectionImageAlignment == SectionImageAlignment.left) {
        return Table(border: null, children: [
          TableRow(children: [
            Column(children: [
              widgetImage,
            ]),
            Column(children: [_makeBox(widgets)]),
          ])
        ]);
      } else if (sectionImageAlignment == SectionImageAlignment.center) {
        return Table(border: null, children: [
          TableRow(children: [
            Column(children: [_makeBox(widgets)]),
            Column(children: [widgetImage]),
            Container(height: 1),
          ])
        ]);
      } else {
        return Table(border: null, children: [
          TableRow(children: [
            Column(children: [_makeBox(widgets)]),
            Column(children: [widgetImage]),
          ])
        ]);
      }
    }

    Widget alignedWidget = _toAlignment(sectionImageAlignment, widgetImage);
    if (relativeImagePosition == RelativeImagePosition.below) {
      widgets.add(alignedWidget);
      return _makeBox(widgets);
    }
    if (relativeImagePosition == RelativeImagePosition.above) {
      var newList = <Widget>[];
      newList.add(alignedWidget);
      newList.addAll(widgets);
      return _makeBox(newList);
    }
    if (relativeImagePosition == RelativeImagePosition.behind) {
      return Stack(children: <Widget>[
        alignedWidget,
        _makeBox(widgets),
      ]);
    }
    if (relativeImagePosition == RelativeImagePosition.inFront) {
      return Stack(children: <Widget>[
        _makeBox(widgets),
        alignedWidget,
      ]);
    }

    // error, not expecting this. Anyhu... return the box, just the box, drop the image
    return _makeBox(widgets);
  }

  @override
  Widget yourWidget(BuildContext context, BookletModel? value) {
    //var accessState = AccessBloc.getState(context);
    var documentParameterProcessor = ExtendedDocumentParameterProcessor(
      context,
      app,
    );

    var groupedWidgets = <Widget>[];

    for (var element in value!.sections!) {
      var widgets = <Widget>[];
      widgets.add(h3(app, context,
          documentParameterProcessor.process(element.title ?? '')));
      widgets.add(_aBitSpace());
      widgets.add(text(app, context,
          documentParameterProcessor.process(element.description ?? '')));
      widgets.add(_aBitSpace());
      if (element.links != null && element.links!.isNotEmpty) {
        var children = <Widget>[];
        for (var link in element.links!) {
          children.add(button(
            app,
            context,
            label: link.linkText!,
            onPressed: () {
              er.Router.navigateTo(context, link.action!);
            },
          ));
        }
        widgets.add(Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: children,
        ));
        widgets.add(_aBitSpace());
      }

      groupedWidgets.add(_addImage(
          context,
          widgets,
          element.image,
          element.imagePositionRelative,
          element.imageAlignment,
          element.imageWidth));
    }

    return ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: groupedWidgets);
  }
}
