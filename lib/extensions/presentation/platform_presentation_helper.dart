import 'package:eliud_core_main/model/platform_medium_model.dart';
import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:eliud_pkg_fundamentals_model/model/presentation_model.dart';
import 'package:flutter/cupertino.dart';

// todo: merge bookelt and presentation
class PlatformPresentationHelper {
  static Widget _makeBox(List<Widget> widgets) {
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

  static Align _toAlignment(
      PresentationImageAlignment? sectionImageAlignment, Widget widget) {
    if (sectionImageAlignment == PresentationImageAlignment.left) {
      return Align(child: widget, alignment: Alignment.topLeft);
    }
    if (sectionImageAlignment == PresentationImageAlignment.right) {
      return Align(child: widget, alignment: Alignment.topRight);
    }

    // default center
    return Align(child: widget, alignment: Alignment.topCenter);
  }

  static Widget makeContainingTable(
      BuildContext context,
      List<Widget> widgets,
      PlatformMediumModel? image,
      PresentationRelativeImagePosition? relativeImagePosition,
      PresentationImageAlignment? imageAlignment,
      double? imageSize) {
    if (image == null) {
      return _makeBox(widgets);
    }

    if ((relativeImagePosition == null) ||
        (relativeImagePosition == PresentationRelativeImagePosition.unknown)) {
      relativeImagePosition = PresentationRelativeImagePosition.above;
    }
    if ((imageAlignment == null) ||
        (imageAlignment == PresentationImageAlignment.unknown)) {
      imageAlignment = PresentationImageAlignment.left;
    }

    double? size;
    if (imageSize != null) {
      size = fullScreenWidth(context) * imageSize;
    }
    var widgetImage = Image.network(image.url!);

    if (relativeImagePosition == PresentationRelativeImagePosition.aside) {
      Widget column1;
      Widget column2;
      if (size != null) {
        column1 = Container(
          alignment: Alignment.topCenter,
          width: size, // set this
          child: widgetImage,
        );
        column2 = Container(
          alignment: Alignment.topCenter,
          width: fullScreenWidth(context) - size, // set this
          child: _makeBox(widgets),
        );
      } else {
        column1 = Column(children: [
          widgetImage,
        ]);
        column2 = Column(children: [_makeBox(widgets)]);
      }
      if (imageAlignment == PresentationImageAlignment.left) {
        return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: [column1, column2]);
      } else {
        return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: [column2, column1]);
      }
    }

    Widget alignedWidget = _toAlignment(imageAlignment, widgetImage);
    if (relativeImagePosition == PresentationRelativeImagePosition.below) {
      var widgets = <Widget>[];
      widgets.addAll(widgets);
      widgets.add(alignedWidget);
      return _makeBox(widgets);
    }
    if (relativeImagePosition == PresentationRelativeImagePosition.above) {
      var newList = <Widget>[];
      newList.add(alignedWidget);
      newList.addAll(widgets);
      return _makeBox(newList);
    }
    if (relativeImagePosition == PresentationRelativeImagePosition.behind) {
      return Stack(children: <Widget>[
        alignedWidget,
        _makeBox(widgets),
      ]);
    }
    if (relativeImagePosition == PresentationRelativeImagePosition.inFront) {
      return Stack(children: <Widget>[
        _makeBox(widgets),
        alignedWidget,
      ]);
    }

    // error, not expecting this. Anyhu... return the box, just the box, drop the image
    return _makeBox(widgets);
  }
}
