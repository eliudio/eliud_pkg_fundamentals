import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/navigate/router.dart' as EliudRouter;
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_component.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_model.dart';
import 'package:eliud_pkg_fundamentals/model/booklet_repository.dart';
import 'package:eliud_pkg_fundamentals/model/section_model.dart';
import 'package:eliud_pkg_fundamentals/tools/document_processor_extended.dart';
import 'package:flutter/material.dart';

class BookletComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String id, Map<String, dynamic>? parameters}) {
    return BookletComponent(key: key, bookletID: id);
  }
}

class BookletComponent extends AbstractBookletComponent {
  BookletComponent({Key? key, required String bookletID}) : super(key: key, bookletID: bookletID);

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
    if (sectionImageAlignment == SectionImageAlignment.Left)
      return Align(child: widget, alignment: Alignment.topLeft);
    if (sectionImageAlignment == SectionImageAlignment.Right)
      return Align(child: widget, alignment: Alignment.topRight);

    // default center
    return Align(child: widget, alignment: Alignment.topCenter);
  }

  Widget _addImage(
      BuildContext context,
      List<Widget> widgets,
      MemberMediumModel? image,
      RelativeImagePosition? relativeImagePosition,
      SectionImageAlignment? sectionImageAlignment,
      double? imageSize) {
    var state = AccessBloc.getState(context);
    if (image == null) {
      return _makeBox(widgets);
    }

    if ((relativeImagePosition == null) ||
        (relativeImagePosition == RelativeImagePosition.Unknown))
      relativeImagePosition = RelativeImagePosition.Above;
    if ((sectionImageAlignment == null) ||
        (sectionImageAlignment == SectionImageAlignment.Unknown))
      sectionImageAlignment = SectionImageAlignment.Left;

    double size;
    if (imageSize != null) {
      size = fullScreenWidth(context) * imageSize;
    }
    var widgetImage = Image.network(image.url!, scale: 1);

    if (relativeImagePosition == RelativeImagePosition.Aside) {
      if (sectionImageAlignment == SectionImageAlignment.Left) {
        return Table(border: null, children: [
          TableRow(children: [
            Column(children: [
              widgetImage,
            ]),
            Column(children: [_makeBox(widgets)]),
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
      var newList = <Widget>[];
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

  @override
  Widget yourWidget(BuildContext context, BookletModel? value) {
    var accessState = AccessBloc.getState(context);
    var documentParameterProcessor =
        ExtendedDocumentParameterProcessor(context, accessState);

    var groupedWidgets = <Widget>[];

    value!.sections!.forEach((element) {
      var widgets = <Widget>[];
      widgets.add(h3(context, documentParameterProcessor.process(element.title!)));
      widgets.add(_aBitSpace());
      widgets.add(text(
          context, documentParameterProcessor.process(element.description!)));
      widgets.add(_aBitSpace());
      if (element.links != null && element.links!.isNotEmpty) {
        var children = <Widget>[];
        element.links!.forEach((link) {
          children.add(button(
            context,
            label: link.linkText!,
            onPressed: () {
              EliudRouter.Router.navigateTo(context, link.action!);
            },
          ));
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

      groupedWidgets.add(_addImage(
          context,
          widgets,
          element.image,
          element.imagePositionRelative,
          element.imageAlignment,
          element.imageWidth));
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
  BookletRepository getBookletRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton
        .bookletRepository(AccessBloc.appId(context))!;
  }
}
