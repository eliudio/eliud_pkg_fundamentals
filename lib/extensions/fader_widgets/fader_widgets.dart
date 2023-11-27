import 'dart:math';

import 'package:eliud_core/core/navigate/router.dart' as er;
import 'package:eliud_core/tools/etc/etc.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/model/platform_medium_model.dart';
import 'package:eliud_core_main/model/pos_size_model.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

class TheImageGF extends StatefulWidget {
  final AppModel app;
  final MemberModel? member;
  final BackgroundModel? background;
  final Orientation orientation;
  final List<PlatformMediumModel?> images;
  final List<PosSizeModel?> positionsAndSizes;
  final List<ActionModel?>? actions;
  // The time to display 1 image
  final int? imageSeconds;
  // The animation to switch images.

  // The duration of the transition between the images
  final int? animationMilliseconds;

  TheImageGF(
      this.app,
      this.member,
      this.background,
      this.images,
      this.positionsAndSizes,
      this.actions,
      this.orientation,
      this.imageSeconds,
      this.animationMilliseconds);

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
            widget.app,
            widget.member,
            widget.background,
            context,
            widget.positionsAndSizes[i],
            widget.images[i],
            widget.orientation,
            widget.actions != null ? widget.actions![i] : null,
            i);
        var height = FaderHelper.getHeight(
            context, widget.positionsAndSizes[i], widget.orientation);
        var width = FaderHelper.getWidth(
            context, widget.positionsAndSizes[i], widget.orientation);
        maxHeight = height == null ? maxHeight : max(height, maxHeight);
        maxWidth = width == null ? maxWidth : max(width, maxWidth);
        if (w != null) list.add(w);
      }
    }

    if (list.isEmpty) {
      return Container();
    } else {
      var viewPortFraction = max(maxWidth / fullScreenWidth(context), .8);
      return GFCarousel(
        height: maxHeight,
        items: list,
        autoPlay: true,
        autoPlayAnimationDuration:
            Duration(milliseconds: widget.animationMilliseconds ?? 800),
        autoPlayInterval: Duration(seconds: widget.imageSeconds ?? 4),
        viewportFraction: viewPortFraction,
      );
    }
  }
}

class FaderHelper {
  static double? getHeight(BuildContext context, PosSizeModel? posSizeModel,
      Orientation orientation) {
    return BoxFitHelper.toHeight(posSizeModel, context, orientation);
  }

  static double? getWidth(BuildContext context, PosSizeModel? posSizeModel,
      Orientation orientation) {
    return BoxFitHelper.toWidth(posSizeModel, context, orientation);
  }

  static Widget toContainer(AppModel app, MemberModel? member,
      BackgroundModel? background, Widget child) {
    return Container(
        clipBehavior:
            BoxDecorationHelper.determineClipBehaviour(app, member, background),
        margin: BoxDecorationHelper.determineMargin(app, member, background),
        padding: BoxDecorationHelper.determinePadding(app, member, background),
        decoration: BoxDecorationHelper.boxDecoration(app, member, background),
        child: child);
  }

  static Widget? getIt(
      AppModel app,
      MemberModel? member,
      BackgroundModel? background,
      BuildContext context,
      PosSizeModel? posSizeModel,
      PlatformMediumModel? imageModel,
      Orientation orientation,
      ActionModel? action,
      int index) {
    if (imageModel == null) {
      return null;
    }
    Center realImage;
    Alignment? alignment;
    if (posSizeModel == null) {
      realImage = Center(
          child: toContainer(
              app,
              member,
              background,
              Image.network(
                imageModel.url!,
/*
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
*/
              )));
    } else {
      //var width = BoxFitHelper.toWidth(posSizeModel, context, orientation);
      //var height = BoxFitHelper.toHeight(posSizeModel, context, orientation);
      alignment = BoxFitHelper.toAlignment(posSizeModel, orientation);

      realImage = Center(
          child: toContainer(
              app,
              member,
              background,
              Image.network(
                imageModel.url!,
/*
            fit: BoxFit.scaleDown,
*/
/*
            height: height,
            width: width,
*/
/*
            alignment: Alignment.center,
*/
              )));
    }
    SingleChildRenderObjectWidget clip;
    if ((posSizeModel != null) && (posSizeModel.clip != null)) {
      switch (posSizeModel.clip) {
        case ClipType.noClip:
          clip = realImage;
          break;
        case ClipType.clipOval:
          clip = ClipOval(child: realImage);
          break;
        case ClipType.clipRRect5:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(5));
          break;
        case ClipType.clipRRect10:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(10));
          break;
        case ClipType.clipRRect15:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(15));
          break;
        case ClipType.clipRRect20:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(20));
          break;
        case ClipType.clipRRect30:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(30));
          break;
        case ClipType.clipRRect40:
          clip = ClipRRect(
              child: realImage, borderRadius: BorderRadius.circular(40));
          break;
        case ClipType.unknown:
          clip = realImage;
          break;
        case null:
          clip = realImage;
          break;
      }
    } else {
      clip = realImage;
    }

    SingleChildRenderObjectWidget aligned;
    if (alignment == null) {
      aligned = clip;
    } else {
      aligned =
          Align(alignment: alignment, child: clip, key: ValueKey<int>(index));
    }

    if (action != null) {
      return GestureDetector(
          onTap: () {
            er.Router.navigateTo(context, action);
          },
          child: aligned,
          key: ValueKey<int>(index));
    } else {
      return aligned;
    }
  }
}
