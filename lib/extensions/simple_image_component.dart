import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_fundamentals_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals_model/model/simple_image_component.dart';
import 'package:eliud_pkg_fundamentals_model/model/simple_image_model.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SimpleImageComponentConstructorDefault implements ComponentConstructor {
  @override
  Widget createNew(
      {Key? key,
      required AppModel app,
      required String id,
      Map<String, dynamic>? parameters}) {
    return SimpleImageComponent(key: key, app: app, simpleImageId: id);
  }

  @override
  Future<dynamic> getModel({required AppModel app, required String id}) async =>
      await simpleImageRepository(appId: app.documentID)!.get(id);
}

class SimpleImageComponent extends AbstractSimpleImageComponent {
  SimpleImageComponent(
      {super.key, required super.app, required super.simpleImageId});

  @override
  Widget yourWidget(BuildContext context, SimpleImageModel? value) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: value!.image!.url!,
    );
  }
}
