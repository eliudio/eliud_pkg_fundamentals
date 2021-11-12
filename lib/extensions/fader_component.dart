import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_fundamentals/extensions/fader_widgets/fader_widgets.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/fader_component.dart';
import 'package:eliud_pkg_fundamentals/model/fader_model.dart';
import 'package:eliud_pkg_fundamentals/model/fader_repository.dart';
import 'package:flutter/material.dart';

class FaderComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew({Key? key, required String id, Map<String, dynamic>? parameters}) {
    return FaderComponent(key: key, faderID: id);
  }

  @override
  Future<dynamic> getModel({required String appId, required String id}) async => await faderRepository(appId: appId)!.get(id);
}

class FaderComponent extends AbstractFaderComponent {
  FaderComponent({Key? key, required String faderID}) : super(key: key, faderID: faderID);

  @override
  Widget yourWidget(BuildContext context, FaderModel? value) {
    var items = value!.items!;
    var images = items.map((li) => li.image).toList();
    var positionsAndSizes = items.map((element) => element.posSize).toList();
    var actions = items.map((element) => element.action).toList();
    var orientation = MediaQuery.of(context).orientation;
    return TheImageGF(images, positionsAndSizes, actions, orientation, value.imageSeconds, value.animationMilliseconds);
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  FaderRepository getFaderRepository(BuildContext context) {
    return AbstractRepositorySingleton.singleton.faderRepository(AccessBloc.currentAppId(context))!;
  }
}
