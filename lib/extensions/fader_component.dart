import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_fundamentals/extensions/fader_widgets/fader_widgets.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';
import 'package:flutter/material.dart';

class FaderComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return FaderComponent(key: key, app: app, faderId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await faderRepository(appId: app.documentID)!.get(id);
}

class FaderComponent extends AbstractFaderComponent {
  FaderComponent({Key? key, required AppModel app, required String faderId})
      : super(key: key, app: app, faderId: faderId);

  @override
  Widget yourWidget(BuildContext context, FaderModel? value) {
    var items = value!.items!;
    var images = items.map((li) => li.image).toList();
    var positionsAndSizes = items.map((element) => element.posSize).toList();
    var actions = items.map((element) => element.action).toList();
    var orientation = MediaQuery.of(context).orientation;
    return TheImageGF(images, positionsAndSizes, actions, orientation,
        value.imageSeconds, value.animationMilliseconds);
  }
}
