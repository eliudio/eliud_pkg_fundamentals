import 'dart:math';

import 'package:eliud_core/core/navigate/router.dart' as EliudRouter;
import 'package:eliud_core/model/image_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TheImageGF extends StatefulWidget {
  final Orientation orientation;
  final List<MemberMediumModel> images;
  final List<PosSizeModel> positionsAndSizes;
  final List<ActionModel> actions;
  // The time to display 1 image
  final int imageSeconds;
  // The animation to switch images.

  // The duration of the transition between the images
  final int animationMilliseconds;

  TheImageGF(this.images, this.positionsAndSizes, this.actions, this.orientation, this.imageSeconds, this.animationMilliseconds);

  @override
  State<StatefulWidget> createState() => TheImageGFState();
}

class TheImageGFState extends State<TheImageGF> {
  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    var maxHeight = 0.0;
    var maxWidth = 0.0;
    for (var i = 0; i < widget.images.length; i++) {
      if (widget.images[i] != null) {
        var w = FaderHelper.getIt(
            context,
            widget.positionsAndSizes[i],
            widget.images[i],
            widget.orientation,
            widget.actions != null ? widget.actions[i] : null,
            i);
        var height = FaderHelper.getHeight(
            context, widget.positionsAndSizes[i], widget.orientation);
        var width = FaderHelper.getWidth(
            context, widget.positionsAndSizes[i], widget.orientation);
        maxHeight = max(height, maxHeight);
        maxWidth = max(width, maxWidth);
        list.add(w);
      }
    }

    var viewPortFraction = maxWidth  / fullScreenWidth(context);
    return GFCarousel(
        height: maxHeight,
        items: list,
        autoPlay: true,
        viewportFraction: viewPortFraction,
      );
  }
}

/*
class TheImage extends StatefulWidget {
  final Orientation orientation;
  final List<ImageProvider> cachedImages;
  final List<PosSizeModel> positionsAndSizes;
  final List<ActionModel> actions;
  // The time to display 1 image
  final int imageSeconds;
  // The animation to switch images.
  final FaderAnimation animation;

  // The duration of the transition between the images
  final int animationMilliseconds;

  TheImage(this.cachedImages, this.positionsAndSizes, this.actions, this.orientation, this.imageSeconds, this.animation, this.animationMilliseconds);

  @override
  State<StatefulWidget> createState() => new TheImageState();
}

class TheImageState extends State<TheImage> {
  int _counter = 0;
  Timer _timer;

  @override
  void initState() {
    if (_timer == null) {
      _timer = Timer.periodic(
          new Duration(seconds: widget.imageSeconds), (timer) {
        setState(() {
          int amount = widget.cachedImages.length;
          _counter = (_counter + 1) % amount;
        });
      });
    }
    super.initState();
  }

  Widget _fade(Widget realImage, int milliseconds) {
    return Container(
        child:AnimatedSwitcher(
      child: realImage,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      duration: Duration(milliseconds: milliseconds),
    )) ;
  }

  Widget _scale(Widget realImage, int milliseconds) {
    return AnimatedSwitcher(
      child: realImage,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      duration: Duration(milliseconds: milliseconds),
    );
  }

  AnimatedSwitcher _slide(Widget realImage, int milliseconds) {
    return AnimatedSwitcher(
      child: realImage,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final _offsetAnimation = Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(1.5, 0.0),
        ).animate(animation);
        return SlideTransition(
          position: _offsetAnimation,
          child: child,
        );
      },
      duration: Duration(milliseconds: milliseconds),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ImageProvider> cachedImages = widget.cachedImages;
    if (widget.positionsAndSizes[_counter] != null) {
      Widget w = FaderHelper.getIt(
          context,
          widget.positionsAndSizes[_counter],
          cachedImages[_counter],
          widget.orientation,
          widget.actions != null ? widget.actions[_counter] : null,
          _counter);
      if (w == null)
        return Text("No images available");

      int milliseconds = widget.animationMilliseconds;
      switch (widget.animation) {
        case FaderAnimation.None:
          return w;
        case FaderAnimation.Fade:
          return _fade(w, milliseconds);
        case FaderAnimation.Scale:
          return _scale(w, milliseconds);
        case FaderAnimation.Slide:
          return _slide(w, milliseconds);
        case FaderAnimation.Unknown:
          return w;
      }
      return w;
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }
}
*/

class FaderHelper {
  static double getHeight(BuildContext context, PosSizeModel posSizeModel,
      Orientation orientation) {
    return  BoxFitHelper.toHeight(posSizeModel, context, orientation);
  }

  static double getWidth(BuildContext context, PosSizeModel posSizeModel,
      Orientation orientation) {
    return BoxFitHelper.toWidth(posSizeModel, context, orientation);
  }

  static Widget getIt(BuildContext context, PosSizeModel posSizeModel,
      MemberMediumModel imageModel, Orientation orientation, ActionModel action, int index) {
    if (imageModel == null) {
      return null;
    }
    var fit = BoxFitHelper.toBoxFit(posSizeModel, orientation);
    var width = BoxFitHelper.toWidth(posSizeModel, context, orientation);
    var height = BoxFitHelper.toHeight(posSizeModel, context, orientation);
    var alignment = BoxFitHelper.toAlignment(posSizeModel, orientation);

    var realImage = Center(
          child: Image.network(
            imageModel.url,
            fit: BoxFit.scaleDown,
            height: height,
            width: width,
            alignment: Alignment.center,
          ));

    var clip;
    if (posSizeModel.clip != null) {
      switch (posSizeModel.clip) {
        case ClipType.NoClip:
          clip = realImage;
          break;
        case ClipType.ClipOval:
          clip = ClipOval(child: realImage);
          break;
        case ClipType.ClipRRect5:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(5));
          break;
        case ClipType.ClipRRect10:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(10));
          break;
        case ClipType.ClipRRect15:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(15));
          break;
        case ClipType.ClipRRect20:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(20));
          break;
        case ClipType.ClipRRect30:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(30));
          break;
        case ClipType.ClipRRect40:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(40));
          break;
        case ClipType.Unknown:
          clip = realImage;
          break;
      }
    } else {
      clip = realImage;
    }

    var aligned;
    if (alignment == null) {
      aligned = clip;
    } else {
      aligned = Align(
        alignment: alignment, child: clip, key: ValueKey<int>(index));
    }

    if (action != null) {
      return GestureDetector(
          onTap: () {
            EliudRouter.Router.navigateTo(context, action);
          },
          child: aligned,
          key: ValueKey<int>(index)
      );
    } else {
      return aligned;
    }
  }

}
