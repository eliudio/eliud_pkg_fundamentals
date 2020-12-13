
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:flutter/material.dart';

import 'package:eliud_pkg_fundamentals/extensions/fader_widgets/fader_widgets.dart';

class FaderComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({String id, Map<String, Object> parameters}) {
    return FaderComponent(faderID: id);
  }
}

class FaderComponent extends AbstractFaderComponent {
  FaderComponent({String faderID}) : super(faderID: faderID);

  @override
  Widget yourWidget(BuildContext context, FaderModel value) {
    var accessState = AccessBloc.getState(context);
    return ImageRotater(accessState, value);
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  FaderRepository getFaderRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.faderRepository(AccessBloc.appId(context));
  }
}

class ImageRotater extends StatefulWidget {
  final FaderModel faderModel;
  final AccessState state;

  ImageRotater(this.state, this.faderModel);

  @override
  State<StatefulWidget> createState() => ImageRotaterState();
}

class ImageRotaterState extends State<ImageRotater> {
  List<ImageProvider> cachedImages;
  List<PosSizeModel> positionsAndSizes;
  List<ActionModel> actions;

  @override
  void didChangeDependencies() {
    var items = widget.faderModel.items;
    cachedImages = items.map((element) =>
        AbstractPlatform.platform.getImageProvider(widget.state, element.image)).toList();
    positionsAndSizes = items.map((element) => element.posSize).toList();
    actions = items.map((element) => element.action).toList();
    if (cachedImages != null) {
      cachedImages.forEach((element) {
        try {
          precacheImage(element, context);
        } catch (_) {}
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if ((cachedImages == null) || (cachedImages.isEmpty) || (widget.faderModel.items.isEmpty)) {
      return Text('Could not load or cache images.');
    } else {
      var orientation = MediaQuery.of(context).orientation;
      return TheImageGF(cachedImages, positionsAndSizes, actions, orientation, widget.faderModel.imageSeconds, widget.faderModel.animationMilliseconds);
    }
  }
}
