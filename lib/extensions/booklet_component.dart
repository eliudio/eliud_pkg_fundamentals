import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_component.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/core/navigate/router.dart' as EliudRouter;
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/tools/document_processor_extended.dart';
import 'package:flutter/material.dart';

class BookletComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters}) {
    return BookletComponent(bookletID: id);
  }
}

class BookletComponent extends AbstractBookletComponent {
  BookletComponent({String bookletID}) : super(bookletID: bookletID);

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

  Align _toAlignment(SectionImageAlignment sectionImageAlignment, Widget widget) {
    if (sectionImageAlignment == SectionImageAlignment.Left) return Align(child: widget, alignment: Alignment.topLeft);
    if (sectionImageAlignment == SectionImageAlignment.Right) return Align(child: widget, alignment: Alignment.topRight);

    // default center
    return Align(child: widget, alignment: Alignment.topCenter);
  }

  Widget _addImage(BuildContext context, List<Widget> widgets, ImageModel image,
      RelativeImagePosition relativeImagePosition, SectionImageAlignment sectionImageAlignment, double imageSize) {
    if (image == null) {
      return _makeBox(widgets);
    }

    if ((relativeImagePosition == null) || (relativeImagePosition == RelativeImagePosition.Unknown)) relativeImagePosition = RelativeImagePosition.Above;
    if ((sectionImageAlignment == null)  || (sectionImageAlignment == SectionImageAlignment.Unknown)) sectionImageAlignment = SectionImageAlignment.Left;

    double size;
    if (imageSize != null) {
      size = fullScreenWidth(context) * imageSize;
    }
    Widget widgetImage =
        AbstractPlatform.platform.getImage(image: image, width: size);

    if (relativeImagePosition == RelativeImagePosition.Aside) {
      if (sectionImageAlignment == SectionImageAlignment.Left) {
        return Table(border: null, children: [
          TableRow(children: [
            Column(children: [_makeBox(widgets)]),
            Column(children: [
              widgetImage,
            ]),
          ])
        ]);
      } else if (sectionImageAlignment == SectionImageAlignment.Center) {
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
    if (relativeImagePosition == RelativeImagePosition.Below) {
      widgets.add(alignedWidget);
      return _makeBox(widgets);
    }
    if (relativeImagePosition == RelativeImagePosition.Above) {
      List<Widget> newList = new List();
      newList.add(alignedWidget);
      newList.addAll(widgets);
      return _makeBox(newList);
    }
    if (relativeImagePosition == RelativeImagePosition.Behind) {
      return Stack(children: <Widget>[
        alignedWidget,
        _makeBox(widgets),
      ]);
    }
    if (relativeImagePosition == RelativeImagePosition.InFront) {
      return Stack(children: <Widget>[
        _makeBox(widgets),
        alignedWidget,
      ]);
    }

    // error, not expecting this. Anyhu... return the box, just the box, drop the image
    return _makeBox(widgets);
  }

  Widget yourWidget(BuildContext context, BookletModel value) {
    var documentParameterProcessor =
        ExtendedDocumentParameterProcessor(context);

    List<Widget> groupedWidgets = List();

    value.sections.forEach((element) {
      List<Widget> widgets = List();

      widgets.add(Text(
        documentParameterProcessor.process(element.title),
        style: FontTools.textStyle(GlobalData.app().h3),
      ));
      widgets.add(_aBitSpace());
      widgets.add(Text(
          documentParameterProcessor.process(element.description),
          style: FontTools.textStyle(GlobalData.app().fontText)));
      widgets.add(_aBitSpace());
      if (element.links != null && element.links.length > 0) {
        List<Widget> children = List();
        element.links.forEach((link) {
          children.add(OutlineButton(
              child: new Text(
                link.linkText,
                style: FontTools.textStyle(GlobalData.app().fontLink),
              ),
              onPressed: () {
                EliudRouter.Router.navigateTo(context, link.action);
              },
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))));
        });
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

      groupedWidgets
          .add(_addImage(context, widgets, element.image, element.imagePositionRelative, element.imageAlignment, element.imageWidth));
    });

    return ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: groupedWidgets);
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  BookletRepository getBookletRepository() {
    return AbstractRepositorySingleton.singleton.bookletRepository();
  }
}
