import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_pkg_fundamentals/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_component.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_model.dart';
import 'package:eliud_pkg_fundamentals/model/simple_image_repository.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:flutter/material.dart';

class SimpleImageComponentConstructorDefault implements ComponentConstructor {
  Widget createNew({String id, Map<String, String> parameters}) {
    return SimpleImageComponent(simpleImageID: id);
  }
}

class SimpleImageComponent extends AbstractSimpleImageComponent {
  SimpleImageComponent({String simpleImageID}) : super(simpleImageID: simpleImageID);

  @override
  Widget yourWidget(BuildContext context, SimpleImageModel value) {
    return AbstractPlatform.platform.getImage(image: value.image);
  }

  @override
  Widget alertWidget({title = String, content = String}) {
    return AlertWidget(title: title, content: content);
  }

  @override
  SimpleImageRepository getSimpleImageRepository() {
    return AbstractRepositorySingleton.singleton.simpleImageRepository();
  }
}
