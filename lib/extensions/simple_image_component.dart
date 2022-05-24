import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/tools/component/component_constructor.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_repository.dart';
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
      {Key? key, required AppModel app, required String simpleImageId})
      : super(key: key, app: app, simpleImageId: simpleImageId);

  @override
  Widget yourWidget(BuildContext context, SimpleImageModel? value) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: value!.image!.url!,
    );
  }
}
