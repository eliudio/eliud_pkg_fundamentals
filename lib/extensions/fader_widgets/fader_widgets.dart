import 'dart:async';
import 'dart:math';

import 'package:eliud_core/core/navigate/router.dart' as EliudRouter;
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:getflutter/components/carousel/gf_carousel.dart';
import 'package:flutter/material.dart';

class TheImageGF extends StatefulWidget {
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

  TheImageGF(this.cachedImages, this.positionsAndSizes, this.actions, this.orientation, this.imageSeconds, this.animation, this.animationMilliseconds);

  @override
  State<StatefulWidget> createState() => new TheImageGFState();
}

class TheImageGFState extends State<TheImageGF> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = List();
    double maxHeight = 0;
    double maxWidth = 0;
    for (int i = 0; i < widget.cachedImages.length; i++) {
      if (widget.cachedImages[i] != null) {
        Widget w = FaderHelper.getIt(
            context,
            widget.positionsAndSizes[i],
            widget.cachedImages[i],
            widget.orientation,
            widget.actions != null ? widget.actions[i] : null,
            i);
        double height = FaderHelper.getHeight(
            context, widget.positionsAndSizes[i], widget.orientation);
        double width = FaderHelper.getWidth(
            context, widget.positionsAndSizes[i], widget.orientation);
        maxHeight = max(height, maxHeight);
        maxWidth = max(width, maxWidth);
        list.add(w);
      }
    }

    double viewPortFraction = maxWidth  / fullScreenWidth(context);
    return GFCarousel(
        height: maxHeight,
        items: list,
        autoPlay: true,
//        autoPlayInterval: const Duration(seconds: widget.faderModel.imageSeconds),
//        autoPlayAnimationDuration = const Duration(milliseconds: widget.faderModel.animationMilliseconds),
        viewportFraction: viewPortFraction,
        onPageChanged: (index) {
          setState(() {
            index;
          });
        });
  }
}

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

class FaderHelper {
  static double getHeight(BuildContext context, PosSizeModel posSizeModel,
      Orientation orientation) {
    double height = BoxFitHelper.toHeight(posSizeModel, context, orientation);
    return height;
  }

  static double getWidth(BuildContext context, PosSizeModel posSizeModel,
      Orientation orientation) {
    double width = BoxFitHelper.toWidth(posSizeModel, context, orientation);
    return width;
  }

  static Widget getIt(BuildContext context, PosSizeModel posSizeModel,
      ImageProvider imageProvider, Orientation orientation, ActionModel action, int index) {
    if (imageProvider == null)
      return null;
    BoxFit fit = BoxFitHelper.  toBoxFit(posSizeModel, orientation);
    double width = BoxFitHelper.toWidth(posSizeModel, context, orientation);
    double height = BoxFitHelper.toHeight(posSizeModel, context, orientation);
    Alignment alignment = BoxFitHelper.toAlignment(posSizeModel, orientation);

    Image realImage = Image(
      image: imageProvider,
      width: width,
      height: height,
      fit: fit,
    );

    Widget clip = null;
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

    Widget aligned = null;
    if (alignment == null) aligned = clip;
    else aligned = Align(
        alignment: alignment, child: clip, key: ValueKey<int>(index));

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
