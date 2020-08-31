import 'dart:async';
import 'dart:math';

import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';
import 'package:eliud_pkg_fundamentals/model/listed_item_model.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:flutter/material.dart';

import 'package:eliud_pkg_fundamentals/extensions/fader_widgets/fader_widgets.dart';

class FaderComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters}) {
    return FaderComponent(faderID: id);
  }
}

class FaderComponent extends AbstractFaderComponent {
  FaderComponent({String faderID}) : super(faderID: faderID);

  Widget yourWidget(BuildContext context, FaderModel value) {
    return ImageRotater(value);
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  FaderRepository getFaderRepository() {
    return AbstractRepositorySingleton.singleton.faderRepository();
  }
}

class ImageRotater extends StatefulWidget {
  final FaderModel faderModel;

  ImageRotater(this.faderModel);

  @override
  State<StatefulWidget> createState() => new ImageRotaterState();
}

class ImageRotaterState extends State<ImageRotater> {
  List<ImageProvider> cachedImages;
  List<PosSizeModel> positionsAndSizes;
  List<ActionModel> actions;

  @override
  void didChangeDependencies() {
    List<ListedItemModel> items = widget.faderModel.items;
    cachedImages = items.map((element) =>
        AbstractPlatform.platform.getImageProvider(element.image)).toList();
    positionsAndSizes = items.map((element) => element.posSize).toList();
    actions = items.map((element) => element.action).toList();
    if (cachedImages != null) {
      cachedImages.forEach((element) {
        precacheImage(element, context);
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if ((cachedImages == null) || (cachedImages.length == 0) || (widget.faderModel.items == 0)) {
      return Text("Could not load or cache images.");
    } else {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (widget.faderModel.animation == FaderAnimation.Slide) {
        return TheImageGF(cachedImages, positionsAndSizes, actions, orientation, widget.faderModel.imageSeconds, widget.faderModel.animation, widget.faderModel.animationMilliseconds);
      } else {
        return TheImage(cachedImages, positionsAndSizes, actions, orientation, widget.faderModel.imageSeconds, widget.faderModel.animation, widget.faderModel.animationMilliseconds);
      }
      }
  }
}
