import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_pkg_fundamentals/extensions/fader_widgets/fader_widgets.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/fader_component.dart';
import 'package:eliud_pkg_fundamentals_model/model/fader_model.dart';
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
  FaderComponent({super.key, required super.app, required super.faderId});

  @override
  Widget yourWidget(BuildContext context, FaderModel? value) {
    if (value == null) {
      return text(app, context, "No fademodel");
    } else {
      var items = value.items!;
      var member = AccessBloc.member(context);
      var images = items.map((li) => li.image).toList();
      var positionsAndSizes = items.map((element) => element.posSize).toList();
      var actions = items.map((element) => element.action).toList();
      var orientation = MediaQuery.of(context).orientation;
      return TheImageGF(
          app,
          member,
          value.background,
          images,
          positionsAndSizes,
          actions,
          orientation,
          value.imageSeconds,
          value.animationMilliseconds);
    }
  }
}
